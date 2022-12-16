############################################### TP6 ########################################################

USE comptoircommandes;

## Question 1 ##

SELECT MAX(Remise) FROM détails_commandes;

SELECT SUM(détails_commandes.Quantité) AS SommeQuantité FROM détails_commandes, commandes, clients
WHERE Réfcommande = N°commande AND Refclient = Codeclient AND Société="QUICK-stop" AND YEAR(Date_commande)=2018;

SELECT Société, SUM(quantité*PU) AS SommeCommandes FROM Détails_commandes, Commandes, Clients
WHERE Réfcommande = N°commande AND Refclient = Codeclient
AND Société = "Hanari Carnes";

## Question 2 ##

SELECT Nom_catégorie, COUNT(*) AS SommeProduit FROM produits INNER JOIN catégories ON Refcatégorie = code_catégorie GROUP BY Nom_catégorie;

SELECT Pays, COUNT(*) AS NbClients FROM Clients GROUP BY Pays;

SELECT Société, COUNT(*) AS NbCommandes FROM Clients INNER JOIN Commandes ON Codeclient = Refclient GROUP BY Société;

SELECT Nom_catégorie, MIN(PU) AS PrixMin, MAX(PU) AS PrixMax, AVG(PU) AS PrixMoyen FROM Catégories INNER JOIN Produits ON Code_catégorie = Refcatégorie GROUP BY Nom_catégorie;

SELECT Société, MAX(remise) AS RemiseMax FROM Clients, Commandes, Détails_commandes WHERE Codeclient = Refclient AND N°commande = Réfcommande GROUP BY Société;

## Question 3 ##

SELECT Pays, AVG(Frais_port) FROM Clients, Commandes WHERE Codeclient = Refclient GROUP BY Pays HAVING AVG(Frais_port)>500;

SELECT Société, SUM(Quantité*PU) AS SommeCommandes FROM Clients,Commandes, Détails_commandes WHERE Codeclient = Refclient AND N°commande = Réfcommande
AND YEAR(Date_commande) = 2019 GROUP BY Société HAVING SUM(Quantité*PU)>3000;

SELECT Société, COUNT(*) AS NbCommandes FROM Clients, Commandes WHERE Codeclient = Refclient GROUP BY Société HAVING COUNT(*)<5 ;
