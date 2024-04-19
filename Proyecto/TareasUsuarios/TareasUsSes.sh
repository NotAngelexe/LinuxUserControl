fundialog=${fundialog=dialog}
selec=`$fundialog --stdout --menu "Tareas de usuarios en sesion: " 0 0 2  1 "Monitoreo de inicios/terminos de sesion del usuario" 2 "Programacion de tareas al inicio de sesion"`
    case $selec in
            1)  
                who>>tiempo.txt
                chmod 755 /Proyecto/TareasUsuarios/TareasUsSes.sh
                dialog --title "Monitoreo de inicio/termino de sesion" --textbox tiempo.txt  0 0; 
                ./TareasUsuarios/TareasUsSes.sh
                selec=
                ;;
            2) chmod 755 /Proyecto/TareasUsuarios/TareasProg.sh
                #dialog --infobox "Tareas programas" 0 0; sleep 1
                ./TareasUsuarios/TareasProg.sh
                selec=
            ;;
    esac
