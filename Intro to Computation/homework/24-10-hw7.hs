module HW7 where

-- Ch.09

-- Problem #1: multiplies for natural numbers
data Nat = Zero | Succ Nat deriving (Show)

-- For debug
int2Nat :: Int -> Nat
int2Nat 0 = Zero
int2Nat n = Succ $ int2Nat (n - 1)

add :: Nat -> Nat -> Nat
add Zero     n = n
add (Succ m) n = Succ (add m n)

multiplies :: Nat -> Nat -> Nat
multiplies Zero n = Zero
multiplies (Succ m) n = n `add` multiplies m n
-- End Problem #1

-- Problem #2: folde for Exprs
data Expr
  = Val Int
  | Add Expr Expr
  | Mul Expr Expr
  deriving (Show)

-- try to figure out the suitable type yourself
folde :: (Int -> a) -> (a -> a -> a) -> (a -> a -> a) -> Expr -> a
folde leaf opadd opmul (Val x) = leaf x
folde leaf opadd opmul (Add x y) = folde leaf opadd opmul x `opadd` folde leaf opadd opmul y
folde leaf opadd opmul (Mul x y) = folde leaf opadd opmul x `opmul` folde leaf opadd opmul y
-- End Problem #2

-- Problem #3: recursive tree type
data Tree a = Node (Tree a) (Tree a) | Leaf a
  deriving (Show)
-- End Problem #3
