module HW12 where
import Data.List
-- Problem #1: Write a Haskell program to solve the maximum segment
--   sum problem, following the three steps in the slides.

-- We treat empty segment [] as a valid subsegment.

mss :: [Integer] -> Integer
mss = maximum . map sum . (snd . getSegs)
    where
        getSegs :: [Integer] -> ([[Integer]], [[Integer]])
        getSegs [] = ([], [[]])
        getSegs (x : xs) =
            let (pre, has) = getSegs xs;
                pre' = [x] : map (x:) pre
            in  (pre', pre' ++ has)



-- End Problem #1

-- Problem #2: Write a Haskell program to solve the maximum segment
--   sum problem, using the smart algorithm in the slides.

mss' :: [Integer] -> Integer
mss' = snd . foldl' append (0, 0)
    where
        append :: (Integer, Integer) -> Integer -> (Integer, Integer)
        append (suf, all) x = let suf' = max (suf + x) 0 in (suf', max all suf')

-- End Problem #2
