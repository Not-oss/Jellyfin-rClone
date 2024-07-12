#!/bin/bash
LOGFILE="/home/ubuntu/qbittorrent-rclone.log"
{
    echo "Début du script à $(date)"
    if [ -z "$1" ]; then
        echo "Erreur : chemin source vide"
        exit 1
    fi
    if [ -z "$2" ]; then
        echo "Erreur : nom de fichier vide"
        exit 1
    fi

    
    if [[ "$1" == *"/home/ubuntu/torrent/tv-sonarr"* ]]; then
        DESTINATION="5:zedfr69/Series"
    elif [[ "$1" == *"/home/ubuntu/torrent/radarr"* ]]; then
        DESTINATION="5:zedfr69/Films"
    else
        echo "Erreur : chemin source inconnu"
        exit 1
    fi

    echo "Déplacement du fichier : $1 vers $DESTINATION/$2"
    sudo /usr/bin/rclone move "$1" "$DESTINATION/$2"
    RC=$?
    if [ $RC -ne 0 ]; then
        echo "rclone move a échoué avec le code de retour $RC"
    else
        echo "rclone move réussi"
    fi
    echo "Fin du script à $(date)"
} >> "$LOGFILE" 2>&1
