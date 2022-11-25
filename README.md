# Axolotl Defense

> Créé par Simon Aucoin

*Axolotl Defense* est un tower defense  inspiré du jeu mobile *Bloon Tower Defense* dont le but est de placer des axolotls pour défendre le territoire des ennemies poissons. Si le joueur survie à toutes les vagues il gagne, s'il perd tous ses points de vie il perd.

## Path follow
Dans le concept du jeu, les ennemies doivent parcourir un chemin prédéfinie pour se rendre jusqu'à la fin où ils feront perdre des points de vie au joueur s'ils y arrivent.

Les poissons sont alors attachés au nœud du *Path* qu'ils suivront jusqu'à leur mort ou à leur arrivée à la fin du trajet où ils seront supprimés.
![image](https://user-images.githubusercontent.com/34407178/204001595-ca695fa4-aa62-4942-90de-9a7db5502236.png)

Pour comprendre comment utiliser cet algorithme j'ai suivi cette [vidéo](https://www.youtube.com/watch?v=JBQgmy3Oiw4&list=PLZ-54sd-DMAJltIzTtZ6ZhC-9hkqYXyp6&index=7).

## Détection d'ennemie
Pour que les axolotls puissent attaquer, il y a un signal dans la range de l'axolotl qui détecte lorsqu'un ennemie entre en contact avec celle-ci. Dans cette situation le poisson devient la cible de l'axolotl jusqu'à sa mort ou lorsqu'il quittera la *range*.

Un *timer* permet de réguler la vitesse d'attaque qui diffère pour chaque axolotl.
![image](https://user-images.githubusercontent.com/34407178/204002111-3dc52451-4b27-4cac-b5ee-6da914ffe0b5.png)

Pour comprendre comment utiliser cet algorithme j'ai suivi cette [vidéo](https://www.youtube.com/watch?v=ugNRDsl33OI&list=PLZ-54sd-DMAJltIzTtZ6ZhC-9hkqYXyp6&index=9).
