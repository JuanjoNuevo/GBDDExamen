#!/bin/bash

function anadir_tirada {
  echo "Pulse Intro para mover la ruleta"
  read TECLA
  echo "CALL nueva_tirada()" | mysql -u examen_10 -p1234 -t examen_10
  echo " "
  read TECLA
  echo "Pulse Intro para continuar"
}

while [ true ]
do
echo "Resumen de las tiradas"
echo "CALL resultados()" | mysql -u examen_10 -p1234 -t examen_10
echo "Elegir opción:"
echo "1. Añadir tirada"
echo "2. Salir"
read OPCION
case $OPCION in
1) anadir_tirada
   ;;
2) exit 0;;
esac
done
