if ( test -f $1 ); then
chpasswd<$1
dialog --infobox "Cambio Exitoso" 0 0; sleep 2
fi 

