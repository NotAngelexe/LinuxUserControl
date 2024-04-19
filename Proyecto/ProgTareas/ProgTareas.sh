fundialog=${fundialog=dialog}
selec=`$fundialog --stdout --menu "Escoge alguno: " 0 0 4  1 "Programaciones de Tareas Manual" 2 "Respaldo Programado" 3 "Borrado de Temporales Programados" 4 "Inhabilitacion de usuarios"`
    case $selec in 
    1)      chmod 755 /Proyecto/ProgTareas/Tareasprog.sh
            dialog --title "Tareas Prog Man"; sleep 1;
            ./ProgTareas/Tareasprog.sh
            ./ProgTareas/ProgTareas.sh
    ;;
    2) #dialog --title "Respaldo Programado" --infobox "Respaldo" 0 0; sleep 1
            chmod 755 /Proyecto/ProgTareas/CopiaArch.sh
            dialog --title "Respaldo Programado"; sleep 1;
            ./ProgTareas/CopiaArch.sh
            ./ProgTareas/ProgTareas.sh
    ;;
    3)      
            chmod 755 /Proyecto/ProgTareas/BorradoProg.sh
            dialog --title "Borrado Temporal Programado"; sleep 1;
            ./ProgTareas/BorradoProg.sh
            ./ProgTareas/ProgTareas.sh
    ;;
    4)
        chmod 755 /Proyecto/ProgTareas/InUs.sh
        ./ProgTareas/InUs.sh
        ./ProgTareas.sh    
    ;;
    5);;
    esac
