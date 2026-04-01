module HW6 where

import Prelude hiding (and, concat, replicate, (!!), elem, filter, map)
import Data.Char (chr)

-- Ch.07

-- Problem #1: define prelude functions using recursions
and :: [Bool] -> Bool
and = foldr (&&) True

concat :: [[a]] -> [a]
concat = foldr (++) []

(!!) :: [a] -> Int -> a
(!!) (x : xs) 0 = x
(!!) (x : xs) k = (!!) xs (k - 1)

replicate :: Int -> a -> [a]
replicate 0 x = []
replicate k x = x : replicate (k - 1) x

elem :: Eq a => a -> [a] -> Bool
elem x = foldr (\y f -> x == y || f) False
-- End Problem #1

-- Problem #2: merge ascending lists
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x : xs) (y : ys)
    | x <= y = x : merge xs (y : ys)
    | otherwise = y : merge (x : xs) ys
-- End Problem #2

-- Problem #3: merge sort
msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort seq = merge (msort xs) (msort ys)
    where
        (xs, ys) = splitAt (length seq `div` 2) seq
-- End Problem #3

-- Ch.08

-- Problem #1: desugar list comprehension using map and filter
theExpr :: (a -> Bool) -> (a -> b) -> [a] -> [b]
-- theExpr p f xs = [f x | x <- xs, p x]
theExpr p f xs = map f (filter p xs)
-- End Problem #1

-- Problem #2: redefine map/filter with foldr
filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr (\x xs -> if p x then x : xs else xs) []

map :: (a -> b) -> [a] -> [b]
map f = foldr (\x xs -> f x : xs) []
-- End Problem #2

-- Problem #3: error checking for binary string transmitter
type Bit = Int

bin2int :: [Bit] -> Int
bin2int = foldr (\x y -> x + 2 * y) 0

decode :: [Bit] -> String
-- modify this line to add error checking
-- but needless
decode = map (chr . bin2int) . chop

parity :: [Bit] -> Bool
parity = odd . sum

chop :: [Bit] -> [[Bit]]
chop [] = []
chop xs = ys : chop (drop 9 xs)
    where
        ys' = take 9 xs
        ys = if parity ys' then error "parity error" else take 8 ys'
-- you can check: decode [1,0,0,0,0,1,1,0,1] == "a"

-- End Problem #3
