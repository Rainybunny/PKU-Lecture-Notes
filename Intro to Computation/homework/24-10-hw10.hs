module HW10 where

import Prelude hiding (Applicative (..), Functor (..), Monad (..))
import Data.Char (ord)

infixl 4 <$
infixl 1 >>, >>=
infixl 4 <*>

class Functor f where
  fmap        :: (a -> b) -> f a -> f b
  (<$)        :: a -> f b -> f a
  (<$)        =  fmap . const

class Functor f => Applicative f where
  pure :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b

class Applicative m => Monad m where
  return :: a -> m a
  return = pure
  (>>=) :: m a -> (a -> m b) -> m b
  (>>) :: m a -> m b -> m b
  m >> k = m >>= \_ -> k

-- Problem #1: Monad ((->) a)
instance Functor ((->) a) where
  fmap :: (a1 -> b) -> (c -> a1) -> (c -> b)
  fmap = (.)

instance Applicative ((->) a) where
  pure :: a1 -> (c -> a1)
  pure = const

  (<*>) :: (p -> q -> a1) -> (p -> q) -> (p -> a1)
  (<*>) f g x = f x $ g x

instance Monad ((->) r) where
  (>>=) :: (r -> a) -> (a -> r -> b) -> r -> b
  (>>=) f g x = g (f x) x
-- End Problem #1

-- Problem #2: Functor, Applicative, Monad
data Expr a
  = Var a
  | Val Int
  | Add (Expr a) (Expr a)
  deriving (Show)

instance Functor Expr where
  fmap :: (a -> b) -> Expr a -> Expr b
  fmap f (Var x) = Var $ f x
  fmap _ (Val x) = Val x
  fmap f (Add x y) = Add (fmap f x) (fmap f y)

instance Applicative Expr where
  pure :: a -> Expr a
  pure = Var

  {- Replace each Var in an expression over a with a 'sub-expression'
    using maps in Expr (a -> b) -}
  (<*>) :: Expr (a -> b) -> Expr a -> Expr b
  (<*>) _ (Val x) = Val x
  (<*>) ef (Add x y) = Add (ef <*> x) (ef <*> y)
  (<*>) ef (Var x) = fmap ($ x) ef

instance Monad Expr where
  (>>=) :: Expr a -> (a -> Expr b) -> Expr b
  (>>=) (Val x) _ = Val x
  (>>=) (Add x y) f = Add (x >>= f) (y >>= f)
  (>>=) (Var x) f = f x

demo :: IO ()
demo = do
  let expr1 = Add (Var 'a') (Var 'b')
  print $ fmap (const 1) expr1 -- set all variables to 1

  let etrans1 = Add (Var ((-) 97 . ord)) (Var ((-) 95 . ord))
  print $ etrans1 <*> expr1 -- set 'a' to (0 - 1), 'b' to (-1 - 3), ...

  let expr2 = Add (Var 2) (Var 3)
  let etrans2 = \(x :: Int) -> (Add (Val $ x - 1) (Val $ x - 2)) :: Expr Int
  print $ expr2 >>= etrans2 -- set Var x to Val (x - 1) + (x - 2)

-- End Problem #2
