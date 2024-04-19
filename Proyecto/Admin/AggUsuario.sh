#usuario= dialog --title "Usuario" --inputbox "Ingresar el usuario a crear" 0 0
fundialog=${fundialog=dialog}
#read usuario
usuario=""
EXISTE=""
   while [ "$usuario" == "" ]  
          do

            usuario=`$fundialog --stdout --title "Usuario" --inputbox "Ingresa el usuario" 0 0`
            EXISTE=`cat /etc/passwd | awk -F':' '{print $1}' | egrep -x ${usuario}`


            while [ ${#EXISTE} -ne 0 ]
                do
                 usuario=""
                dialog --msgbox "** Usuario Ya Existente **" 0 0
                usuario=`$fundialog --stdout --title "Usuario" --inputbox "Ingresa el usuario" 0 0`
                EXISTE=`cat /etc/passwd | awk -F':' '{print $1}' | egrep -x ${usuario}`
                echo $EXISTE
            done
    done 
	sudo useradd -m -d /home/$usuario $usuario -s /bin/bash
	dialog --msgbox "** Usuario Creado **" 0 0
    pass=`$fundialog --stdout --passwordbox "Ingresa la contraseña" 0 0`
	# passwd $usuario $pass 
#echo "$usuario:$pass" | /usr/sbin/chpasswd
echo "${usuario}:${pass}" > /Proyecto/Admin/contra.txt
chpasswd < contra.txt
#sudo passwd  $usuario

