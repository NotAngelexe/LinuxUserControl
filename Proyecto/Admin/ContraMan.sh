#Cambio de contraseña

fundialog=${fundialog=dialog}
usuario=`$fundialog --stdout --title "Usuario" --inputbox "Ingresa el usuario" 0 0`
EXISTE=`cat /etc/passwd | awk -F':' '{print $1}' | egrep -x ${usuario}`
 if [ ${#EXISTE} -ne 0 ]
     then
     dialog --msgbox "** Usuario Encontrado**" 0 0
    #sudo useradd -m -d /home/$usuario $usuario -s /bin/bash
    pass=`$fundialog --stdout --passwordbox "Ingrese la nueva contraseña de:  $usuario" 0 0`
    echo "${usuario}:${pass}" > /Proyecto/Admin/contra.txt
    chpasswd < /Proyecto/Admin/contra.txt
 fi



