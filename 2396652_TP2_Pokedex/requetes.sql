-- 1. Quel est le nom des Pokémon qui peuvent utiliser l'attaque nommée « Growl » ?
SELECT pokemon_numeronational AS nom
FROM   pokemon_has_attaques, pokemon
WHERE  attaques_nom IS ('Growl')

-- 2. Quel est le nom des Pokémon qui n'ont pas d'évolution ?
SELECT pokemon_numeronational AS nom
FROM   pokemon_has_evolutions, pokemon
WHERE  evolutions_numeronational IS NULL;

-- 3. Quel est le nom du Pokémon dont l'évolution immédiate se nomme « Charizard » ?
SELECT numeronational
FROM   evolutions
WHERE  immediates IS ('Charizard');

-- 4. Quel est la taille minimum, maximum et moyenne des Pokémon de chaque type ?


-- 5. Quel est le nom de tous les Pokémon dont le type est « Ghost » et « Poison » ?


-- 6.Quels sont les différentes évolutions du Pokémon nommé « Eevee », leur type, ainsi que l'item nécessaire pour évoluer ?


-- 7.Quel est le nom et la description des attaques très efficaces et contre les Pokémon de type « Grass » et contre ceux de type « Steel » ?
SELECT nom, description
FROM   attaques
WHERE  type_efficace IS ('Grass', 'Steel');

-- 8.Quelle est la force moyenne des attaques du Pokemon nommé « Snorlax » ?


-- 9.Listez le nom des attaques ainsi que leur force en ordre croissant de leur force et de leur nom.

