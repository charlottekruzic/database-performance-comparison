# projet_TDLE

- [x] Notebook : 2 points
- [ ] Fonctionnement correct : 2 points : TO CHECK
- [ ] Présentation du système NoSQL choisi : 2 points : WIP
- [ ] Avantages/inconvénients du système NoSQL choisi : 2 points : TODO 
- [ ] Comparaison sur requêtes de sélections : 4 points : 4 POINTS ?
- [ ] Comparaison sur requêtes de mise à jour (CUD) : 3 points : + 3 POINTS ??? hmmmm
- [ ] Graphiques (choix du diagrammes, incertitudes, etc.) : 1 points : TODO
- [ ] Performance avec / sans index : 2 points : TODO
- [ ] Prise en compte de la répartition des données : 2 points : TODO


- [x]  Évaluer les performances du système pour les opérations
d’insertions et mises à jour.
- [ ] Benchmarking : TODO 
Effectuer des comparaisons des performances pour un grand nombre d’insertion, de
mises à jour et de requête entre le système NoSQL et le système relationnel choisi.
- [ ] Pour le système NoSQL, essayer d’améliorer les performances de requêtes
initialement lourdes choisies : création d’index, modification du stockage, modification
des paramètres de durabilité et cohérence.
Tester l’impact sur les performances de la gestion de répliques
- [ ] Quelques exemples d’aspect à étudier particulièrement : langage de recherche,
indexation interne, support de la concurrence d’accès, architecture, technique de
distribution, réplication / fragmentation reprise sur panne, etc.

- [x] Choix du schéma
- [x] Il vous sera demandé un notebook présentant le comparatif entre les vitesses
d’exécutions des commandes CRUD pour le système relationnel et le système
NoSQL.
- [ ] Étude : présenter, expliquer et approfondir un des aspects spécifiques du
système NoSQL choisi.  
    Cela peut être :    
        - [ ] Une comparaison des performances des requêtes pour un système
        NoSQL avec un système relationnel (MySQL, postgreSQL, Oracle
        par exemple).
        - [ ] Comparer les performances avec ou sans utilisation d’index
        adaptés.
        - [ ] Évaluer l’impact en termes de performance de la réplication ou de la
        fragmentation.



TODO : au début du notebook expliquer pourquoi il faut exécuter nos scripts

en gros on a essayé de faire sur colab pour pas qu'il ait à charger et lancer sur sa machine tous les trucs
sauf que

pour avoir plusierus replica set il faut plusieurs noeuds

colab ne le permet pas

solution gratute : datastar ou je sais plus quoi
que j'ai essayé
mais ne me laissait pas changer les replica set

on a donc décidé de faire des fchiers de config comme dans le tp mongo 



pas python 3.12 - fait bugger -> 3.11