module HW18 where

import Data.Ord

-- Ch23: BMF1-2
accum :: (a -> b -> a) -> a -> [b] -> [a]
accum f e [] = [e]
accum f e (x : xs) = e : accum f (f e x) xs

mss :: [Int] -> Int
mss = maximum . accum (\x y -> max (x + y) 0) 0

-- Ch24: BMF2-2
longer :: Ord a => [a] -> [a] -> [a]
longer xs ys
  | length xs < length ys = ys
  | length ys < length xs = xs
  | otherwise = lexsmall xs ys
  where
    lexsmall :: Ord a => [a] -> [a] -> [a]
    lexsmall [] [] = []
    lexsmall (x : xs) (y : ys)
      | x < y = x : xs
      | y < x = y : ys
      | otherwise = x : lexsmall xs ys

{-
  The final program for lsp is linear in the number of calculation of p.
  Because it's easy to see that `accum f e xs` calls `f` O(n) times, where
    are the only usages of p.
-}
lsp :: Ord a => (a -> Bool) -> [a] -> [a]
lsp p = foldr longer [] . accum (extend p) []
  where
    extend :: (a -> Bool) -> [a] -> a -> [a]
    extend p xs x = if p x then xs ++ [x] else []
