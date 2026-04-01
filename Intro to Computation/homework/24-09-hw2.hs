module HW2 where

-- Problem #1: 写出 and 函数的三种其他的定义
and1 :: Bool -> Bool -> Bool
and1 x y = if x then y else False

and2 :: Bool -> Bool -> Bool
and2 x y
    | x = y
    | otherwise = False

and3 :: Bool -> Bool -> Bool
and3 x y = case x of
    True -> y
    False -> False

-- Maybe `and = (&&)` can be another definition of `and`?

-- End Problem #1

-- Problem #2: 给出函数 div 的一种或多种定义
div1 :: Integer -> Integer -> Integer
div1 x y
    | (x < 0) == (y < 0) = divHelper (abs x) (abs y)
    | otherwise = -divHelper (abs x + abs y - 1) (abs y)
    where
        divHelper x y
            | x < y = 0
            | otherwise = 1 + divHelper (x - y) y
-- End Problem #2

-- Problem #3: 写出阶乘函数的其他定义：
-- Part #3.1: 使用条件方程组
factGuard :: Integer -> Integer
factGuard n
    | n == 0 = 1
    | n > 0 = n * factGuard (n - 1)
-- End Part #3.1

-- Part #3.2: 使用分支表达式
factBranch :: Integer -> Integer
factBranch n = if n == 0 then 1 else n * factBranch (n - 1)
-- End Part #3.2
-- End Problem #3