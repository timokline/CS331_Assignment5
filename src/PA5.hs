-- FNAM: PA5.hs
-- DESC: Solutions to Assignment 5 Exercise B
-- AUTH: Timothy Albert Kline
--       Glenn G. Chappell
-- CRSE: CS F331
-- PROF: Glenn G. Chappell
-- STRT: 2021-03-16
-- UPDT: 2021-03-27
-- VERS: 1.0
-- RSRC: http://learnyouahaskell.com/
--       https://downloads.haskell.org/~ghc/8.10.4/docs/html/libraries/

module PA5 where

-- collatzCounts
collatzCounts :: [Integer]
collatzCounts = map (collatzCounts' 0) [1..] where
   collatzCounts' :: Integer -> (Integer -> Integer)
   collatzCounts' count 1 = count
   collatzCounts' count n
      | even n = collatzCounts' (count+1) (div n 2)
      | otherwise = collatzCounts' (count+1) (3 * n + 1)


-- findList
-- https://stackoverflow.com/questions/55796657/finding-the-index-of-a-string-that-contains-a-substring-recursively
-- ^^^ for fmap
-- findList [] _ = Just 0
-- findList (x:xs) (y:ys) -- FAILS #4 & #5
--    | x /= y = fmap (1+) (findList (x:xs) ys) -- NOTE TO SELF: You can map two functions in one expression with 'fmap'
--    | otherwise = findList xs ys
-- randomusername: https://stackoverflow.com/questions/29516517/how-can-i-find-the-index-where-one-list-appears-as-a-sublist-of-another
--       pair two lists' elements as tuples
--       check if they are equal...
--       for each pair made by `zip`
--       else, add 1 and recurse the tail
findList :: Eq a => [a] -> [a] -> Maybe Int
findList _ [] = Nothing
findList xs (y:ys)
   | all (uncurry (==)) $ zip xs (y:ys) = Just 0
   | otherwise = fmap (1 +) (findList xs ys)

-- operator ##
(##) :: Eq a => [a] -> [a] -> Int
[] ## _ = 0
_ ## [] = 0
(x:xs) ## (y:ys)
   | x == y = 1 + (xs ## ys)
   | otherwise = xs ## ys


-- filterAB
-- Benjamin: https://stackoverflow.com/questions/41523856/predicate-and-a-list-search-haskell
filterAB :: (a -> Bool) -> [a] -> [b] -> [b]
filterAB predicate xs ys =
   -- F(x) = zip xs ys
   -- G(F(x)) = filter predicate fst F(x) 
   let filteredPairsList = filter (\(first, second) -> predicate first) $ zip xs ys
       result = map snd filteredPairsList
   in result


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

