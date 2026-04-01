-- module HW15 where
module 24-12-hw15 where

-- How to input the Unicode characters
-- ===================================
-- ℕ    \bN
-- →    \->
-- ∷    \::
-- ≡    \==
-- ⟨    \<
-- ⟩    \>
-- ˘    \u{}

open import Data.Nat using (ℕ; zero; suc; _+_; _*_)
open import Data.Bool using (Bool; true; false; _∨_; if_then_else_)
open import Data.Vec using (Vec; []; _∷_)
open import Data.List using (List; []; _∷_)

import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; refl; sym; trans; cong; cong-app)
open Eq.≡-Reasoning using (begin_; step-≡; step-≡˘; _∎)

-- Chap. 19

-- This is equivalent to adding a `(A : Set)` to every type with a free variable `A`
variable
  A : Set
  B : Set

takeWhile : (p : A → Bool) → List A → List A
takeWhile _ [] = []
takeWhile p (x ∷ xs) = if p x then x ∷ takeWhile p xs else []

-- this function is usually named `replicate` instead of `repeat`
replicate : ℕ → A → List A
replicate 0 _ = []
replicate (suc n) x = x ∷ replicate n x

prop : (a : A) -> (n : ℕ) → (p : A → Bool) → p a ≡ true
  → takeWhile p (replicate n a) ≡ replicate n a
prop a 0 p pf = refl
prop a (suc n) p pf rewrite pf | prop a n p pf = refl

-- problem 20.1
_by_matrix : (n m : ℕ) → Set
n by m matrix = Vec (Vec ℕ m) n

-- problem 20.2
-- 20.2(a) zero matrix: all zeros
replicateV : (n : ℕ) → A → Vec A n
replicateV 0 _ = []
replicateV (suc n) x = x ∷ replicateV n x

zero-matrix : (n m : ℕ) → n by m matrix
zero-matrix n m = replicateV n (replicateV m 0)

_<_ : (n m : ℕ) → Bool
zero  < zero  = false
zero  < suc _ = true
suc _ < zero  = false
suc x < suc y = x < y

nthV : {m : ℕ} → (n : ℕ) -> n < m ≡ true -> Vec A m -> A
nthV 0 () []
nthV (suc n) () []
nthV 0 _ (x ∷ _) = x
nthV (suc n) pf (x ∷ xs) = nthV n pf xs

mapV : {m : ℕ} → (A → B) → Vec A m → Vec B m
mapV _ [] = []
mapV f (x ∷ xs) = f x ∷ mapV f xs

-- 20.2(b) matrix indexing
module Problem-20-2-b where
  matrix-elt : {n m : ℕ}
    → n by m matrix
    → (i j : ℕ)
    → i < n ≡ true
    → j < m ≡ true
    → ℕ
  matrix-elt {suc n} {m} (x0 ∷ xs) 0 j _ pfj = nthV j pfj x0
  matrix-elt {suc n} {m} (x0 ∷ xs) (suc i) j pfi pfj = matrix-elt {n} {m} xs i j pfi pfj

-- 20.2(c): diagonal matrix, with the same element along the main diagonal
diagonal-matrix : (n : ℕ) → (d : ℕ) → n by n matrix
diagonal-matrix 0 d = []
diagonal-matrix (suc n) d = (d ∷ replicateV n 0) ∷ mapV (λ x → 0 ∷ x) (diagonal-matrix n d)

identity-matrix : (n : ℕ) → n by n matrix
identity-matrix n = diagonal-matrix n 1

-- 20.2(d): transpose
transpose : {n m : ℕ} → n by m matrix → m by n matrix
transpose {0} {m} [] = replicateV m []
transpose {suc n} {m} (x0 ∷ xs) = extend x0 (transpose {n} {m} xs)
  where
    extend : {n : ℕ} {m : ℕ} → Vec ℕ m → m by n matrix -> m by (suc n) matrix
    extend [] [] = []
    extend (x ∷ xs) (y ∷ ys) = (x ∷ y) ∷ extend xs ys

-- 20.2(e): dot product
_∙_ : {n : ℕ} → (x y : Vec ℕ n) → ℕ
[] ∙ [] = 0
(x ∷ xs) ∙ (y ∷ ys) = x * y + (xs ∙ ys)
