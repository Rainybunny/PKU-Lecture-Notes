module HW8 where
import Data.List (sort)

-- Ch.10

-- 为简便起见，我们不允许任何中间结果超出 2^31。
-- 这意味着可以提前对搜索进行剪枝：
-- 1. 任何结果均不允许超过 2^31。
-- 2. 任何指数均不允许超过 31。
-- 在大家的 64 位系统上，GHC 一般把 Int 实现为 64 位整数，因此
-- 只要严格执行上述剪枝策略，就不必担心运算溢出问题。

lim :: Int = 2 ^ 31

data Op
  = Add
  | Sub
  | Mul
  | Div
  | Pow -- 添加的指数运算
  deriving Eq

data Expr
  = Val Int
  | App Op Expr Expr
  deriving Eq

-- 一些辅助函数
apply :: Op -> Int -> Int -> Int
apply Add x y = x + y
apply Sub x y = x - y
apply Mul x y = x * y
apply Div x y = x `div` y
apply Pow x y = x ^ y

valid :: Op -> Int -> Int -> Bool
valid Add x y = x <= y && x + y <= lim
valid Sub x y = x > y
valid Mul x y = 1 < x && x <= y && x * y <= lim
valid Div x y = 1 < y && y < x && x `mod` y == 0
valid Pow x y = 1 < x && 1 < y && y < 32 && safePow x y /= 0
    where
        safeMul :: Int -> Int -> Int
        safeMul x y = if t > lim then 0 else t where t = x * y

        safePow :: Int -> Int -> Int
        safePow x y
            | y == 1 = x
            | y `mod` 2 == 1 = x `safeMul` safePow x (y - 1)
            | otherwise = safeMul z z where z = safePow x (y `div` 2)

eval :: Expr -> [Int]
eval (Val n) = [n | n > 0]
eval (App o l r) = [apply o x y | x <- eval l, y <- eval r, valid o x y]

subs :: Eq a => [a] -> [[a]]
subs [] = [[]]
subs (x:xs) = subs oth ++ map (x:) (subs xs)
    where
        oth = dropWhile (== x) xs

interleave :: a -> [a] -> [[a]]
interleave x [] = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)

perms :: [a] -> [[a]]
-- perms [] = [[]]
-- perms (x:xs) = concatMap (interleave x) (perms xs)
perms = foldr (concatMap . interleave) [[]]

choices :: Eq a => [a] -> [[a]]
choices = concatMap perms . subs

split :: [a] -> [([a], [a])]
split [] = []
split [_] = []
split (x:xs) = ([x], xs) : [(x:ls, rs) | (ls, rs) <- split xs]

-- 你需要完成下面的 solutions 函数
-- 你可能还需要自定义一些辅助函数或类型
-- 注意你需要实现3个功能：
-- 1. 添加Pow相关功能
-- 2. 输出相对最精确的solution set，如果没有结果完全相同solution set
-- 3. 为solutions制定你喜欢的排序方式
-- 示例如下：
-- solutions [1, 3, 7] 23 应当返回两类解：值为22，24的表达式
-- solutions [3, 7] 343 应当返回 7^3
solutions :: [Int] -> Int -> [Expr]
solutions xs tar = [expr | (expr, val) <- res, abs (val - tar) == dis]
    where
        res = results xs
        dis = minimum [abs (tar - val) | (expr, val) <- res]

type Result = (Expr, Int)

results :: [Int] -> [Result]
results [] = []
results [x] = [(Val x, x)]
results xs = concat [results' xs' | xs' <- choices (sort xs)]
    where
        results' :: [Int] -> [(Expr, Int)]
        results' [x] = [(Val x, x)]
        results' xs = [(App op el er, apply op vl vr) |
                (xl, xr) <- split xs,
                op <- [Add, Sub, Mul, Div, Pow],
                (el, vl) <- results' xl,
                (er, vr) <- results' xr,
                valid op vl vr
            ]

-- main :: IO ()
-- main = do
--     print $ solutions [7, 1, 8, 6, 2, 9, 1] 114514

-- 下面是我们为 Expr 和 Op 提供的一个 Show 的实现
-- 这并不是本次作业必需的，但是在调试过程中可能会让表达式更易读
-- 这个实现使用了 showsPrec，有关它的细节你可以参考相关文档：
-- https://hackage.haskell.org/package/base-4.15.0.0/docs/Text-Show.html#t:Show
-- 以及 Haskell 2010 Report 的 11.4 节：
-- https://www.haskell.org/onlinereport/haskell2010/haskellch11.html

instance Show Op where
    show Add = "+"
    show Sub = "-"
    show Mul = "*"
    show Div = "/"
    show Pow = "^"

instance Show Expr where
    showsPrec _ (Val n) = shows n
    showsPrec p (App op x y)
        = showParen (p > q)
        $ showsPrec q x . showChar ' ' . shows op
        . showChar ' ' . showsPrec (succ q) y
        where q = case op of
                Add -> 6; Sub -> 6
                Mul -> 7; Div -> 7
                Pow -> 8
