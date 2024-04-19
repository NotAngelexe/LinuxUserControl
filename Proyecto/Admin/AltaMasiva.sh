#!/bin/bash
clear
if [ "`id -u`" != 0 ] ; then
    echo "Falta parametros"
    else
    if test $# -eq 1
    then
    echo "Parametro Correcto"
    lineas=$(wc -l $1 | cut -d " " -f 1 )
    echo "Cantidad de Usuarios agregados: $lineas"
    i=1
            arch=$(cat $1 | tr [:upper:] [:lower:] )
                    for ((i=$lineas; i>0; i--))
                    do
                    a1=$(cat $1 |head -$i | tail -1 |cut -d ":" -f 1)
                    a2=$(cat $1 |head -$i | tail -1 |cut -d ":" -f 2 | cut -c 1 )
                    n=$(cat $1 |head -$i | tail -1 |cut -d ":" -f 3 | cut -c 1)

                    users=$a1$a2$n
                    users=$(echo $users | tr [:upper:] [:lower:] | sed 's/ñ/n/g' | sed 's/á/a/g' | sed 's/é/e/g'| sed 's/í/i/g'| sed 's/ó/o/g'| sed 's/ú/u/g' | sed s/" "/""/g)
                    passw=$(cat $1 |head -$i | tail -1 |cut -d ":" -f 4 )
                    existe=$(cat /etc/shadow | grep ^"$users:")
            if [ -z $existe ]
            then
            nom=$(cat $1 |head -$i | tail -1 | cut -d ":" -f3)
            ape2=$(cat $1 |head -$i | tail -1 | cut -d ":" -f2)
            gecos=$nom$a1$ape2
            #crear=$(echo -e "$passw\n$passw\n$gecos\n\n\n\n" | useradd $users 2>/dev/null)
            crear=$(useradd -d /home/$users -s /bin/bash -m $users)
            crear2=$( echo -e "$passw\n$passw" | passwd $users 2>/dev/null)
    echo -e "Creando usuario ..."
    echo -e "Nombre Completo : $gecos"
    echo -e "Usuario: $users creado correctamente \n"
    echo -e "Usuario: $users creado correctamente \n" >> creados.txt
    else
    echo -e "Usuario : $users Existe \n"
fi
done
else
echo -e "Parametro Incorrecto \nSe debe ejecutar <Script> <parametro>"
fi
dialog --title "Usuarios" --infobox "Se agregaron $lineas usuarios" 0 0
fi
