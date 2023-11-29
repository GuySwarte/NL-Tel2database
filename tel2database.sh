#!/bin/bash

# Database instellingen
DB_USER="jouw_gebruikersnaam"
DB_PASSWORD="jouw_wachtwoord"
DB_NAME="jouw_database"
DB_HOST="localhost"  # of een ander hostadres indien nodig

# Loop over alle nummers tussen 11111111 en 99999999
for i in {11111111..99999999}
do
    # Voorvoeg "06-" aan het nummer
    number="06-$i"

    # SQL-query om het nummer in de database in te voegen
    query="INSERT INTO jouw_tabelnaam (telefoonnummer) VALUES ('$number');"

    # Voer de query uit met behulp van de mysql-client
    mysql -u $DB_USER -p$DB_PASSWORD -h $DB_HOST -D $DB_NAME -e "$query"
    
    # Controleer of het uitvoeren van de query succesvol was
    if [ $? -eq 0 ]; then
        echo "Telefoonnummer $number succesvol toegevoegd aan de database."
    else
        echo "Fout bij het toevoegen van telefoonnummer $number aan de database."
    fi
done
