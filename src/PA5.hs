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

-- collatzCounts
collatzCounts :: [Integer]
collatzCounts = map (collatzIterations 0) [1..] where
  collatzIterations :: Integer -> (Integer -> Integer)
  collatzIterations count 1 = count
  collatzIterations count n
    | even n = collatzIterations (count+1) (div n 2)
    | otherwise = collatzIterations (count+1) (3 * n + 1)


-- findList
-- https://stackoverflow.com/questions/55796657/finding-the-index-of-a-string-that-contains-a-substring-recursively
-- ^^^ for fmap
findList :: Eq a => [a] -> [a] -> Maybe Int
findList _ [] = Nothing
findList [] _ = Just 0
findList (x:xs) (y:ys)
  | x == y = findList xs ys
  | otherwise = fmap (1+) (findList (x:xs) ys) -- NOTE TO SELF: You can map two functions in one expression with 'fmap'


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

