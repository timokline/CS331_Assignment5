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

--import Data.Bifunctor ( Bifunctor(bimap) )

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
-- randomusername: https://stackoverflow.com/questions/29516517/how-can-i-find-the-index-where-one-list-appears-as-a-sublist-of-another
--       pair two lists' elements as tuples
--       check if they are equal...
--       for each pair made by `zip`
--       else, add 1 and recurse the tail
findList :: Eq a => [a] -> [a] -> Maybe Int
findList _ [] = Nothing
findList xs (y:ys)
   | all (uncurry (==)) $ zip xs (y:ys) = Just 0
   --       UNLESS the sublist length is greater than the tail length
   --       if so, return Nothing
   | otherwise = if length xs > length ys then Nothing else fmap (1 +) (findList xs ys)


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
   -- F(x) = zip xs ys
   -- G(F(x)) = filter predicate fst F(x) 
filterAB predicate xs ys = map snd $ filter (\(first, second) -> predicate first) $ zip xs ys


-- sumEvenOdd
-- requires foldr/foldl/foldr1/foldl1
-- https://wiki.haskell.org/Fold
sumEvenOdd :: Num a => [a] -> (a,a)
-- switch order of pair for summation
sumEvenOdd = {-findSum-} foldr (\n (lhs, rhs) -> (n+rhs, lhs)) (0,0) --) where
   --findSum = bimap sum sum --Hlint suggested from (sum (fst thePair), sum (snd thePair))

   --NOTE TO SELF: (\ x{is type of [a]} (ys,zs){is type (a,a)} -> ...) (0,0) [...]