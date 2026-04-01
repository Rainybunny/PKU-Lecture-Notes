module HW19 where

-- Ch25: BMF3-2
tailsums :: (Num a) => [a] -> [a]
tailsums = reverse . fst . helper where
  helper :: (Num a) => [a] -> ([a], a)
  helper = foldr (\a (ts, s) -> ((a + s) : ts, a + s)) ([0], 0)
