#su -
dialog --title "text" --fselect /path/to/dir height width
FILE=$(dialog --stdout --title "Please choose a file" --fselect $HOME/ 14 48)
echo "${FILE} file chosen."

#dialog --fselect ( <Full path of file selected by default> , <Picker title> , <Types of files> , <Default extension> [, <Selection mode>] ) 0 0 
#fundialog=${fundialog=dialog}
#url= '$fundialog --stdout --dselect 0 0' dialog --dselect 0 0
#./TUI.sh
