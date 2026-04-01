myProdct [] = 1
myProdct (x:xs) = x * myProdct xs
-- Better to be written as: myProdct = foldr (*) 1

myLength :: [a] -> Int
myLength = foldr (\x y -> y + 1) 0

mySort cmp [] = []
mySort cmp (a : seq) = ge ++ [a] ++ lt
    where
        ge = mySort cmp [x | x <- seq, cmp x a]
        lt = mySort cmp [x | x <- seq, not (cmp x a)]

upSort :: Ord a => [a] -> [a]
upSort = mySort (<)

dnSort :: Ord a => [a] -> [a]
dnSort = mySort (>)

task1 :: IO() -- product of a list
task1 = print (myProdct [2, 3, 4])

task2 :: IO() -- length of a list
task2 = print (myLength [1, 1, 2, 3, 4])

task3 :: IO() -- reverse sort of a list
task3 = print (dnSort [2, 3, 9, 0, 1, 1, 4, 5, 1, 4, 1, 9])

main :: IO()
main = task1 >> task2 >> task3