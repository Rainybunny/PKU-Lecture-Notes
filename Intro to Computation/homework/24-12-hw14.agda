-- module HW14 where
module 24-12-hw14 where

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
open import Data.List using (List; []; _∷_)

import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; refl; sym; trans; cong; cong-app)
open Eq.≡-Reasoning using (begin_; step-≡; step-≡˘; _∎)

-- Chap. 18

+-zero : (a : ℕ) -> a + zero ≡ a
+-zero zero = refl
+-zero (suc a) rewrite +-zero a = refl

+-succ : (a b : ℕ) -> a + (suc b) ≡ suc (a + b)
+-succ zero b = refl
+-succ (suc a) b rewrite +-succ a b = refl

+-comm : (a b : ℕ) -> a + b ≡ b + a
+-comm zero b rewrite +-zero b = refl
+-comm (suc a) b rewrite +-succ b a | +-comm a b = refl

+-assoc : (a b c : ℕ) -> a + (b + c) ≡ (a + b) + c
+-assoc zero b c = refl
+-assoc (suc a) b c rewrite +-assoc a b c = refl

+-assoc' : (a b c : ℕ) -> (a + b) + c ≡ a + (b + c)
+-assoc' a b c rewrite +-assoc a b c = refl

*-zero : (x : ℕ) -> x * zero ≡ zero
*-zero zero = refl
*-zero (suc x) rewrite *-zero x = refl

-- problem 1.1: commutativity of _*_
*-comm : (x y : ℕ) → x * y ≡ y * x
*-comm zero y rewrite *-zero y = refl
*-comm x zero rewrite *-zero x = refl
*-comm (suc x) (suc y) rewrite
    *-comm x (suc y) | *-comm y (suc x) | *-comm x y |
    +-assoc y x (y * x) | +-assoc x y (y * x) | +-comm x y
    = refl

*-distr : (x y z : ℕ) -> (x + y) * z ≡ x * z + y * z
*-distr x y zero rewrite *-zero (x + y) | *-zero x | *-zero y = refl
*-distr x y (suc z) rewrite
    *-comm (x + y) (suc z) | *-comm x (suc z) | *-comm y (suc z) |
    *-comm z (x + y) | *-distr x y z | *-comm x z | *-comm y z |
    +-assoc' x y (z * x + z * y) | +-assoc y (z * x) (z * y) |
    +-comm y (z * x) | +-assoc' (z * x) y (z * y) | +-assoc x (z * x) (y + z * y)
    = refl -- consider suc x is much easier

-- problem 1.2: associativity of _*_
*-assoc : (x y z : ℕ) → (x * y) * z ≡ x * (y * z)
*-assoc zero y z = refl
*-assoc (suc x) y z rewrite *-distr y (x * y) z | *-assoc x y z = refl


-- problem 2: prove the theorems.
-- remark: the standard library provides the following comparison based on decidability
--   _<?_ : (x y : ℕ) → Dec (x < y)
-- where `Dec` is the type for decidability;
-- and also the following comparison as inductive relation
--   _<_ : (x y : ℕ) → Set
-- so neither is the one we want.
-- note: read more on decidability here:
--  * stdlib: https://agda.github.io/agda-stdlib/Relation.Nullary.Decidable.Core.html#1476
--  * PLFA: https://plfa.github.io/Decidable/
-- so we just provide the same definition as given in the slides:
-- (note that stdlib use (Bool; true; false) instead of (𝔹; tt; ff))
infix 9 _≟_
_≟_ : (x y : ℕ) → Bool
zero  ≟ zero  = true
zero  ≟ suc _ = false
suc _ ≟ zero  = false
suc x ≟ suc y = x ≟ y

infix 9 _<_
_<_ : (x y : ℕ) → Bool
zero < zero  = false
zero < suc _ = true
suc _ < zero  = false
suc x < suc y = x < y

-- problem 2.1
n≮n : (n : ℕ) → n < n ≡ false
n≮n zero = refl
n≮n (suc n) rewrite n≮n n = refl

-- problem 2.2
<-antisym : (x y : ℕ) → x < y ≡ true → y < x ≡ false
<-antisym zero zero ()
<-antisym zero (suc y) _ = refl
<-antisym (suc x) zero ()
<-antisym (suc x) (suc y) p = <-antisym x y p

-- problem 2.3
<-trichotomy : (x y : ℕ) → x < y ∨ x ≟ y ∨ y < x ≡ true
<-trichotomy zero zero = refl
<-trichotomy zero (suc y) = refl
<-trichotomy (suc x) zero = refl
<-trichotomy (suc x) (suc y) = <-trichotomy x y