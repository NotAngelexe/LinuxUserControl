#!/bin/bash
screen_color=(WHITE,BLACK,OFF)
i=0
while :
do
fundialog=${fundialog=dialog}
selec=`$fundialog --stdout --colors --menu "\Zb\Z1Escoge alguno: " 0 0 5  1 "\Z3Administracion de usuarios" 2 "\Z3Programacion de tareas" 3 "\Z3Tareas de mantenimiento Y niveles de arranque" 4 "\Z3Tareas sobre usuarios en sesion" 5 "\Z3Salir del Administrador"`


	case $selec in
		1) #dialog  --infobox "Administracion" 0 0; sleep 1
        chmod 755 /Proyecto/Admin/admin.sh
		    ./Admin/admin.sh
        selec=""
		 ;;	
		2)
            chmod 755 /Proyecto/ProgTareas/ProgTareas.sh
		    ./ProgTareas/ProgTareas.sh
            selec=""
        ;;
		3)
            chmod 755 /Proyecto/Mantenimiento/manten.sh
            ./Mantenimiento/manten.sh
            selec=""
            ;;
		4)  #dialog  --infobox "Tareas Usuarios en sesion" 0 0; sleep 1
            chmod 755 /Proyecto/TareasUsuarios/TareasUsSes.sh
		    ./TareasUsuarios/TareasUsSes.sh
        selec=""
		 ;;
        5)
            clear 
            exit
            ;;
	    esac
#echo $selec
((i++))
done



