fundialog=${fundialog=dialog}
selec=`$fundialog --stdout --menu "Escoge alguno: " 0 0 5  0 "Usuarios en el sistema" 1 "Alta masiva de usuarios" 2 "Alta manual de usuarios" 3 "Cambio Masivo de contraseña" 4 "Cambio Manual de contraseña" `

	case $selec in
        0)
        awk -F: '{ print $1}' /etc/passwd | cut -d: -f1 /etc/passwd > usuariosSis.txt
        dialog --title "Usuarios En El Sistema" --textbox usuariosSis.txt 0 0       
        ;;
		1) 
            chmod 755 /Proyecto/Admin/AltaMasiva.sh 
            chmod 755 /Proyecto/Admin/usuarios.csv
            #dialog --infobox "Alta masiva de usuarios" 0 0; sleep 3
                    ./Admin/AltaMasiva.sh /Proyecto/Admin/usuarios.csv
           		    ./Admin/admin.sh
            selec=""
        ;;		 
		2) 
            chmod 755 /Proyecto/Admin/AggUsuario.sh
            dialog --infobox "Alta manual" 0 0; sleep 1
                        ./Admin/AggUsuario.sh
            		    ./Admin/admin.sh
            selec=""
        ;;
		3) 
            dialog --infobox "Cambio masivo" 0 0; sleep 1
#            chmod 755 /Proyecto/Admin/CambioMasivo.sh
             ./Admin/CambioMasivo.sh /Proyecto/Admin/CambioUsuarios.txt
             ./Admin/admin.sh
            selec=""
        ;;
		4)
            chmod 755 /Proyecto/Admin/ContraMan.sh 
            dialog --infobox "Cambio manual de contraseña" 0 0; sleep 1
                    ./Admin/ContraMan.sh
           		    ./Admin/admin.sh
            selec=""
        ;;


	esac
