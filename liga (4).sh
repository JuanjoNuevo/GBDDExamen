#!/bin/bash

function anadir_equipo {
  clear
  echo "Introduzca nuevo equipo"
  read EQUIPO
  CONSULTA="insert into equipo (Nombre_equipo) values ('$EQUIPO');"
  echo $CONSULTA | mysql -u root -p1234 -t liga2asir
}

function eliminar_equipo {
  clear
  echo "Introduzca el equipo a eliminar"
  read EQUIPO
  CONSULTA="delete from equipo where Nombre_equipo=('$EQUIPO');"
  echo $CONSULTA | mysql -u root -p1234 -t liga2asir
}

function modificar_equipo {
  clear
  echo "Introduzca el equipo a modificar"
  read EQUIPO
  echo "Introduzca el nuevo nombre del equipo"
  read NUEVOEQUIPO
  CONSULTA="update equipo set Nombre_equipo = ('$NUEVOEQUIPO') where Nombre_equipo=('$EQUIPO');"
  echo $CONSULTA | mysql -u root -p1234 -t liga2asir
}

function listar_equipo {
  clear
  echo "Los equipos en la base de datos son:"
  echo ""
  echo "select * from equipo order by Nombre_equipo;" | mysql -u root -p1234 -t liga2asir
  echo "Pulsa enter para continuar"
  read
}

function anadir_jugador {
  clear
  echo "Introduzca el nombre del jugador: "
  read JUGADOR
  echo "Introduzca el nombre del equipo del jugador: "
  read EQUIPO
  IDEQUIPONEW="select ID_equipo from equipo where Nombre_equipo=('$NUEVOEQUIPO');"
  echo $IDEEQUIPONEW | mysql -u root -p1234 -t liga2asir
  CONSULTA="insert into jugador(ID_jugador,Nombre_jugador,ID_equipo) values ('$IDEEQUIPONEW','$JUGADOR','$EQUIPO');"
  echo $CONSULTA | mysql -u root -p1234 -t liga2asir
}

function eliminar_jugador {
  clear
  echo "Introduzca el nombre del jugador a eliminar:"
  read JUGADOR
  CONSULTA="delete from jugador where Nombre_jugador=('$JUGADOR');"
  echo $CONSULTA | mysql -u root -p1234 -t liga2asir
}

function modificar_jugador {
  clear
  echo "Introduzca el JUGADOR a modificar:"
  read JUGADOR
  echo "Introduzca el nombre del jugador:"
  read NOMBREJUGADOR
  echo "Introduzca el nombre del equipo:"
  read NUEVOEQUIPO
  IDEQUIPONEW="select ID_equipo from equipo where Nombre_equipo=('$NUEVOEQUIPO');"
  echo $IDEEQUIPONEW | mysql -u root -p1234 -t liga2asir
  CONSULTA="update jugador set Nombre_jugador = ('$NOMBREJUGADOR') where Nombre_jugador=('$JUGADOR');"
  echo $CONSULTA | mysql -u root -p1234 -t liga2asir
  CONSULTA="update jugador set ID_equipo = ('$IDEQUIPONEW') where Nombre_jugador=('$NOMBREJUGADOR');"
  echo $CONSULTA | mysql -u root -p1234 -t liga2asir
}

function listar_jugador {
  clear
  echo "Los jugadores en la base de datos son:"
  echo ""
  echo "select * from jugador order by Nombre_jugador;" | mysql -u root -p1234 -t liga2asir
  echo "Pulsa enter para continuar"
  read
}

while [ true ]
do
clear
echo "Equipos de la liga"
echo "select * from equipo order by Nombre_equipo;" | mysql -u root -p1234 -t liga2asir 
echo "Elegir opción:"
echo "1. Añadir equipo"
echo "2. Eliminar equipo"
echo "3. Modificar equipo"
echo "4. Listar equipos"
echo "5. Añadir jugador"
echo "6. Eliminar jugador"
echo "7. Modificar jugador"
echo "8. Listar jugadores"
echo "9. Salir"
read OPCION
case $OPCION in
1) anadir_equipo
   ;;
2) eliminar_equipo
   ;;
3) modificar_equipo
   ;;
4) listar_equipo
   ;;
5) anadir_jugador
   ;;
6) eliminar_jugador
   ;;
7) modificar_jugador
   ;;
8) listar_jugador
   ;;
9) exit 0;;
esac
done