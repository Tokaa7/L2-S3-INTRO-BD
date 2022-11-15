############################################### TP3 ########################################################
CREATE DATABASE IF NOT EXISTS HistoriqueClientsTP3;
USE HistoriqueClientsTP3;
## Question 1 ##

#SELECT * FROM Clients;
#UPDATE Clients SET Ville = "Grenoble", CP  = "38000" WHERE Nom = "LAPORTE";

#SELECT * FROM Paiements WHERE RefClient = '10';
#UPDATE Paiements SET DateP = DATE_ADD(DateP,INTERVAL 1 MONTH) WHERE RefClient = "10" and DateP="2014-03-09";

#SELECT * FROM Paiements INNER JOIN Clients ON Clients.ID_Client=Paiements.RefClient WHERE Nom = "POUILLON" AND Prenom = "Christian";
#UPDATE Paiements SET Paiement="OUI" WHERE Paiement = "NON" AND YEAR(DateP)<= 2010 AND RefClient=(SELECT ID_Client FROM Clients WHERE Nom = "POUILLON");

#SELECT * FROM Paiements INNER JOIN Clients ON Clients.ID_Client=Paiements.RefClient WHERE Nom = "TARISSE" AND Prenom = "Carine";
#DELETE FROM Paiements WHERE DateP='2016-07-24' AND RefClient=(SELECT ID_Client FROM Clients WHERE Nom="TARISSE" AND Prenom="Carine");

## Question 2 ##

CREATE TABLE IF NOT EXISTS ArchiveFactures(
ID_Paiement INT PRIMARY KEY AUTO_INCREMENT,
DateP DATE,
RefClient INT,
Montant INT,
Paiement TEXT(10),
Commentaire TEXT(100));

#INSERT INTO ArchiveFactures SELECT * FROM Paiements WHERE YEAR(DateP)<2005;

#DELETE FROM Paiements WHERE ID_Paiement IN (SELECT ID_Paiement FROM ArchiveFactures);
