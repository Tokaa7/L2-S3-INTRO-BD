############################################### TP5 ########################################################

CREATE DATABASE IF NOT EXISTS HistoriqueClientsTP5;
USE HistoriqueClientsTP5;

## Question 1 ##

SELECT COUNT(ID_Client) FROM Clients;
SELECT COUNT(ID_Paiement) FROM Paiements WHERE Paiement='NON';
SELECT SUM(Montant) FROM Paiements WHERE Paiement='NON';

SELECT MAX(Montant) FROM Paiements WHERE Paiement='NON';
SELECT COUNT(ID_Paiement) FROM Paiements INNER JOIN Clients ON RefClient = ID_Client WHERE Nom='LOTELIER' AND Prenom='Patrick' AND Paiement='NON';
SELECT COUNT(ID_Paiement) FROM Paiements INNER JOIN Clients ON RefClient = ID_Client WHERE Ville='Lyon' AND YEAR(DateP)=2015 AND Paiement='NON';


## Question 2 ##

SELECT ID_Client, Nom, Prenom, COUNT(ID_Paiement) FROM Paiements INNER JOIN Clients ON RefClient = ID_Client WHERE Paiement='NON' GROUP BY ID_Client;

SELECT YEAR(DateP), COUNT(ID_Paiement) FROM Paiements WHERE Paiement='NON' GROUP BY YEAR(DateP);

SELECT ID_Client, Nom, Prenom, AVG(montant) FROM Paiements INNER JOIN Clients ON RefClient = ID_Client WHERE Paiement='NON' GROUP BY ID_Client;

SELECT ID_Client, Nom, YEAR(DateP), COUNT(ID_Paiement) FROM Paiements INNER JOIN Clients ON RefClient = ID_Client WHERE Paiement='NON' GROUP BY ID_Client,YEAR(DateP);
