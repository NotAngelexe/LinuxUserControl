fundialog=${fundialog=dialog}
min=`$fundialog --stdout --title "Ingrese el tiempo: " --inputbox "Tiempo en [min]" 0 0 `;
horas=`$fundialog --stdout --title "Ingrese el tiempo: " --inputbox "Tiempo en [Hora]" 0 0 `;

archivo=/home/angel/Descargas/Acopiar.sh
ruta=/home/angel/Escritorio
#min=`echo ${tiempo:0:2}`
#horas=`echo ${tiempo:3:4}`

echo $min
echo $horas 
#dialog --title "Respaldo prog" --infobox "Se va a copiar $i a $carpeta cada hora" 0 0; sleep 3
#cp $i $carpeta /etc/cron.hourly/
echo "$min $horas    * * *    root   cp -f $archivo $ruta" >> /etc/crontab
#cp $i $carpeta && { find . -type f -mtime +5 -exec rm -f -- {} \; ; }
echo "Archivo $archivo copiado en $ruta"

