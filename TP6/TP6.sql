############################################### TP6 ########################################################

USE comptoircommandes;

## Exercice 1 ##
## Question 1 ##

SELECT SUM(détails_commandes.Quantité) AS SommeQuantité FROM détails_commandes, commandes, clients
WHERE Réfcommande = N°commande AND Refclient = Codeclient AND Société="QUICK-stop" AND YEAR(Date_commande)=2018;



## Question 2 ##

SELECT nom_catégorie,count(produits.codeproduit) AS SommeProduit FROM produits INNER JOIN catégories ON Refcatégorie = code_catégorie
GROUP BY Nom_catégorie;

SELECT max(détails_commandes.Remise) AS MaxRemise FROM détails_commandes



## Question 3 ##


