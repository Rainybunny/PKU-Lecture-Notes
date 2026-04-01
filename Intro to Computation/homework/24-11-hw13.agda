-- module HW13 where
module 24-11-hw13 where

open import Data.Bool using (Bool; true; false; if_then_else_)

import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; refl)
open Eq.≡-Reasoning using (begin_; step-≡; step-≡˘; _∎)

-- problem 17.1
data day : Set where
  -- fill in your answers here
    Mon Tues Wed Thur Fri Sat Sun : day

-- problem 17.2
nextday : day → day
nextday Mon = Tues
nextday Tues = Wed
nextday Wed = Thur
nextday Thur = Fri
nextday Fri = Sat
nextday Sat = Sun
nextday Sun = Mon

ite-arg : ∀ {ℓ ℓ′} {A : Set ℓ} {B : Set ℓ′}
    → (f : A → B) → (b : Bool) → (x y : A)
    → f (if b then x else y) ≡ (if b then f x else f y)
ite-arg f false x y = refl
ite-arg f true x y = refl
