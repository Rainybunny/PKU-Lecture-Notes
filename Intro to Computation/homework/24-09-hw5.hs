module HW5 where

import Data.Char (chr, isLower, ord)
import GHC.Float (int2Float, sqrtDouble, int2Double)

-- **=========[ Ch.05 ]=========**

-- Problem #1: define safetail
-- Part #1.1: use a conditional expression
safetail1 :: [a] -> [a]
safetail1 xs = if null xs then [] else tail xs
-- End Part #1.1

-- Part #1.2: use guarded equations
safetail2 :: [a] -> [a]
safetail2 xs
    | null xs = []
    | otherwise = tail xs
-- End Part #1.2

-- Part #1.3: use pattern matching
safetail3 :: [a] -> [a]
safetail3 [] = []
safetail3 xs = tail xs
-- End Part #1.3
-- End Problem #1

-- Problem #2: Luhn algorithm
luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = ((luhnDouble a + b + luhnDouble c + d) `mod` 10) == 0
    where
        luhnDouble x = if 2 * x > 9 then 2 * x - 9 else 2 * x
-- End Problem #2

-- **=========[ Ch.06 ]=========**

-- Problem #1: Caesar crack
encode :: Int -> String -> String 
encode n xs = [ shift n x | x <- xs ] 

shift :: Int -> Char -> Char 
shift n c | isLower c  =  int2let $ mod (let2int c + n) 26
          | otherwise  =  c 

let2int :: Char -> Int 
let2int c = ord c - ord 'a' 
int2let :: Int -> Char 
int2let n = chr $ ord 'a' + n

table :: [Float] 
table = [ 8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0, 
          0.2, 0.8, 4.0, 2.4,  6.7, 7.5, 1.9, 0.1, 6.0, 
          6.3, 9.0, 2.8, 1.0,  2.4, 0.2, 2.0, 0.1 ] 

crack :: String -> String
crack xs = encode (-factor) xs 
    where
        factor = position (minimum chitab) chitab
        chitab = [ chisqr (rotate n table') table | n <- [0..25] ]
        table' = freqs xs

rotate :: Int -> [a] -> [a]
rotate n xs = doRotate (n `mod` length xs) xs
    where
        doRotate n xs = drop n xs ++ take n xs

position :: Eq a => a -> [a] -> Int
position x (y : xs) = if x == y then 0 else 1 + position x xs

freqs :: String -> [Float]
freqs str = [freq c str * 100.0 | c <- ['a'..'z']]
    where
        freq :: Char -> String -> Float
        freq c str = int2Float (length [t | t <- str, t == c]) / int2Float (length str)

chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o - e) ^ 2) / e | (o, e) <- zip os es]
-- End Problem #1

-- Problem #2: Pythagorean triples
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, isqrt z) |
    x <- [1..n], y <- [1..isqrt (n ^ 2 - x ^ 2)],
    z <- [x ^ 2 + y ^ 2], isSquare z]

isqrt :: Int -> Int
isqrt x = floor $ sqrtDouble $ int2Double x

isSquare :: Int -> Bool
isSquare x = isqrt x ^ 2 == x
-- End Problem #2

-- Problem #3: perfect integers
perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum (factor x) == x * 2]

factor :: Int -> [Int]
factor n
    | isSquare n = sma ++ [n `div` x | x <- sma] ++ [isqrt n]
    | otherwise = sma ++ [n `div` x | x <- sma]
    where
        sma = [x | x <- [1..isqrt (n - 1)], n `mod` x == 0]
-- End Problem #3

-- Problem #4: scalar product
scalarProduct :: Num a => [a] -> [a] -> a
scalarProduct xs ys = sum [x * y | (x, y) <- zip xs ys]
-- End Problem #4
