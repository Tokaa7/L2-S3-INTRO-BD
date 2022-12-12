/*Exercice 1*/
/*vérification des codes régions en france*/
SELECT UPPER(société) AS "Société client", LEFT(codepostal,2) AS "code département"
FROM clients WHERE pays="France";

/*Verification des numéros tel et fax de même taille*/
SELECT c.Contact, (c.Téléphone), c.Fax
FROM clients c
WHERE  LENGTH (c.Fax)<>0 AND LENGTH(c.Téléphone) <> LENGTH (c.Fax) ;

/*veriferi si pays de livraison est différent du pays du client 
ou, même pays, même ville, mais pas même code postal*/
SELECT DISTINCT C2.Société, C1.Ville_livraison, C1.CP_livraison, C1.Pays_livraison, C2.Ville, C2.Codepostal, C2.Pays
FROM commandes C1 INNER JOIN clients C2 ON C1.Refclient=C2.Codeclient
WHERE UPPER(C1.Pays_livraison) <> UPPER (C2.Pays) OR 
(UPPER(C1.Ville_livraison)=UPPER(C2.Ville) AND C1.CP_livraison <> C2.Codepostal);


/*Un bug applicatif est soupçonné, déterminez s’il existe des commandes dont la date de commande est postérieure à la date de livraison des articles.*/
SELECT C.N°commande, C.Date_commande, C.Date_envoi, C.Pays_livraison, DATEDIFF(C.Date_envoi,C.Date_commande) AS délais_traitement
FROM commandes C
WHERE DATEDIFF(C.Date_envoi,C.Date_commande) <0;

/* Afficher la liste des codes téléphoniques et les région correspondantes des clients des états-unis*/
SELECT DISTINCT Région, LEFT(C.Téléphone,5) AS "CODE TEL"
FROM clients C
WHERE C.Pays="États-Unis" 
ORDER BY Région;

/*EXERCICE 2*/

/*1-Donner le prix moyen, maximum et minimum des produits par catégorie avec un seul décimal. */
SELECT catégorie.Nomdecatégorie, ROUND(AVG(PU),1) AS 'PU MOYEN', 
ROUND(MIN(PU),1) AS 'PU MIN', ROUND(MAX(PU),1) AS 'PU MAX'
FROM produits INNER JOIN catégorie ON produits.Refcatégorie=catégorie.Codecatégorie
GROUP BY catégorie.Codecatégorie;

/*2-Afficher le total des ventes par année, résultat formaté et trié par année */
SELECT YEAR(C.Date_commande)AS Année , SUM(D.PU*D.Quantité) AS "Total des ventes en euros"
FROM commandes C INNER JOIN détails_commandes D ON C.N°commande=D.Réfcommande
GROUP BY YEAR(C.Date_commande);

/*Temps moyen d'expédition en jour par pays de livraison (délais entre la commande et l'envoi*/
/*Utiliser DATE_DIFF, CEIL pour arrondir en entier et concat pour formater l'affichage*/
SELECT c.Pays_livraison,ceil(AVG(datediff(c.Date_envoi,c.Date_commande))) AS delai_moyen
FROM commandes c
WHERE  DATEDIFF(c.Date_envoi,c.Date_commande) >=0
GROUP BY c.Pays_livraison
ORDER BY delai_moyen DESC;

/* Afficher le total par commande du mois d'avril 2019, avant et après réduction
commandes (2 chiffres après la virgules)*/

SELECT c.Date_commande, ROUND(SUM(d.PU * d.`Quantité`),2) AS Total_Sans_Remise, 
ROUND(SUM(d.PU * d.`Quantité` * (1 - d.Remise)),2) AS Total_Après_Remise, 
ROUND((SUM(d.PU * d.`Quantité` * (1 - d.Remise)) + c.Frais_Port),2) AS Total_Avec_Frais_Port
FROM commandes c INNER JOIN détails_commandes d ON c.`N°commande`=d.`Réfcommande`
WHERE MONTH(c.Date_commande) = 4 AND YEAR(c.Date_commande) = 2019
GROUP BY c.Date_commande;

