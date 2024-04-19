fundialog=${fundialog=dialog}
selec=`$fundialog --stdout --menu "Traeas Programadas " 0 0 3  1 "Usuario Activo" 2 "Monitoreo de aplicaciones utilizadas" 3 "Dias que incio sesion"`
    case $selec in
            1) #dialog --infobox "Usuario es sesion" 0 0; sleep 1
                chmod 755 /Proyecto/TareasUsuarios/UsuarioActivo.sh
                ./TareasUsuarios/UsuarioActivo.sh
                ./TareasUsuarios/TareasProg.sh
                ;;
            2)
		        dialog --infobox "Trabajando..." 0 0
                lsof>tareas.txt; clear;
                dialog --title "Tareas ejecutadas" --textbox tareas.txt 0 0; 
                ./TareasUsuarios/TareasProg.sh        
              ;;
            3)
dialog --title "Calendario" --calendar "Fechas" 0 0
            ;;
    esac
