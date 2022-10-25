############################################### TP1 ########################################################

CREATE DATABASE IF NOT EXISTS HistoriqueClients;
USE HistoriqueClients;

CREATE TABLE IF NOT EXISTS Clients(
ID_Client INT PRIMARY KEY AUTO_INCREMENT,
Nom TEXT(50) NOT NULL,
Prenom TEXT(50) NOT NULL,
CP INT,
Ville TEXT(50));

CREATE TABLE IF NOT EXISTS Paiements(
ID_Paiement INT PRIMARY KEY AUTO_INCREMENT,
DateP DATE,
RefClient INT,
Montant INT,
Paiement TEXT(10));

ALTER TABLE Paiements
ADD FOREIGN KEY (RefClient) REFERENCES Clients(ID_Client);

#ALTER TABLE Clients ADD Telephone INT;
#ALTER TABLE Paiements ADD Commentaire TEXT(100);

#SELECT Nom, Prenom FROM Clients;
#SELECT DISTINCT Ville FROM Clients ORDER BY Ville ASC; # ASC = croissant et DESC decroissant
#SELECT * FROM Paiements WHERE Paiement = 'NON' ORDER BY DateP DESC;
#SELECT * FROM Clients WHERE Ville = "Paris";