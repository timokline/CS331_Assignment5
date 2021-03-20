-- FNAM: PA5.hs
-- DESC: Solutions to Assignment 5 Exercise B
-- AUTH: Timothy Albert Kline
--       Glenn G. Chappell
-- CRSE: CS F331
-- PROF: Glenn G. Chappell
-- STRT: 2021-03-16
-- UPDT: 2021-03-19
-- VERS: 1.0

module PA5 where

collatz :: Integer -> Integer
collatz n
  | even n = div n 2
  | otherwise = 3 * n + 1

collatzIterations :: Integer -> Integer
collatzIterations n 
  | n == 0 = 0
  | collatz (n+1) /= 1 = n+1

-- collatzCounts
collatzCounts :: [Integer]
collatzCounts = map collatzIterations [0..]


-- findList
findList :: Eq a => [a] -> [a] -> Maybe Int
findList _ _ = Just 42  -- DUMMY; REWRITE THIS!!!


-- operator ##
(##) :: Eq a => [a] -> [a] -> Int
_ ## _ = 42  -- DUMMY; REWRITE THIS!!!


-- filterAB
filterAB :: (a -> Bool) -> [a] -> [b] -> [b]
filterAB _ _ bs = bs  -- DUMMY; REWRITE THIS!!!


-- sumEvenOdd
sumEvenOdd :: Num a => [a] -> (a, a)
{-
  The assignment requires sumEvenOdd to be written using a fold.
  Something like this:

    sumEvenOdd xs = fold* ... xs where
        ...

  Above, "..." should be replaced by other code. The "fold*" must be
  one of the following: foldl, foldr, foldl1, foldr1.
-}
sumEvenOdd _ = (0, 0)  -- DUMMY; REWRITE THIS!!!

