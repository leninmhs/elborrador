#!/bin/bash
# Borrar todas las coincidencias de archivo1 en todos los archivos de un directorio
#
# El comando se ejecuta: ./elborrador.sh archivo1 directorio/
#
# Recibe como parametros:
#        $1 = Archivo que contiene las cadenas que seran borradas
#        $2 = Directorio donde se encuentran todos los archivos de donde eliminar las cadenas
#

archivoborrador=$1
directoriodondeborrar=$2

if [ $# -eq 0 ]
    then
	echo -e "No indico los parametros: 'archivo' 'directorio' \n"
	echo -e "    \$1 = Archivo que contiene las cadenas que seran borradas \n"
	echo -e "    \$2 = Directorio donde se encuentran todos los archivos de donde eliminar las cadenas \n\n\n"
	exit
fi

if [ -z "$1" ]
  then
	echo -e "No se indico el primer parametro (el archivo con las cadenas a borrar) \n"
	exit
fi

if [ -z "$2" ]
  then
	echo -e "No se indico el segundo parametro (el directorio donde estan los archivo donde se borraran cadenas) \n"
	exit
fi

while read line
do
        find $directoriodondeborrar -name "*.csv" -type f | xargs sed -i -e "/$line/d"
        echo -e "Borrada la cadena: $line \n"
done < $archivoborrador

#find . -name "*.csv" -type f | xargs sed -i -e '/supventastecno@hotmail.com/d'
