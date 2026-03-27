[addUsers.sh](https://github.com/user-attachments/files/26302998/addUsers.sh)
#!/bin/bash

# Création d'utilisateur

if [ $# -eq 0 ]; then
    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi

# Boucle récupérante les arguments du script en tant que username
for username in "$@"
do
    # Vérification de la présence de l'utilisateur créer
    if id "$username" &>/dev/null
	then
        echo "L'utilisateur $username existe déjà"
        else
        #  Création de l'utilisateur
        sudo useradd "$username" &>/dev/null

        # Vérification de la reussite de la commande précédante
        if [ $? -eq 0 ]
	 then
            echo "L'utilisateur $username a été créé"
         else
            echo "Erreur à la création de l'utilisateur $username"
        fi
    fi
done
