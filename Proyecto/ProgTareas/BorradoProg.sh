fundialog=${fundialog=dialog}
min=`$fundialog --stdout --title "Ingrese el tiempo: " --inputbox "Tiempo en [min]" 0 0 `;
horas=`$fundialog --stdout --title "Ingrese el tiempo: " --inputbox "Tiempo en [Hora]" 0 0 `;
direccion=`$fundialog --stdout --title "Ingrese la direccion a borrar: " --inputbox "Direccion:" 0 0 `;
if test -f $direccion ; then
    echo "$min $horas    * * *    root   rm $direccion" >> /etc/crontab    
fi

if test -d $direccion ; then
echo "$min $horas    * * *    root   rmdir $direccion" >> /etc/crontab
fi
echo $min
echo $horas 

#cp $i $carpeta && { find . -type f -mtime +5 -exec rm -f -- {} \; ; }

