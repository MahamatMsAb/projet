#!/bin/bash
 #fonction pour la liste des utilisateurs
 function liste_utilisateur(){
 cat /etc/passwd | cut -d ":" -f1 > users.txt
 cat users.txt | while read lisible
 do
 ls /home/ | grep $lisible > users.txt
 done
 echo "Voila la liste des utilisateurs :"
 while read lisible
 do
 echo "-$lisible"
 done < users.txt
 }

 #fonction pour l'archivage des elements du repertoire modifier par sudoer il ya deux(2) jours
 function archivage(){
 read -p "Saisir le chemin du peripherique externe" chemin 
 utilisateur=$(cat/etc/group | grep sudo | cut -d ":" -f4)
 sudo find /home/$utilisateur/* -ctime 2 > fichier.txt
 mkdir rep_archive
 cat fichier.txt | while read lisible
 do 
 mv $lisible rep_archive
 done
 tar -cvz archive.tar rep_archive/
 gzip archive.tar
 cp archive.tar.gz $chemin
 }  

 clear

 echo "      ###########################################################################################
             #                                                                                         #
             #-----------------------------BIENVENU SUR MON PROJET SYS !-------------------------------#
             #                                                                                         #
             ###########################################################################################
                                                                              
             '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''      
             ' a ) Information des utilisateurs enrégistrés il y a trois jours !                       '  
             '                                                                                         '
             ' b ) Aquisition, installation et lancement de l'environnement XAMP !                     ' 
             '                                                                                         '
             ' c ) Archivage des élèments du repertoire personnel qui ont été modifié                  ' 
             '     par l'utilisateur sudoers il y a deux jours dans un périphérique externe !          ' 
             '                                                                                         '
             ' d ) Information sur l'utilisation du disque, de la mémoire, du processeur et du SWAP !  '
             '                                                                                         '
             ' q/Q ) Pour quitter !                                                                    '
             '                                                                                         '
             '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
             *******************************************************************************************   
             *                                                                                         * 
             *--------------------REALISER PAR MAHAMAT MOUSSA ABAKAR 16B416FS--------------------------*
             *                                                                                         *
             *******************************************************************************************"

 read -r rep

 case $rep in

    a)  liste_utilisateur() ;;

    b)  wget  https://www.apachefriends.org/xampp-files/7.0.18/xampp-osx-7.0.18-0-installer.dmg;
        sudo /opt/lampp/lampp start 2> errtest
        sudo chmod 755 xampp-linux-*-installer.run;
        sudo ./xampp-linux-*-installer.run;
        sudo /opt/lampp/lampp start;;


    c)  archivage() ;;

    d) vmstat ;; 

    q) exit ;;

    Q) exit ;;

    *) echo "Erreur de saisi ou choix inconu !" ;;    
    
 esac
