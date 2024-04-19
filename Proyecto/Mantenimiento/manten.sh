fundialog=${fundialog=dialog}
selec=`$fundialog --stdout --menu "Escoge alguno: " 0 0 5  1 "Habilitar/Inhabilitar el chequeo de volumenes" 2 "Tiempo de apagado" 3 "Arranque manual (MODO)" 4 "Chequeo de volumen" 5 "Creacion, Formato y Montaje de VOLUMENES"`

    case $selec in 

    1);;
    2)
echo "Entra"
       chmod 755 /Proyecto/Mantenimiento/TiempoApag.sh
   # dialog --infobox "Entro" 0 0
        ./Mantenimiento/TiempoApag.sh
        ./Mantenimiento/manten.sh
    ;;
    3)
      dialog --infobox "Entrara al modo mono usuario" 0 0
      init 1
    ;;
    4) lvmdiskscan>disco.txt;
    dialog --title "Chequeo de discos" --textbox disco.txt 0 0
    ;;
    5);;

    esac

