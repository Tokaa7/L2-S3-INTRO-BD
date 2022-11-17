############################################### TP2 ########################################################

CREATE DATABASE IF NOT EXISTS HistoriqueClientsTP2;
USE HistoriqueClientsTP2;

## Question 1 ##

SELECT Nom, Prenom, CP, Ville FROM Clients WHERE Nom LIKE "D%";
SELECT * FROM Clients WHERE Ville in ("Paris","Lyon","Grenoble","Nice");
SELECT * FROM Clients WHERE Ville = "NULL"; # ou VILLE is NULL;
SELECT * FROM Paiements WHERE Paiement = "NON" AND DateP BETWEEN '2015-01-01' and '2015-08-06';


## Question 2 ##			

SELECT * FROM Paiements INNER JOIN Clients ON Clients.ID_Client = Paiements.RefClient WHERE Nom = "HUVE" AND Prenom = "Myriam"; 
SELECT DISTINCT Nom,Prenom,Ville FROM Clients INNER JOIN Paiements ON ID_Client = RefClient WHERE Paiement = "NON";
SELECT DISTINCT Nom,Prenom FROM Clients INNER JOIN Paiements ON ID_Client = RefClient WHERE Paiement = 'NON' and Ville = 'PARIS';
SELECT DISTINCT Nom, Prenom FROM Clients INNER JOIN Paiements ON ID_Client = RefClient WHERE Paiement = "NON" and Montant >= 5000;
SELECT DISTINCT Nom, Prenom FROM Clients INNER JOIN Paiements ON ID_Client = RefClient WHERE Paiement = "NON" and MONTH(DateP) BETWEEN 06 AND 08;
SELECT DISTINCT Nom, Prenom FROM Clients INNER JOIN Paiements ON ID_Client = RefClient WHERE Paiement = "NON" and YEAR(DateP) < 2007;
