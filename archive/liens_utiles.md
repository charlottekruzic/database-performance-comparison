https://data.strasbourg.eu/explore/dataset/gens_du_voyage/table/

https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-principaux-etablissements-enseignement-superieur/export/?disjunctive.type_d_etablissement&disjunctive.typologie_d_universites_et_assimiles

https://cassandra.apache.org/_/quickstart.html


Téléchargement de l'image Docker de Cassandra la plus récente.
``` console
PS C:\Users\charl\Desktop\projet_TDLE> docker pull cassandra:latest   

latest: Pulling from library/cassandra
6414378b6477: Pull complete
17da8ec43a12: Pull complete
d12988e90d61: Pull complete
f4d133ca2b7f: Pull complete
143733ae87a4: Pull complete
6717475e96f8: Pull complete
f189a9d82ae7: Pull complete
09bb1bb42e9a: Pull complete
10154685d2bd: Pull complete
2bfd35935537: Pull complete
Digest: sha256:5d4795c41491654e2bda432179e020c7c2cd702bbb22b7d1314747658efd71b4
Status: Downloaded newer image for cassandra:latest
docker.io/library/cassandra:latest

What's next:
    View a summary of image vulnerabilities and recommendations → docker scout quickview cassandra:latest
```

Création d'un réseau Docker isolé
``` console
PS C:\Users\charl\Desktop\projet_TDLE> docker network create cassandra
```

Lancement du conteneur Cassandra connecté au réseau isolé
``` console
PS C:\Users\charl\Desktop\projet_TDLE> docker run --rm -d --name cassandra --hostname cassandra --network cassandra cassandra

f9f424f7f8e46f5e2ae76e35615515d8267c7f67d624ba2abed2f23e508d8e40    
```


``` console
PS C:\Users\charl\Desktop\projet_TDLE> docker run --name cassandra -d cassandra
```

``` console
PS C:\Users\charl\Desktop\projet_TDLE> docker exec -it cassandra cqlsh
Connected to Test Cluster at 127.0.0.1:9042
[cqlsh 6.2.0 | Cassandra 5.0.2 | CQL spec 3.4.7 | Native protocol v5]
Use HELP for help.
```
``` console
cqlsh> CREATE KEYSPACE IF NOT EXISTS curiexplore
LICATION = { 'class' : 'SimpleStrategy', 'replicat   ... WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };  
``

``` console
cqlsh> USE curiexplore;
```
``` console
cqlsh:curiexplore> CREATE TABLE IF NOT EXISTS pays (
               ...     iso3 TEXT PRIMARY KEY,
               ...     name_en TEXT,
               ...     name_fr TEXT,
               ...     name_native TEXT,
               ...     iso2 TEXT,
               ...     borders TEXT,
               ...     flag TEXT,
               ...     latlng TEXT,
               ...     wikidata TEXT,
               ...     bologne BOOLEAN,
               ...     embassy BOOLEAN,
               ...     arab_world BOOLEAN,
               ...     central_europe_and_the_baltics BOOLEAN,      
               ...     east_asia_pacific BOOLEAN,
               ...     euro_area BOOLEAN,
               ...     europe_central_asia BOOLEAN,
               ...     european_union BOOLEAN,
               ...     high_income BOOLEAN,
               ...     latin_america_caribbean BOOLEAN,
               ...     low_income BOOLEAN,
               ...     lower_middle_income BOOLEAN,
               ...     middle_east_north_africa BOOLEAN,
               ...     north_america BOOLEAN,
               ...     oecd_members BOOLEAN,
               ...     sub_saharan_africa BOOLEAN,
               ...     upper_middle_income BOOLEAN,
               ...     world BOOLEAN,
               ...     link TEXT,
               ...     website TEXT,
               ...     south_america BOOLEAN,
               ...     central_america_caraibes BOOLEAN,
               ...     cocac BOOLEAN,
               ...     continental_europe BOOLEAN,
               ...     asia_oceania BOOLEAN,
               ...     cf_mobility TEXT,
               ...     idpaysage TEXT,
               ...     curiexplore BOOLEAN,
               ...     idh_group TEXT,
               ...     idh_group_countries TEXT,
               ...     ue27 BOOLEAN,
               ...     g7 BOOLEAN,
               ...     g20 BOOLEAN,
               ...     geometry TEXT
               ... );
```


Ouverture d'un autre terminal pour importer le fichier de données dans le docker :

``` console
PS C:\Users\charl\Desktop\projet_TDLE> docker cp ./data/curiexplore-pays.csv cassandra:/curiexplore-pays.csv

Successfully copied 635kB to cassandra:/curiexplore-pays.csv
```
``` console
PS C:\Users\charl\Desktop\projet_TDLE> docker exec -it cassandra bash

