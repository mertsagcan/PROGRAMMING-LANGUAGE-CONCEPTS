module PE2 where

import Text.Printf

type Point = (Int, Int)
type Dimensions = (Int, Int)
type Vector = (Int, Int)

getRounded :: Double -> Double
getRounded x = read s :: Double
               where s = printf "%.2f" x

castIntToDouble x = (fromIntegral x) :: Double

-------------------------------------------------------------------------------------------
----------------------- DO NOT CHANGE ABOVE OR FUNCTION SIGNATURES-------------------------
------------- DUMMY IMPLEMENTATIONS ARE GIVEN TO PROVIDE A COMPILABLE TEMPLATE ------------
------------------- REPLACE THEM WITH YOUR COMPILABLE IMPLEMENTATIONS ---------------------
-------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------
getVector :: String -> Vector
getVector action
    |action == "Stay" = (0, 0)
    |action == "North" = (0, 1)
    |action == "East" = (1, 0)
    |action == "West" = (-1, 0)
    |action == "South" = (0, -1)
    |action == "NorthEast" = (1, 1)
    |action == "NorthWest" = (-1, 1)
    |action == "SouthEast" = (1, -1)
    |action == "SouthWest" = (-1, -1)

-------------------------------------------------------------------------------------------------------------------------------
getAllVectors :: [String] -> [Vector]
getAllVectors actionList = map (getVector) actionList
 
-------------------------------------------------------------------------------------------------------------------------------
pointAdder :: Point -> Vector -> Point
pointAdder (currentX, currentY) (vectorX, vectorY) = (currentX + vectorX, currentY + vectorY)

pathFinder :: Point -> [Vector] -> [Vector]
pathFinder initPoint [] = []
pathFinder initPoint (x:xs) = pointAdder initPoint x : pathFinder(pointAdder initPoint x) xs

producePath :: Point -> [String] -> [Point]
producePath initPoint actionList = initPoint:(pathFinder initPoint (getAllVectors actionList))
 
-------------------------------------------------------------------------------------------------------------------------------
borderCheck :: Point -> Point -> Bool
borderCheck (px, py) (bx, by)
    |px < bx && px >= 0 && py < by && py >= 0 = True
    |px >= bx || px < 0 || py >= by || py < 0 = False 

takePathInArea :: [Point] -> Dimensions -> [Point]
takePathInArea [] border = []
takePathInArea (x:xs) border
    |borderCheck x border == True = x : takePathInArea xs border
    |borderCheck x border == False = []

-------------------------------------------------------------------------------------------------------------------------------
equalityCheck :: [Point] -> Point -> Bool
equalityCheck pathInBorders objectLocation = notElem objectLocation pathInBorders

remainingObjects :: [Point] -> Dimensions -> [Point] -> [Point]
remainingObjects path border [] = []
remainingObjects path border (x:xs)
    |equalityCheck (takePathInArea path border) x == True = x : remainingObjects path border xs
    |equalityCheck (takePathInArea path border) x == False = remainingObjects path border xs

    
-------------------------------------------------------------------------------------------------------------------------------
successfullPathFinder :: [[Point]] ->Dimensions -> [Point] -> [[Point]]
successfullPathFinder [] border objects = []
successfullPathFinder (currentPath:remainingPaths) border objects
    |length currentPath == length (takePathInArea currentPath border) && remainingObjects currentPath border objects == [] = currentPath : successfullPathFinder remainingPaths border objects
    |otherwise = successfullPathFinder remainingPaths border objects
    
lengthFinder :: [[Point]] -> [Int]
lengthFinder pathList = map (length) pathList

totalNumberOfSteps :: [Int] -> Int
totalNumberOfSteps [] = 0
totalNumberOfSteps (x:xs) = x + totalNumberOfSteps xs
    


averageStepsInSuccess :: [[Point]] -> Dimensions -> [Point] -> Double
averageStepsInSuccess paths border objects = getRounded ((castIntToDouble (totalNumberOfSteps (lengthFinder (successfullPathFinder paths border objects)))) / (castIntToDouble (length (lengthFinder (successfullPathFinder paths border objects)))))
















