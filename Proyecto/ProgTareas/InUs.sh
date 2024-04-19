fundialog=${fundialog=dialog}
user=`$fundialog --stdout --title "Usuario" --inputbox "Ingresa el usuario" 0 0`

    EXISTE=`cat /etc/passwd | awk -F':' '{print $1}' | egrep -x ${user}`
     if [ ${#EXISTE} -ne 0 ]; then
            cat /etc/shadow| grep "$user" | awk -F':' '{print $2 }' > Encriptado.txt 
            #cadena=`$fundialog --stdout --title "Usuario lock" --textbox Encriptado.txt 0 0`
            cadena=`cat Encriptado.txt`
            substr=`echo ${cadena:0:1}`


            var=`echo $substr | grep "!" | wc -l`
                if [ $var -ge 1 ];then
                    dialog --msgbox "Usuario bloqueado " 0 0; 
                     dialog --stdout --yesno "¿Desea desbloquear a $user?" 0 0
                case "$?" in
                '0') 
                    min=`$fundialog --stdout --title "Ingrese el tiempo para desbloquear: " --inputbox "Tiempo en [min]" 0 0 `;
                    horas=`$fundialog --stdout --title "Ingrese el tiempo para desbloquear: " --inputbox "Tiempo en [Hora]" 0 0 `;  
                    
                    echo "$min $horas    * * *    root   passwd -u $user" >> /etc/crontab
                       dialog --infobox "El usuario se va a desbloquear a las $horas : $min" 0 0; sleep 3  
                  ;;
                '1') ./ProgTareas/ProgTareas.sh   
                  ;;
                    esac
                    
                else 

	                 dialog --msgbox "Usuario desbloqueado" 0 0 ;

                     dialog --stdout --yesno "¿Desea bloquear a $user?" 0 0
                case "$?" in
                '0') 
                       #dialog --infobox "Usuario bloqueado" 0 0; sleep 3  
                    min=`$fundialog --stdout --title "Ingrese el tiempo para bloquear: " --inputbox "Tiempo en [min]" 0 0 `;
                    horas=`$fundialog --stdout --title "Ingrese el tiempo para bloquear: " --inputbox "Tiempo en [Hora]" 0 0 `;  
                    
                    echo "$min $horas    * * *    root   passwd -l $user" >> /etc/crontab
                       dialog --infobox "El usuario se va a bloquear a las $horas : $min" 0 0; sleep 3  
 

                  ;;
                '1') ./ProgTareas/ProgTareas.sh   
                  ;;
                    esac

                fi

     else dialog --msgbox "Usuario no existente" 0 0  
    fi

#e
