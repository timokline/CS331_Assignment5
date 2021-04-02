-- FNAM: median.hs
-- DESC: An interactive program that calculates the median of numbers entered by the user
--       This program does the following:
--          * Print an explanatory message.
--          * Input a sequence of integers from the user, one on each line, ending with a blank line.
--          * If the list is empty, then print a message indicating this.
--            Otherwise, print a median for the list (see “Median”, below).
--          * Ask the user whether to repeat the program. If so, start over; if not, exit.
-- AUTH: Timothy Albert Kline
--       Glenn G. Chappell
-- CRSE: CS F331
-- PROF: Glenn G. Chappell
-- STRT: 2021-03-30
-- UPDT: 2021-04-02
-- VERS: 1.0
-- RSRC: http://learnyouahaskell.com/
--       https://downloads.haskell.org/~ghc/8.10.4/docs/html/libraries/

module Main where

import Control.Monad (when)
import Data.Char (toLower)
import Data.List (sort)
import Text.Read (readMaybe)

-- Dmytro: https://stackoverflow.com/questions/13673169/how-can-i-count-integers-in-a-list-of-string-haskell
isNumber :: String -> Bool
isNumber str = case reads str :: [(Int, String)] of
  [(_, "")] -> True
  _ -> False

-- extractNumber
-- May or may not contain a number
-- Output handled by handleInput
extractNumber :: String -> Maybe Int
extractNumber userInput =
  let validOutput = filter isNumber $ words userInput
      theNumber =
        if null validOutput
          then Nothing
          else readMaybe (head validOutput)
   in theNumber

-- Tikhon: https://stackoverflow.com/questions/8905272/convert-maybe-int-to-int-in-haskell
-- handleInput
-- Safely determines if a valid input was read
-- * see extractNumber*
handleInput :: String -> [Int]
handleInput theInput = case extractNumber theInput of
  Just n -> [n]
  Nothing -> []

-- getNumbers
-- Recursively asks for numerical input from the user.
-- Returns a list of valid inputs
getNumbers :: IO [Int]
getNumbers = do
  putStr "Input a number (leave blank/press enter to finish and evaluate): "
  userInput <- getLine
  if userInput /= ""
    then do
      let newEntry = handleInput userInput
      nums <- getNumbers
      return (newEntry ++ nums)
    else return []

-- evalMedian
-- Handles the output from the generated list of valid inputs from the user
-- Calls `calcMedian` to perform the logic
evalMedian :: [Int] -> IO String
evalMedian theNumbers =
  if null theNumbers
    then return "Empty list: No median computable"
    else return ("Median: " ++ show (calcMedian $ sort theNumbers))

-- calcMedian
-- Calculates the median as per description in the Exercise
-- If the number of items is even, the median is the "ceiling"
--  of the two middle numbers
calcMedian :: [Int] -> Int
calcMedian xs = middleNum
  where
    middleNum = xs !! middleIndex
    middleIndex = len `div` 2
    len = length xs

-- From http://book.realworldhaskell.org/read/io.html
isYes :: String -> Bool
isYes answer = (toLower . head $ answer) == 'y'

promptRepeat :: IO Bool
promptRepeat = do
  putStr "\nWould you like to calculate another median? [Y/n] "
  isYes <$> getLine
-- Hlinted from:
-- putStr "Would you like to calculate another median? [Y/n]"
-- promptAns <- getLine
-- return (isYes promptAns)


-- Emacs User: https://stackoverflow.com/questions/32933488/take-all-numbers-from-a-string-and-present-them-in-a-list/32933893
-- http://learnyouahaskell.com/input-and-output
-- http://book.realworldhaskell.org/read/io.html
main :: IO ()
main = do
  putStrLn "This program calculates the median of an arbitrary set of numbers."
  putStrLn "Input is asked at each line until a blank line is entered.\n"
  let median = do
        putStrLn ""
        theList <- getNumbers
        putStr "\nHere are the numbers: "
        print $ sort theList
        
        result <- evalMedian theList
        putStrLn result

        isnotdone <- promptRepeat
        when isnotdone median
  median
  putStrLn "Bye!"
