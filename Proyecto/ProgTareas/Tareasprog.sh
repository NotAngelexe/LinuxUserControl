fundialog=${fundialog=dialog}
min=`$fundialog --stdout --title "Ingrese el tiempo: " --inputbox "Tiempo en [min]" 0 0 `;
horas=`$fundialog --stdout --title "Ingrese el tiempo: " --inputbox "Tiempo en [Hora]" 0 0 `;
comando=`$fundialog --stdout --title "Ingrese el coamando a ejecutar " --inputbox "Ingrese el Comm [param][param] " 0 0 `;

echo $min
echo $horas 
#dialog --title "Respaldo prog" --infobox "Se va a copiar $i a $carpeta cada hora" 0 0; sleep 3
#cp $i $carpeta /etc/cron.hourly/
echo "$min $horas    * * *    root   $comando" >> /etc/crontab
#cp $i $carpeta && { find . -type f -mtime +5 -exec rm -f -- {} \; ; }
