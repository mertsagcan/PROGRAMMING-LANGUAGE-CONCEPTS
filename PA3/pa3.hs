module PE3 where

-- can use these if you want to...
import Data.List
import Data.Maybe

data Private = Private { idNumber :: Int, height :: Int, timeToSwap :: Int } deriving Show

data Cell = Empty | Full Private deriving Show

type Area = [[Cell]] 

---------------------------------------------------------------------------------------------
------------------------- DO NOT CHANGE ABOVE OR FUNCTION SIGNATURES-------------------------
--------------- DUMMY IMPLEMENTATIONS ARE GIVEN TO PROVIDE A COMPILABLE TEMPLATE ------------
--------------------- REPLACE THEM WITH YOUR COMPILABLE IMPLEMENTATIONS ---------------------
---------------------------------------------------------------------------------------------


-- Note: undefined is a value that causes an error when evaluated. Replace it with
-- a viable definition! Name your arguments as you like by changing the holes: _


--------------------------
-- Part I: Warming up with Abstractions

-- bubbleHumans: Applying a parallel bubble step on integers.
swapElem :: Int -> Int -> [Int] -> [Int]
swapElem i j heights = let elemI = heights !! i
                           elemJ = heights !! j
                           left = take i heights
                           middle = take(j - i - 1) (drop (i + 1) heights)
                           right = drop (j + 1) heights
                       in left ++ [elemJ] ++ middle ++ [elemI] ++ right
                       
descendingSort :: Int -> [Int] -> [Int]
descendingSort i heights 
    | (i + 1) < length heights && (heights !! i) < (heights !! (i + 1)) = descendingSort (i + 2) (swapElem i (i + 1) heights)
    | (i + 1) < length heights && (heights !! i) >= (heights !! (i + 1)) = descendingSort (i + 1) heights
    | otherwise = heights
 
bubbleHumans :: [Int] -> [Int]
bubbleHumans heights = descendingSort 0 heights

-- bubblePrivates: The same thing, but on privates with a key function and an asc/desc option.

swapElemPriv :: Int -> Int -> [Private] -> [Private]
swapElemPriv i j heights = let elemI = heights !! i
                               elemJ = heights !! j
                               left = take i heights
                               middle = take(j - i - 1) (drop (i + 1) heights)
                               right = drop (j + 1) heights
                           in left ++ [elemJ] ++ middle ++ [elemI] ++ right

descendingSortPriv :: (Private -> Int) -> Int -> [Private] -> [Private]
descendingSortPriv param i heights 
    | (i + 1) < length heights && param (heights !! i) < param (heights !! (i + 1)) = descendingSortPriv param (i + 2) (swapElemPriv i (i + 1) heights)
    | (i + 1) < length heights && param (heights !! i) >= param (heights !! (i + 1)) = descendingSortPriv param (i + 1) heights
    | otherwise = heights

ascendingSortPriv :: (Private -> Int) -> Int -> [Private] -> [Private]
ascendingSortPriv param i heights 
    | (i + 1) < length heights && param (heights !! i) > param (heights !! (i + 1)) = ascendingSortPriv param (i + 2) (swapElemPriv i (i + 1) heights)
    | (i + 1) < length heights && param (heights !! i) <= param (heights !! (i + 1)) = ascendingSortPriv param (i + 1) heights
    | otherwise = heights

bubblePrivates :: (Private -> Int) -> Bool -> [Private] -> [Private]
bubblePrivates param ascOrDesc privList 
    |ascOrDesc == True = descendingSortPriv param 0 privList
    |ascOrDesc == False = ascendingSortPriv param 0 privList
    
    
-- sortPrivatesByHeight: Full sort via multiple bubble steps, calculate the sorting time too!

sortCheck :: [Private] -> Bool
sortcheck [] = True
sortCheck [x] = True
sortCheck (x:y:xs) = height x >= height y && sortCheck (y:xs)

sortByHeight:: Int -> [Private] -> [Private]
sortByHeight time privList 
    |sortCheck privList == True = privList
    |sortCheck privList == False = sortByHeight time (bubblePrivates height True privList)
    

sortPrivatesByHeight :: [Private] -> ([Private], Int)
sortPrivatesByHeight privList = (sortByHeight 0 privList, 0)


--------------------------
-- Part II: Squeezing your Brain Muscles

-- ceremonialFormation: Sorting again, but with multiple files. Don't forget the time!
ceremonialFormation :: Area -> (Area, Int)
ceremonialFormation _ = ([], 0)

-- swapPrivates: Swap two arbitrary privates by ID if they are in the area. Big ouch!
swapPrivates :: Int -> Int -> Area -> Area
swapPrivates _ _ _ = []

-- Best of luck to you, friend and colleague!



















