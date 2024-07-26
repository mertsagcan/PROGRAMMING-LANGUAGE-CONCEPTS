module PE4 where

import Data.List
import Data.Maybe

data Room = SeedStorage Int
          | Nursery Int Int
          | QueensChambers
          | Tunnel
          | Empty
          deriving Show

data Nestree = Nestree Room [Nestree] deriving Show

---------------------------------------------------------------------------------------------
------------------------- DO NOT CHANGE ABOVE OR FUNCTION SIGNATURES-------------------------
--------------- DUMMY IMPLEMENTATIONS ARE GIVEN TO PROVIDE A COMPILABLE TEMPLATE ------------
--------------------- REPLACE THEM WITH YOUR COMPILABLE IMPLEMENTATIONS ---------------------
---------------------------------------------------------------------------------------------

-- Note: undefined is a value that causes an error when evaluated. Replace it with
-- a viable definition! Name your arguments as you like by changing the holes: _

---------------------------------------------------------------------------------------------

-- Q1: Calculate the nutrition value of a given nest.

nutritionOfRoom :: Room -> Int
nutritionOfRoom (SeedStorage seed) = 3 * seed
nutritionOfRoom (Nursery egg larvae) = 7 * egg + 10 * larvae
nutritionOfRoom QueensChambers = 0
nutritionOfRoom Tunnel = 0
nutritionOfRoom Empty = 0

traverseTree :: Nestree -> [Room]
traverseTree (Nestree parent branches) = parent : (concatMap (traverseTree) branches)

helper :: [Room] -> [Int]
helper roomList = map nutritionOfRoom roomList

listAdder :: [Int] -> Int
listAdder [] = 0
listAdder (x:xs) = x + listAdder xs

nestNutritionValue :: Nestree -> Int
nestNutritionValue nest =  listAdder (helper (traverseTree nest))

-- Q2: Calculate the nutrition value of each root-to-leaf path.


pathNutritionValues :: Nestree -> [Int]
pathNutritionValues nest = [0]



























-- Q3: Find the depth of the shallowest tunnel, if you can find one.
shallowestTunnel :: Nestree -> Maybe Int
shallowestTunnel _ = undefined

-- Q4: Find the path to the Queen's Chambers, if such a room exists.
pathToQueen :: Nestree -> Maybe [Room]
pathToQueen _ = undefined

-- Q5: Find the quickest depth to the Queen's Chambers, including tunnel-portation :)
quickQueenDepth :: Nestree -> Maybe Int
quickQueenDepth _ = undefined

-- Example nest given in the PDF.
exampleNest :: Nestree
exampleNest = 
  Nestree Tunnel [
    Nestree (SeedStorage 15) [
      Nestree (SeedStorage 81) []
    ],
    Nestree (Nursery 8 16) [
      Nestree Tunnel [
        Nestree QueensChambers [
          Nestree (Nursery 25 2) []
        ]
      ]
    ],
    Nestree Tunnel [
      Nestree Empty [],
      Nestree (SeedStorage 6) [
        Nestree Empty [],
        Nestree Empty []
      ]
    ]
  ]

-- Same example tree, with tunnels replaced by Empty
exampleNestNoTunnel :: Nestree
exampleNestNoTunnel = 
  Nestree Empty [
    Nestree (SeedStorage 15) [
      Nestree (SeedStorage 81) []
    ],
    Nestree (Nursery 8 16) [
      Nestree Empty [
        Nestree QueensChambers [
          Nestree (Nursery 25 2) []
        ]
      ]
    ],
    Nestree Empty [
      Nestree Empty [],
      Nestree (SeedStorage 6) [
        Nestree Empty [],
        Nestree Empty []
      ]
    ]
  ]
