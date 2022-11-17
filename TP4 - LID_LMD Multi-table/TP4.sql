############################################### TP4 ########################################################

CREATE DATABASE IF NOT EXISTS comptoircommandes;
USE comptoircommandes;

## Question 1 ##

SELECT Société, Contact FROM Clients ORDER BY Société;
SELECT * FROM Clients c INNER JOIN Commandes d ON d.RefClient = c.CodeClient WHERE c.Société = 'Quick-stop' ORDER BY d.date_commande DESC;
SELECT * FROM Commandes WHERE Date_envoi IS NULL;
SELECT * FROM Produits WHERE Unités_en_stock = 0 AND Niveau_réapprovisionnement = 0;
SELECT Nom_produit, Nom_catégorie FROM Produits, Catégories WHERE Refcatégorie = Code_catégorie ORDER BY Nom_catégorie;


## Question 2 ##

UPDATE Clients SET fax = '0372-035199' WHERE Société = 'Quick-Stop';
UPDATE Clients SET contact = 'Gérard Monier', Fonction = 'Directeur' WHERE Société = 'Folies Gourmandes';
UPDATE Commandes SET Frais_Port = Frais_port*1.05 WHERE Ville_livraison = 'Seattle' AND YEAR(Date_commande)>=2010;

UPDATE Détails_commandes SET Remise = 0.2 
WHERE Réfproduit = (SELECT Réfproduit FROM Produits WHERE Nom_produit = 'Mascarpone Fabioli') 
AND Réfcommande IN (SELECT N°commande FROM Commandes WHERE(Date_commande)=2019);


## Question 3 ##

SELECT codeproduit,NOM_produit FROM produits, clients, commandes, détails_commandes
WHERE Refclient = codeclient AND Société = 'Quick-Stop'
AND Réfproduit=codeproduit
AND N°commande=Réfcommande;

SELECT * FROM commandes
WHERE Date_envoi > Àlivrer_avant;

SELECT DISTINCT contact,pays_livraison
FROM clients INNER JOIN commandes ON refclient=codeclient
WHERE pays_livraison='Venezuela';

SELECT DISTINCT société,nom_produit,date_commande
FROM produits,détails_commandes,clients, commandes 
WHERE codeproduit=réfproduit
AND réfcommande=N°Commande
AND Refclient=codeclient
AND nom_produit='Tarte au sucre' AND YEAR(date_commande)=2019;

SELECT DISTINCT société, nom_catégorie
FROM catégories,détails_commandes, commandes, clients,produits
WHERE refcatégorie=code_catégorie
AND codeproduit=réfproduit
AND réfcommande=N°Commande
AND refclient=codeclient
AND société = 'Hanari Carnes';
