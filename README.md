# SpriteKit Platform Template

The main objective of this project is to create a simple template to start a platform game using Swift 3.0 and SpriteKit with Tile Map Node.


How to use:

- Create a map node and configure the tile set
- Tiles that have collision need to be identified with "solid" tag in UserData
- Load your map node 
- map = MapCreator.createMap(map: node)
- Done

How it works

- MapCreator reads the map tile and create a physic body to each solid tile
- Consecutive solid tiles are merged to a single physic body
- This rule only affect the horizontal tiles

Next steps

- Merge vertical tiles
- Create a hero class
- Create a simple movement component
