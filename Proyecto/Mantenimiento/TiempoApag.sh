fundialog=${fundialog=dialog}
var=`$fundialog --stdout --title "Tiempo" --inputbox "Ingresa el tiempo:" 0 0`

while [ $var -ge 1 ] 
do
dialog --title "Tiempo" --infobox "Tiempo restante hasta el apagado $var" 0 0; sleep 1
var=`expr $var "-" 1`
done 
dialog --title "Confirmar" --msgbox "Se apagara el pc" 0 0
init 0