root@cassandra:/# ls /
bin                                          libx32
boot                                         media
__cacert_entrypoint.sh                       mnt
curiexplore-pays.csv                         opt
dev                                          proc
PS C:\Users\charl\Desktop\projet_TDLE> docker exec -it cassandra bash
root@cassandra:/# ls /
bin                                          libx32
boot                                         media
__cacert_entrypoint.sh                       mnt
curiexplore-pays.csv                         opt
PS C:\Users\charl\Desktop\projet_TDLE> docker exec -it cassandra bash
root@cassandra:/# ls /
bin                                          libx32
boot                                         media
PS C:\Users\charl\Desktop\projet_TDLE> docker exec -it cassandra bash
root@cassandra:/# ls /
PS C:\Users\charl\Desktop\projet_TDLE> docker exec -it cassandra bash
PS C:\Users\charl\Desktop\projet_TDLE> docker exec -it cassandra bash
root@cassandra:/# ls /
bin                                          libx32
boot                                         media
__cacert_entrypoint.sh                       mnt
curiexplore-pays.csv                         opt
dev                                          proc
etc                                          root
home                                         run
import_curiexplore_pays.err                  sbin
import_curiexplore_pays.err.20241029_172947  srv
import_curiexplore_pays.err.20241029_173055  sys
import_curiexplore_pays.err.20241029_173105  tmp
lib                                          usr
lib32                                        var
lib64
```

Chargement des données dans la BD

``` console
cqlsh:curiexplore> COPY curiexplore.pays (
    iso3, name_en, name_fr, name_native, iso2, borders, flag, latlng,
    wikidata, bologne, embassy, arab_world, central_europe_and_the_baltics,
    east_asia_pacific, euro_area, europe_central_asia, european_union,
    high_income, latin_america_caribbean, low_income, lower_middle_income,
    middle_east_north_africa, north_america, oecd_members, sub_saharan_africa,
    upper_middle_income, world, link, website, south_america, central_america_caraibes,
    cocac, continental_europe, asia_oceania, cf_mobility, idpaysage, curiexplore,
    idh_group, idh_group_countries, ue27, g7, g20, geometry
) 
FROM '/curiexplore-pays.csv' WITH DELIMITER=';';

Using 15 child processes

Starting copy of curiexplore.pays with columns [iso3, name_en, name_fr, name_native, iso2, borders, flag, latlng, wikidata, bologne, embassy, arab_world, central_europe_and_the_baltics, east_asia_pacific, euro_area, europe_central_asia, european_union, high_income, latin_america_caribbean, low_income, lower_middle_income, middle_east_north_africa, north_america, oecd_members, sub_saharan_africa, upper_middle_income, world, link, website, south_america, central_america_caraibes, cocac, continental_europe, asia_oceania, cf_mobility, idpaysage, curiexplore, idh_group, idh_group_countries, ue27, g7, g20, geometry].

Failed to import 13 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 1 of 5  
Failed to import 11 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 1 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 1 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 1 of 5  
Failed to import 15 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 1 of 5  
Failed to import 11 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 2 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 1 of 5  
Failed to import 13 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 2 of 5  
Failed to import 17 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 1 of 5  
Failed to import 14 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 1 of 5  
Failed to import 11 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 3 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 2 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 1 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 2 of 5  
Failed to import 15 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 2 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 2 of 5  
Failed to import 13 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 3 of 5  
Failed to import 14 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 2 of 5  
Failed to import 11 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 4 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 3 of 5  
Failed to import 17 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 2 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 2 of 5  
Failed to import 13 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 4 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 3 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 3 of 5  
Failed to import 15 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 3 of 5  
Failed to import 14 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 3 of 5  
Failed to import 11 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  given up after 5 attempts
Failed to import 13 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  given up after 5 attempts
Failed to import 15 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 4 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 4 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 3 of 5  
Failed to import 17 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 3 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 4 of 5  
Failed to import 14 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 4 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 4 of 5  
Failed to import 15 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  given up after 5 attempts
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  given up after 5 attempts
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 4 of 5  
Failed to import 17 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  will retry later, attempt 4 of 5  
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  given up after 5 attempts
Failed to import 14 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  given up after 5 attempts
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  given up after 5 attempts
Failed to import 20 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  given up after 5 attempts
Failed to import 17 rows: InvalidRequest - Error from server: code=2200 [Invalid query] message="Batch too large",  given up after 5 attempts

Failed to process 150 rows; failed rows written to import_curiexplore_pays.err
Processed: 217 rows; Rate:     314 rows/s; Avg. rate:     483 rows/s 
67 rows imported from 1 files in 0.449 seconds (0 skipped).
```

```console
cqlsh:curiexplore> COPY curiexplore.pays (     iso3, name_en, name_fr, name_native, iso2, borders, flag, latlng,     wikidata, bologne, embassy, arab_world, central_europe_and_the_baltics,     east_asia_pacific, euro_area, europe_central_asia, european_union,     high_income, latin_america_caribbean, low_income, lower_middle_income,     middle_east_north_africa, north_america, oecd_members, sub_saharan_africa,     upper_middle_income, world, link, website, south_america, central_america_caraibes,     cocac, continental_europe, asia_oceania, cf_mobility, idpaysage, curiexplore,     idh_group, idh_group_countries, ue27, g7, g20, geometry ) FROM '/curiexplore-pays.csv' WITH DELIMITER=';' AND NUMPROCESSES=1 AND MAXBATCHSIZE=5;

Using 1 child processes

Starting copy of curiexplore.pays with columns [iso3, name_en, name_fr, name_native, iso2, borders, flag, latlng, wikidata, bologne, embassy, arab_world, central_europe_and_the_baltics, east_asia_pacific, euro_area, europe_central_asia, european_union, high_income, latin_america_caribbean, low_income, lower_middle_income, middle_east_north_africa, north_america, oecd_members, sub_saharan_africa, upper_middle_income, world, link, website, south_america, central_america_caraibes, cocac, continental_europe, asia_oceania, cf_mobility, idpaysage, curiexplore, idh_group, idh_group_countries, ue27, g7, g20, geometry].
Processed: 217 rows; Rate:     371 rows/s; Avg. rate:     552 rows/s
217 rows imported from 1 files in 0.393 seconds (0 skipped).
```

Checker si on a bien les données :

```console
cqlsh:curiexplore> SELECT COUNT(*) FROM curiexplore.pays;

 count
-------
   217

(1 rows)

Warnings :
Aggregation query used without partition key
```

``` console
SELECT * FROM curiexplore.pays LIMIT 1;
```


