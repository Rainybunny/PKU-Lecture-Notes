{- Rainybunny -}
{-
  For tasks not in this file:
    BMF 1-2: see `mss` in `HW18.hs`
    BMF 1-3: see the attached file `HW17-proof.pdf`
    BMF 2-2: see `lsp` and it's comment in `HW18.hs`

  All goals & bonuses finished.
  You may find original goals at:
    problem-1.++-identityˡ
    problem-1.++-identityʳ
    problem-2.foldr-++
    problem-3.reverse-involutive
    ---
    bmf.⊗-⊕-swap (BMF 1-1 first task)
    bmf.horner-empty (BMF 1-1 second task - case 1)
    bmf.horner-append (BMF 1-1 second task - case 2)
    bmf.horner-rule (BMF 1-1 final goal)
    ---
    ℕ-mss.derivation
    ---
    bmf2-1.split (BMF 2-1 first task)
    bmf2-1.split-is-correct
    bmf2-1.init-is-not-homomorphism (BMF 2-1 second task)
  And bonuses at:
    problem-3.fast-reverse-involutive
    ---
    ℕ-mss.mss-is-correct.mss-is-max
    ℕ-mss.mss-is-correct.mss-exists
    ---
    ℤ-mss.derivation
    ---
    bmf2-1.reduce-map-is-homomorphism
    bmf2-1.split-is-indeed-correct
-}

-- module HW17 where
module 24-12-hw17 where

import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; _≢_; refl; trans; sym; cong; cong-app; subst)
open Eq.≡-Reasoning using (begin_; step-≡; _∎)
open import Data.Bool using (Bool; true; false; _∨_; if_then_else_)
open import Function using (id; _∘_)


postulate
  extensionality : ∀ {A : Set} {B : A → Set} {f g : (x : A) → B x}
    → ((x : A) → f x ≡ g x) → f ≡ g

-----------------------------

module my-base where
  open import Data.Maybe using (just)
  open import Data.Product using (Σ; _,_)
  open import Data.List using (List; []; _∷_; [_]; _++_; foldl; foldr; map; concat; scanl; scanr)
  
  infixr 2 _≡⟨⟩_ _≡⟨_⟩_

  _≡⟨⟩_ : ∀ {ℓ} {A : Set ℓ} (x : A) {y : A} → x ≡ y → x ≡ y
  x ≡⟨⟩ refl = refl

  _≡⟨_⟩_ : ∀ {ℓ} {A : Set ℓ} (x : A) {y z : A} → x ≡ y → y ≡ z → x ≡ z
  x ≡⟨ refl ⟩ refl = refl

  nonempty : ∀ {A : Set} → List A → Bool
  nonempty [] = false
  nonempty _ = true

  ¬nonempty→[] : {A : Set} {xs : List A} → nonempty xs ≡ false → xs ≡ []
  ¬nonempty→[] {A} {[]} _ = refl
  ¬nonempty→[] {A} {x ∷ xs} ()

  inits : ∀ {A : Set} → List A → List (List A)
  -- inits = scanl _++_ [] ∘ map [_]
  inits [] = [] ∷ []
  inits (x ∷ xs) = [] ∷ map (x ∷_) (inits xs)

  tails : ∀ {A : Set} → List A → List (List A)
  -- tails = scanr _++_ [] ∘ map [_]
  tails [] = [] ∷ [] -- empty tail
  tails (x ∷ xs) = (x ∷ xs) ∷ tails xs

  segs : ∀ {A : Set} → List A → List (List A)
  segs = concat ∘ map tails ∘ inits

  inits-nonempty : {A : Set} (xs : List A) → nonempty (inits xs) ≡ true
  inits-nonempty [] = refl
  inits-nonempty (x ∷ xs) = refl

  tails-nonempty : {A : Set} (xs : List A) → nonempty (tails xs) ≡ true
  tails-nonempty [] = refl
  tails-nonempty (x ∷ xs) = refl

  segs-nonempty : {A : Set} (xs : List A) → nonempty (segs xs) ≡ true
  segs-nonempty {A} [] = refl
  segs-nonempty {A} (x ∷ xs) = refl

  keep : (p : Bool) → Σ Bool (λ p' → p ≡ p')
  keep p with p
  ... | true = true , refl
  ... | false = false , refl


  just-injective : ∀ {A : Set} {x y : A} → just x ≡ just y → x ≡ y
  just-injective refl = refl
open my-base

-----------------------------

module problem-1 where
  open import Data.List using (List; []; _∷_; _++_)

  ++-assoc : ∀ {A : Set} (xs ys zs : List A) → (xs ++ ys) ++ zs ≡ xs ++ (ys ++ zs)
  ++-assoc [] ys zs = refl
  ++-assoc (x ∷ xs) ys zs =
    begin
      ((x ∷ xs) ++ ys) ++ zs
    ≡⟨⟩
      x ∷ ((xs ++ ys) ++ zs)
    ≡⟨ cong (x ∷_) (++-assoc xs ys zs) ⟩
      x ∷ (xs ++ (ys ++ zs))
    ≡⟨⟩
      (x ∷ xs) ++ (ys ++ zs)
    ∎

  ++-identityˡ : ∀ {A : Set} (xs : List A) → [] ++ xs ≡ xs
  ++-identityˡ xs = refl

  ++-identityʳ : ∀ {A : Set} (xs : List A) → xs ++ [] ≡ xs
  ++-identityʳ [] = refl
  ++-identityʳ (x ∷ xs) =
    begin
      (x ∷ xs) ++ []
    ≡⟨⟩
      x ∷ (xs ++ [])
    ≡⟨ cong (x ∷_) (++-identityʳ xs) ⟩
      x ∷ xs
    ∎

-----------------------------

module problem-2 where
  open import Data.List using (List; []; _∷_; _++_; foldr)
  open problem-1

  foldr-++ : ∀ {A : Set} (_⊗_ : A → A → A) (e : A) (xs ys : List A)
    → foldr _⊗_ e (xs ++ ys) ≡ foldr _⊗_ (foldr _⊗_ e ys) xs
  foldr-++ _⊗_ e [] ys = refl
  foldr-++ _⊗_ e (x ∷ xs) ys = let f0 = foldr _⊗_ e in
    begin
      f0 ((x ∷ xs) ++ ys)
    ≡⟨⟩
      f0 (x ∷ (xs ++ ys))
    ≡⟨⟩
      x ⊗ f0 (xs ++ ys)
    ≡⟨ cong (x ⊗_) (foldr-++ _⊗_ e xs ys) ⟩
      x ⊗ foldr _⊗_ (f0 ys) xs
    ≡⟨⟩
      foldr _⊗_ (f0 ys) (x ∷ xs)
    ∎

-----------------------------

module problem-3 where
  open import Data.List using (List; []; _∷_; _++_)
  open problem-1
  open problem-2

  reverse : ∀ {A : Set} → List A → List A
  reverse []       = []
  reverse (x ∷ xs) = reverse xs ++ (x ∷ [])

  reverse-++ : ∀ {A : Set} → (xs ys : List A)
    → reverse (xs ++ ys) ≡ reverse ys ++ reverse xs
  reverse-++ [] ys rewrite ++-identityʳ (reverse ys) = refl
  reverse-++ (x ∷ xs) ys =
    begin
      reverse ((x ∷ xs) ++ ys)
    ≡⟨⟩
      reverse (x ∷ (xs ++ ys))
    ≡⟨⟩
      reverse (xs ++ ys) ++ (x ∷ [])
    ≡⟨ cong (_++ (x ∷ [])) (reverse-++ xs ys) ⟩
      (reverse ys ++ reverse xs) ++ (x ∷ [])
    ≡⟨ ++-assoc (reverse ys) (reverse xs) (x ∷ []) ⟩
      reverse ys ++ reverse (x ∷ xs)
    ∎

  reverse-involutive : ∀ {A : Set} → reverse {A} ∘ reverse {A} ≡ id
  reverse-involutive = extensionality lemma where
    lemma : ∀ {A : Set} → (xs : List A) → (reverse ∘ reverse) xs ≡ xs
    lemma [] = refl
    lemma (x ∷ xs) =
      begin
        reverse (reverse (x ∷ xs))
      ≡⟨⟩
        reverse (reverse xs ++ (x ∷ []))
      ≡⟨ reverse-++ (reverse xs) (x ∷ []) ⟩
        x ∷ reverse (reverse xs)
      ≡⟨ cong (x ∷_) (lemma xs) ⟩
        x ∷ xs
      ∎

  fr-helper : ∀ {A : Set} → List A → List A → List A
  fr-helper res []       = res
  fr-helper res (x ∷ xs) = fr-helper (x ∷ res) xs

  fast-reverse : ∀ {A : Set} → List A → List A
  fast-reverse = fr-helper []

  fast-reverse≡reverse-alt : ∀ {A : Set} (xs : List A)
    → fast-reverse xs ≡ reverse xs
  fast-reverse≡reverse-alt xs =
    begin
      fr-helper [] xs
    ≡⟨ lemma [] xs ⟩
      reverse xs ++ []
    ≡⟨ ++-identityʳ (reverse xs) ⟩
      reverse xs
    ∎
    where
      lemma : {A : Set} (rs xs : List A) → fr-helper rs xs ≡ reverse xs ++ rs
      lemma rs [] = refl
      lemma rs (x ∷ xs) =
        begin
          fr-helper rs (x ∷ xs)
        ≡⟨⟩
          fr-helper (x ∷ rs) xs
        ≡⟨ lemma (x ∷ rs) xs ⟩
          reverse xs ++ ((x ∷ []) ++ rs)
        ≡⟨ sym (++-assoc (reverse xs) (x ∷ []) rs) ⟩
          (reverse xs ++ (x ∷ [])) ++ rs
        ≡⟨⟩
          reverse (x ∷ xs) ++ rs
        ∎

  fast-reverse-involutive : ∀ {A : Set}
    → fast-reverse {A} ∘ fast-reverse {A} ≡ id
  fast-reverse-involutive = extensionality lemma where
    lemma : ∀ {A : Set} (xs : List A) → fast-reverse (fast-reverse xs) ≡ xs
    lemma xs =
      begin
        fast-reverse (fast-reverse xs)
      ≡⟨ fast-reverse≡reverse-alt (fast-reverse xs) ⟩
        reverse (fast-reverse xs)
      ≡⟨ cong reverse (fast-reverse≡reverse-alt xs) ⟩
        reverse (reverse xs)
      ≡⟨ cong-app reverse-involutive xs ⟩
        xs
      ∎

-----------------------------

module semigroup where
  record Semigroup {A : Set} (_⊕_ : A → A → A) : Set where
    field assoc : ∀ x y z → (x ⊕ y) ⊕ z ≡ x ⊕ (y ⊕ z)
  open Semigroup public
open semigroup

module monoid where
  record Monoid {A : Set} (e : A) (_⊕_ : A → A → A) : Set where
    field
      ⊕-semigroup : Semigroup _⊕_
      identityˡ : ∀ x → e ⊕ x ≡ x
      identityʳ : ∀ x → x ⊕ e ≡ x
  open Monoid public
open monoid

module semiring where
  record Semiring {A : Set} (0R : A) (1R : A)
    (_⊕_ : A → A → A) (_⊗_ : A → A → A) : Set where
    field
      ⊕-monoid : Monoid 0R _⊕_
      ⊗-monoid : Monoid 1R _⊗_
      distributivityˡ : ∀ x y z → x ⊗ (y ⊕ z) ≡ (x ⊗ y) ⊕ (x ⊗ z)
      distributivityʳ : ∀ z x y → (x ⊕ y) ⊗ z ≡ (x ⊗ z) ⊕ (y ⊗ z)
  open Semiring public
open semiring
 
module 𝕃-algebra where
  open import Data.List using (List; _++_; [])
  open import Data.List.Properties using (++-assoc; ++-identityˡ; ++-identityʳ)
  List-++-semigroup : ∀ {A : Set} → Semigroup {List A} _++_
  List-++-semigroup .assoc = ++-assoc
  List-++-monoid : ∀ {A : Set} → Monoid {List A} [] _++_
  List-++-monoid .⊕-semigroup = List-++-semigroup
  List-++-monoid .identityˡ = ++-identityˡ
  List-++-monoid .identityʳ = ++-identityʳ

-----------------------------

module ℕ-algebra where
  open import Data.Nat using (_+_; _⊔_)
  open import Data.Nat.Properties using (
      +-assoc; ⊔-assoc; +-identityˡ; +-identityʳ;
      ⊔-identityˡ; ⊔-identityʳ; +-distribˡ-⊔; +-distribʳ-⊔
    )

  ℕ-+-semigroup : Semigroup _+_
  ℕ-+-semigroup .assoc = +-assoc

  ℕ-⊔-semigroup : Semigroup _⊔_
  ℕ-⊔-semigroup .assoc = ⊔-assoc

  ℕ-+-monoid : Monoid 0 _+_
  ℕ-+-monoid .⊕-semigroup = ℕ-+-semigroup
  ℕ-+-monoid .identityˡ = +-identityˡ
  ℕ-+-monoid .identityʳ = +-identityʳ

  ℕ-⊔-monoid : Monoid 0 _⊔_
  ℕ-⊔-monoid .⊕-semigroup = ℕ-⊔-semigroup
  ℕ-⊔-monoid .identityˡ = ⊔-identityˡ
  ℕ-⊔-monoid .identityʳ = ⊔-identityʳ

  ℕ-⊔-+-semiring : Semiring 0 0 _⊔_ _+_
  ℕ-⊔-+-semiring .⊕-monoid = ℕ-⊔-monoid
  ℕ-⊔-+-semiring .⊗-monoid = ℕ-+-monoid
  ℕ-⊔-+-semiring .distributivityˡ = +-distribˡ-⊔
  ℕ-⊔-+-semiring .distributivityʳ = +-distribʳ-⊔

-----------------------------

module ℤ∞-base where
  open import Data.Integer
    using (ℤ; +0)
    renaming (_+_ to _+ℤ_; _⊔_ to _⊔ℤ_)
  open import Data.Integer.Properties
    using (mono-≤-distrib-⊔; +-monoʳ-≤) -- You are my HERO!!!!!!!!!!
    renaming (
      +-assoc to ℤ-+-assoc; +-comm to ℤ-+-comm;
      ⊔-assoc to ℤ-⊔-assoc; ⊔-comm to ℤ-⊔-comm;
      +-identityˡ to ℤ-+-identityˡ; +-identityʳ to ℤ-+-identityʳ
    )
  open import Relation.Nullary
  open import Relation.Binary.Core

  data ℤ∞ : Set where
    fin : ℤ → ℤ∞
    -∞ : ℤ∞

  _+_ : ℤ∞ → ℤ∞ → ℤ∞
  -∞ + y = -∞
  fin x + -∞ = -∞
  fin x + fin y = fin (x +ℤ y)

  _⊔_ : ℤ∞ → ℤ∞ → ℤ∞
  -∞ ⊔ y = y
  fin x ⊔ -∞ = fin x
  fin x ⊔ fin y = fin (x ⊔ℤ y)

  +-assoc : (x y z : ℤ∞) → (x + y) + z ≡ x + (y + z)
  +-assoc -∞ y z = refl
  +-assoc (fin x) -∞ z = refl
  +-assoc (fin x) (fin y) -∞ = refl
  +-assoc (fin x) (fin y) (fin z) rewrite ℤ-+-assoc x y z = refl

  +-comm : (x y : ℤ∞) → x + y ≡ y + x
  +-comm -∞ -∞ = refl
  +-comm -∞ (fin y) = refl
  +-comm (fin x) -∞ = refl
  +-comm (fin x) (fin y) rewrite ℤ-+-comm x y = refl

  ⊔-assoc : (x y z : ℤ∞) → (x ⊔ y) ⊔ z ≡ x ⊔ (y ⊔ z)
  ⊔-assoc -∞ y z = refl
  ⊔-assoc (fin x) -∞ z = refl
  ⊔-assoc (fin x) (fin y) -∞ = refl
  ⊔-assoc (fin x) (fin y) (fin z) rewrite ℤ-⊔-assoc x y z = refl
  
  ⊔-comm : (x y : ℤ∞) → x ⊔ y ≡ y ⊔ x
  ⊔-comm -∞ -∞ = refl
  ⊔-comm -∞ (fin y) = refl
  ⊔-comm (fin x) -∞ = refl
  ⊔-comm (fin x) (fin y) rewrite ℤ-⊔-comm x y = refl

  +-identityˡ : (x : ℤ∞) → fin +0 + x ≡ x
  +-identityˡ -∞ = refl
  +-identityˡ (fin x) rewrite ℤ-+-identityˡ x = refl

  +-identityʳ : (x : ℤ∞) → x + fin +0 ≡ x
  +-identityʳ -∞ = refl
  +-identityʳ (fin x) rewrite ℤ-+-identityʳ x = refl

  ⊔-identityˡ : (x : ℤ∞) → -∞ ⊔ x ≡ x
  ⊔-identityˡ -∞ = refl
  ⊔-identityˡ (fin x) = refl

  ⊔-identityʳ : (x : ℤ∞) → x ⊔ -∞ ≡ x
  ⊔-identityʳ -∞ = refl
  ⊔-identityʳ (fin x) = refl

  ℤ-+-distribˡ-⊔ : (x y z : ℤ) → x +ℤ (y ⊔ℤ z) ≡ (x +ℤ y) ⊔ℤ (x +ℤ z)
  ℤ-+-distribˡ-⊔ x = mono-≤-distrib-⊔ (+-monoʳ-≤ x)

  +-distribˡ-⊔ : (x y z : ℤ∞) → x + (y ⊔ z) ≡ (x + y) ⊔ (x + z)
  +-distribˡ-⊔ -∞ y z = refl
  +-distribˡ-⊔ (fin x) -∞ z = refl
  +-distribˡ-⊔ (fin x) (fin y) -∞ = refl
  +-distribˡ-⊔ (fin x) (fin y) (fin z) rewrite ℤ-+-distribˡ-⊔ x y z = refl
  
  +-distribʳ-⊔ : (z x y : ℤ∞) → (x ⊔ y) + z ≡ (x + z) ⊔ (y + z)
  +-distribʳ-⊔ z x y =
    begin
      (x ⊔ y) + z
    ≡⟨ +-comm (x ⊔ y) z ⟩
      z + (x ⊔ y)
    ≡⟨ +-distribˡ-⊔ z x y ⟩
      (z + x) ⊔ (z + y)
    ≡⟨ cong (_⊔ (z + y)) (+-comm z x) ⟩
      (x + z) ⊔ (z + y)
    ≡⟨ cong ((x + z) ⊔_) (+-comm z y) ⟩
      (x + z) ⊔ (y + z)
    ∎
  
-----------------------------  

module ℤ∞-algebra where
  open ℤ∞-base
  open import Data.Integer using (+0)

  ℤ∞-+-semigroup : Semigroup _+_
  ℤ∞-+-semigroup .assoc = +-assoc

  ℤ∞-⊔-semigroup : Semigroup _⊔_
  ℤ∞-⊔-semigroup .assoc = ⊔-assoc

  ℤ∞-+-monoid : Monoid (fin +0) _+_
  ℤ∞-+-monoid .⊕-semigroup = ℤ∞-+-semigroup
  ℤ∞-+-monoid .identityˡ = +-identityˡ
  ℤ∞-+-monoid .identityʳ = +-identityʳ

  ℤ∞-⊔-monoid : Monoid -∞ _⊔_
  ℤ∞-⊔-monoid .⊕-semigroup = ℤ∞-⊔-semigroup
  ℤ∞-⊔-monoid .identityˡ = ⊔-identityˡ
  ℤ∞-⊔-monoid .identityʳ = ⊔-identityʳ

  ℤ∞-⊔-+-semiring : Semiring -∞ (fin +0) _⊔_ _+_
  ℤ∞-⊔-+-semiring .⊕-monoid = ℤ∞-⊔-monoid
  ℤ∞-⊔-+-semiring .⊗-monoid = ℤ∞-+-monoid
  ℤ∞-⊔-+-semiring .distributivityˡ = +-distribˡ-⊔
  ℤ∞-⊔-+-semiring .distributivityʳ = +-distribʳ-⊔

-----------------------------

module bmf where
  open import Data.Nat using (ℕ; _+_; zero; suc; _⊔_)
  open import Data.List using (List; []; _∷_; [_]; _++_;
    foldl; foldr; concat; map; scanl; scanr)

  infixr 7 _/_ _*_

  _*_ : {A B : Set} → (A → B) → List A → (List B)
  _*_ = map

  _/_ : {A : Set} {e : A} {_⊕_ : A → A → A} → Monoid {A} e _⊕_ → List A → A
  _/_ {A} {e} {_⊕_} m = foldr _⊕_ e

  map-composition : { A B C : Set } (f : B → C) (g : A → B) (xs : List A)
    → f * (g * xs) ≡ (f ∘ g) * xs
  map-composition f g [] = refl
  map-composition f g (x ∷ xs) =
    begin
      f * (g * (x ∷ xs))
    ≡⟨⟩
      f * (g x ∷ g * xs)
    ≡⟨⟩
      (f ∘ g) x ∷ f * (g * xs)
    ≡⟨ cong ((f ∘ g) x ∷_) (map-composition f g xs) ⟩
      (f ∘ g) x ∷ (f ∘ g) * xs
    ≡⟨⟩
      (f ∘ g) * (x ∷ xs)
    ∎

  ------

  map-distribution : {A B : Set} (f : A → B) (xs ys : List A)
    → f * (xs ++ ys) ≡ f * xs ++ f * ys
  map-distribution f [] ys = refl
  map-distribution f (x ∷ xs) ys =
    begin
      f * ((x ∷ xs) ++ ys)
    ≡⟨⟩
      f * (x ∷ (xs ++ ys))
    ≡⟨⟩
      f x ∷ f * (xs ++ ys)
    ≡⟨ cong (f x ∷_) (map-distribution f xs ys) ⟩
      f x ∷ (f * xs ++ f * ys)
    ≡⟨⟩
      f * (x ∷ xs) ++ f * ys
    ∎

  ------

  map-promotion : {A B : Set} (f : A → B) (xss : List (List A))
    -- concat ≡ List-++-monoid /_  But `concat` is just shorter :)
    → ((f *_) ∘ concat) xss ≡ (concat ∘ ((f *_) *_)) xss
  map-promotion f [] = refl
  map-promotion f (xs ∷ xss) =
    begin
      f * (concat (xs ∷ xss))
    ≡⟨⟩
      f * (xs ++ concat xss)
    ≡⟨ map-distribution f xs (concat xss) ⟩
      f * xs ++ f * (concat xss)
    ≡⟨ cong (f * xs ++_) (map-promotion f xss) ⟩
      f * xs ++ concat (((f *_) *_) xss)
    ≡⟨⟩
      concat (((f *_) *_) (xs ∷ xss))
    ∎

  ------

  prefix-accumulation : ∀ {A B : Set} (e : A) (_⊙_ : A → B → A) (xs : List B)
    → foldl _⊙_ e * inits xs ≡ scanl _⊙_ e xs
  prefix-accumulation e _⊙_ [] = refl
  prefix-accumulation e _⊙_ (x ∷ xs) =
    begin
      foldl _⊙_ e * inits (x ∷ xs)
    ≡⟨⟩
      foldl _⊙_ e * ([] ∷ map (x ∷_) (inits xs))
    ≡⟨⟩
      e ∷ (foldl _⊙_ e * (x ∷_) * (inits xs))
    ≡⟨
      cong (e ∷_) (map-composition (foldl _⊙_ e) (x ∷_) (inits xs))
    ⟩
      e ∷ (foldl _⊙_ e ∘ (x ∷_)) * (inits xs)
    ≡⟨⟩
      e ∷ (foldl _⊙_ (e ⊙ x)) * (inits xs)
    ≡⟨
      cong (e ∷_) (prefix-accumulation (e ⊙ x) _⊙_ xs)
    ⟩
      e ∷ scanl _⊙_ (e ⊙ x) xs
    ≡⟨⟩
      scanl _⊙_ e (x ∷ xs)
    ∎

  ------

  reduce-distribution : {A : Set} {e : A} {_⊕_ : A → A → A}
    → (M : Monoid {A} e _⊕_) → (xs ys : List A)
    → M / (xs ++ ys) ≡ (M / xs) ⊕ (M / ys)
  reduce-distribution {A} {e} {_⊕_} M [] ys =
    begin
      M / ([] ++ ys)
    ≡⟨⟩
      M / ys
    ≡⟨ sym (M .identityˡ (M / ys)) ⟩
      e ⊕ (M / ys)
    ≡⟨⟩
      (M / []) ⊕ (M / ys)
    ∎
  reduce-distribution {A} {e} {_⊕_} M (x ∷ xs) ys =
    begin
      M / ((x ∷ xs) ++ ys)
    ≡⟨⟩
      M / (x ∷ (xs ++ ys))
    ≡⟨⟩
      (x ⊕ (M / (xs ++ ys)))
    ≡⟨ cong (x ⊕_) (reduce-distribution M xs ys) ⟩
      x ⊕ ((M / xs) ⊕ (M / ys))
    ≡⟨ sym (M .⊕-semigroup .assoc x (M / xs) (M / ys)) ⟩
      (x ⊕ (M / xs)) ⊕ (M / ys)
    ≡⟨⟩ 
      (M / (x ∷ xs)) ⊕ (M / ys)
    ∎

  ------

  reduce-promotion : {A : Set} {e : A} {_⊕_ : A → A → A}
    → (M : Monoid {A} e _⊕_) → (xss : List (List A))
    → M / concat xss ≡ M / ((M /_) * xss)
  reduce-promotion M [] = refl
  reduce-promotion {A} {e} {_⊕_} M (xs ∷ xss) = 
    begin
      M / (concat (xs ∷ xss))
    ≡⟨⟩
      M / (xs ++ concat xss)
    ≡⟨ reduce-distribution M xs (concat xss) ⟩
      (M / xs) ⊕ (M / concat xss)
    ≡⟨ cong ((M / xs) ⊕_) (reduce-promotion M xss) ⟩
      (M / xs) ⊕ (M / ((M /_) * xss))
    ≡⟨⟩
      M / ((M /_) * (xs ∷ xss))
    ∎

  ------

  foldl-absorb : {A B : Set} (e : A) (_⊕_ : A → B → A) (xs : List B) (a : B)
    → foldl _⊕_ e xs ⊕ a ≡ foldl _⊕_ e (xs ++ a ∷ [])
  foldl-absorb e _⊕_ [] a = refl
  foldl-absorb e _⊕_ (x ∷ xs) a rewrite foldl-absorb (e ⊕ x) _⊕_ xs a = refl

  {- Also for Problem BMF 1-1-(a) -}
  ⊗-⊕-swap : {A : Set} {0R : A} {1R : A} {_⊕_ : A → A → A} {_⊗_ : A → A → A}
    → (R : Semiring 0R 1R _⊕_ _⊗_) → (c : A) → (xs : List A) → (nonempty xs ≡ true)
    → (R .⊕-monoid / xs) ⊗ c ≡ R .⊕-monoid / ((_⊗ c) * xs)
  ⊗-⊕-swap R c [] ()
  ⊗-⊕-swap {A} {0R} {1R} {_⊕_} {_⊗_} R c (x ∷ []) refl =
    begin
      (R .⊕-monoid / (x ∷ [])) ⊗ c
    ≡⟨⟩
      (x ⊕ 0R) ⊗ c
    ≡⟨ cong (_⊗ c) (R .⊕-monoid .identityʳ x) ⟩
      x ⊗ c
    ≡⟨ sym (R .⊕-monoid .identityʳ (x ⊗ c)) ⟩
      (x ⊗ c) ⊕ 0R
    ∎
  ⊗-⊕-swap {A} {0R} {1R} {_⊕_} {_⊗_} R c (x ∷ x' ∷ xs) refl =
    begin
      (R .⊕-monoid / (x ∷ x' ∷ xs)) ⊗ c
    ≡⟨⟩
      (x ⊕ (R .⊕-monoid / (x' ∷ xs))) ⊗ c
    ≡⟨ R .distributivityʳ c x (R .⊕-monoid / (x' ∷ xs)) ⟩
      (x ⊗ c) ⊕ ((R .⊕-monoid / (x' ∷ xs)) ⊗ c)
    ≡⟨ cong ((x ⊗ c) ⊕_) (⊗-⊕-swap R c (x' ∷ xs) refl) ⟩
      (x ⊗ c) ⊕ (R .⊕-monoid / ((_⊗ c) * (x' ∷ xs)))
    ≡⟨⟩
      R .⊕-monoid / ((_⊗ c) * (x ∷ x' ∷ xs))
    ∎

  ------

  horner-f : {A : Set} {0R : A} {1R : A} {_⊕_ : A → A → A} {_⊗_ : A → A → A}
    → (R : Semiring 0R 1R _⊕_ _⊗_) → List A → A
  horner-f R = (R .⊕-monoid /_) ∘ ((R .⊗-monoid /_) *_) ∘ tails

  {- Also for Problem BMF 1-1-(first goal) -}
  horner-empty : {A : Set} {0R : A} {1R : A} {_⊕_ : A → A → A} {_⊗_ : A → A → A}
    → (R : Semiring 0R 1R _⊕_ _⊗_) → horner-f R [] ≡ 1R
  horner-empty {A} {0R} {1R} R rewrite R .⊕-monoid .identityʳ 1R = refl

  {- Also for Problem BMF 1-1-(second goal) -}
  horner-append : {A : Set} {0R : A} {1R : A} {_⊕_ : A → A → A} {_⊗_ : A → A → A}
    → (R : Semiring 0R 1R _⊕_ _⊗_) → (xs : List A) → (a : A)
    → horner-f R (xs ++ a ∷ []) ≡ (horner-f R xs ⊗ a) ⊕ 1R
  horner-append {A} {0R} {1R} {_⊕_} {_⊗_} R [] a =
    begin
      ((R .⊕-monoid /_) ∘ ((R .⊗-monoid /_) *_) ∘ tails) (a ∷ [])
    ≡⟨⟩
      (a ⊗ 1R) ⊕ (1R ⊕ 0R)
    ≡⟨ cong ((a ⊗ 1R) ⊕_) (R .⊕-monoid .identityʳ 1R) ⟩
      (a ⊗ 1R) ⊕ 1R
    ≡⟨ cong (_⊕ 1R) (R .⊗-monoid .identityʳ a) ⟩
      a ⊕ 1R
    ≡⟨ cong (_⊕ 1R) (sym (R .⊗-monoid .identityˡ a)) ⟩
      (1R ⊗ a) ⊕ 1R
    ≡⟨ cong (λ x → (x ⊗ a) ⊕ 1R) (sym (R .⊕-monoid .identityʳ 1R)) ⟩
      ((1R ⊕ 0R) ⊗ a) ⊕ 1R
    ∎
  horner-append {A} {0R} {1R} {_⊕_} {_⊗_} R (x ∷ xs) a =
    begin
      ((R .⊕-monoid /_) ∘ ((R .⊗-monoid /_) *_) ∘ tails) (x ∷ xs ++ a ∷ [])
    ≡⟨⟩
      R .⊕-monoid / ((R .⊗-monoid /_) * ((x ∷ xs ++ a ∷ []) ∷ (tails (xs ++ a ∷ []))))
    ≡⟨⟩
      R .⊕-monoid / (
        (R .⊗-monoid / (x ∷ xs ++ a ∷ []))
        ∷ ((R .⊗-monoid /_) * tails (xs ++ a ∷ []))
      )
    ≡⟨
      reduce-distribution (R .⊕-monoid)
      ((R .⊗-monoid / (x ∷ xs ++ a ∷ [])) ∷ [])
      ((R .⊗-monoid /_) * tails (xs ++ a ∷ []))
    ⟩
      ((R .⊗-monoid / (x ∷ xs ++ a ∷ [])) ⊕ 0R)
        ⊕ (R .⊕-monoid / (R .⊗-monoid /_) * tails (xs ++ a ∷ []))
    ≡⟨
      cong (_⊕ (R .⊕-monoid / (R .⊗-monoid /_) * tails (xs ++ a ∷ [])))
      (R .⊕-monoid .identityʳ (R .⊗-monoid / (x ∷ xs ++ a ∷ [])))
    ⟩
      (R .⊗-monoid / (x ∷ xs ++ a ∷ []))
        ⊕ (R .⊕-monoid / (R .⊗-monoid /_) * tails (xs ++ a ∷ []))
    ≡⟨ cong ((R .⊗-monoid / (x ∷ xs ++ a ∷ [])) ⊕_) (horner-append R xs a) ⟩
      (R .⊗-monoid / (x ∷ xs ++ a ∷ []))
      ⊕ (((R .⊕-monoid / (R .⊗-monoid /_) * tails xs) ⊗ a) ⊕ 1R)
    ≡⟨
      sym (R .⊕-monoid .⊕-semigroup .assoc (R .⊗-monoid / (x ∷ xs ++ a ∷ []))
      ((R .⊕-monoid / (R .⊗-monoid /_) * tails xs) ⊗ a) 1R)
    ⟩
      ((R .⊗-monoid / (x ∷ xs ++ a ∷ []))
        ⊕ ((R .⊕-monoid / (R .⊗-monoid /_) * tails xs) ⊗ a)) ⊕ 1R
    ≡⟨
      cong (λ u → (u ⊕ ((R .⊕-monoid / (R .⊗-monoid /_) * tails xs) ⊗ a)) ⊕ 1R)
      (reduce-distribution (R .⊗-monoid) (x ∷ xs) (a ∷ []))
    ⟩
      (((R .⊗-monoid / (x ∷ xs)) ⊗ (a ⊗ 1R))
        ⊕ ((R .⊕-monoid / (R .⊗-monoid /_) * tails xs) ⊗ a)) ⊕ 1R
    ≡⟨
      cong (λ u →
        ((((R .⊗-monoid / (x ∷ xs)) ⊗ u)
        ⊕ ((R .⊕-monoid / (R .⊗-monoid /_) * tails xs) ⊗ a)) ⊕ 1R)
      ) (R .⊗-monoid .identityʳ a)
    ⟩
      (((R .⊗-monoid / (x ∷ xs)) ⊗ a)
        ⊕ ((R .⊕-monoid / (R .⊗-monoid /_) * tails xs) ⊗ a)) ⊕ 1R
    ≡⟨
      cong (_⊕ 1R)
      (sym (R .distributivityʳ a (R .⊗-monoid / (x ∷ xs))
      (R .⊕-monoid / (R .⊗-monoid /_) * tails xs)))
    ⟩
      (((R .⊗-monoid / (x ∷ xs))
        ⊕ (R .⊕-monoid / (R .⊗-monoid /_) * tails xs)) ⊗ a) ⊕ 1R
    ∎

  ------

  open problem-3 using (reverse; reverse-involutive)

  horner-rule' : {A : Set} {0R : A} {1R : A} {_⊕_ : A → A → A} {_⊗_ : A → A → A}
    → (R : Semiring 0R 1R _⊕_ _⊗_) → (xs : List A)
    → horner-f R (reverse xs) ≡ foldl (λ x y → (x ⊗ y) ⊕ 1R) 1R (reverse xs)
  horner-rule' R [] = horner-empty R
  horner-rule' {A} {0R} {1R} {_⊕_} {_⊗_} R (x ∷ xs) =
    begin
      horner-f R (reverse (x ∷ xs))
    ≡⟨⟩
      horner-f R (reverse xs ++ x ∷ [])
    ≡⟨ horner-append R (reverse xs) x ⟩
      (horner-f R (reverse xs) ⊗ x) ⊕ 1R
    ≡⟨ cong (_⊙ x) (horner-rule' R xs) ⟩
      (foldl _⊙_ 1R (reverse xs)) ⊙ x
    ≡⟨ foldl-absorb 1R _⊙_ (reverse xs) x ⟩
      foldl _⊙_ 1R (reverse (x ∷ xs))
    ∎
    where
      _⊙_ : A → A → A
      _⊙_ = λ x y → (x ⊗ y) ⊕ 1R

  horner-rule : {A : Set} {0R : A} {1R : A} {_⊕_ : A → A → A} {_⊗_ : A → A → A}
    → (R : Semiring 0R 1R _⊕_ _⊗_) → (xs : List A)
    → horner-f R xs ≡ foldl (λ x y → (x ⊗ y) ⊕ 1R) 1R xs
  horner-rule {A} {0R} {1R} {_⊕_} {_⊗_} R xs =
    begin
      horner-f R xs
    ≡⟨ cong (horner-f R) (sym (cong-app reverse-involutive xs)) ⟩
      horner-f R (reverse (reverse xs))
    ≡⟨ horner-rule' R (reverse xs) ⟩
      foldl (λ x y → (x ⊗ y) ⊕ 1R) 1R (reverse (reverse xs))
    ≡⟨ cong (foldl (λ x y → (x ⊗ y) ⊕ 1R) 1R) (cong-app reverse-involutive xs) ⟩
      foldl (λ x y → (x ⊗ y) ⊕ 1R) 1R xs
    ∎

-----------------------------

module segment-properties where
  open import Data.Maybe using (just; nothing; Maybe)
  open import Data.Nat using (ℕ; suc; _+_) -- _≤_; z≤n; s≤s; _≟_; _⊔′_; _<ᵇ_)
  open import Data.List using (head; tail; take; drop)
  open import Data.List
    using (List; []; _∷_; [_]; _++_; foldl; foldr; map; concat; scanl; scanr)
  open import Data.Nat.Properties
    using (m≤m⊔n; m≤n⊔m; ≤-trans; ⊔≡⊔′; ⊔-comm; +-identityʳ; +-suc)

  open import Data.List.Relation.Unary.Any using (Any; here; there)
  open my-base

  infix 4 _⊆_ _⊆ᵖ_
  data _⊆_ {A : Set} (xs : List A) (ys : List A) : Set where
    segment : ∀ m n → take m (drop n ys) ≡ xs → xs ⊆ ys

  data _⊆ᵖ_ {A : Set} (xs : List A) (ys : List A) : Set where
    prefix : ∀ m → take m ys ≡ xs → xs ⊆ᵖ ys

  data _⊆ˢ_ {A : Set} (xs : List A) (ys : List A) : Set where
    suffix : ∀ n → drop n ys ≡ xs → xs ⊆ˢ ys

  open import Data.Product using (_×_; ∃-syntax; _,_)

  _∈_ : {A : Set} (x : A) (xs : List A) → Set
  x ∈ xs = Any (x ≡_) xs

  prefix→segment : {A : Set} {xs : List A} {ys : List A} → xs ⊆ᵖ ys → xs ⊆ ys
  prefix→segment (prefix m eq) = segment m 0 eq

  take-head : {A : Set} {x y : A} {xs ys : List A} {n : ℕ}
    → take (suc n) (y ∷ ys) ≡ x ∷ xs → y ≡ x
  take-head pf = just-injective (cong head pf)

  take-tail : {A : Set} {x y : A} {xs ys : List A} {n : ℕ}
    → take (suc n) (y ∷ ys) ≡ x ∷ xs → take n ys ≡ xs
  take-tail pf = just-injective (cong tail pf)

  take-drop-swap : {A : Set} (xs : List A) (m n : ℕ)
    → take m (drop n xs) ≡ drop n (take (m + n) xs)
  take-drop-swap xs m 0 rewrite +-identityʳ m = refl
  take-drop-swap [] 0 (suc n) = refl
  take-drop-swap [] (suc m) (suc n) = refl
  take-drop-swap (x ∷ xs) m (suc n) =
    begin
      take m (drop (suc n) (x ∷ xs))
    ≡⟨⟩
      take m (drop n xs)
    ≡⟨ take-drop-swap xs m n ⟩
      drop n (take (m + n) xs)
    ≡⟨⟩
      drop (suc n) (take (suc (m + n)) (x ∷ xs))
    ≡⟨ cong (λ t → drop (suc n) (take t (x ∷ xs))) (sym (+-suc m n)) ⟩
      drop (suc n) (take (m + suc n) (x ∷ xs))
    ∎

  ---

  con-keep-∈ : {A : Set} (x x' : A) (xs : List A) → x ∈ xs → x ∈ (x' ∷ xs)
  con-keep-∈ x x' xs x∈xs = there x∈xs

  ++-keep-∈ˡ : ∀ {A : Set} {x : A} {xs ys : List A} → x ∈ xs → x ∈ (xs ++ ys)
  ++-keep-∈ˡ (here eq)  = here eq
  ++-keep-∈ˡ (there pf) = there (++-keep-∈ˡ pf)

  ++-keep-∈ʳ : ∀ {A : Set} {y : A} {xs ys : List A} → y ∈ ys → y ∈ (xs ++ ys)
  ++-keep-∈ʳ {A} {y} {[]} y∈ys = y∈ys
  ++-keep-∈ʳ {A} {y} {x ∷ xs} y∈ys = there (++-keep-∈ʳ {A} {y} {xs} y∈ys)

  concat-keep-∈ : {A : Set} {x : A} {xs : List A} {xss : List (List A)}
    → x ∈ xs → xs ∈ xss → x ∈ concat xss
  concat-keep-∈ x∈xs (here refl) = ++-keep-∈ˡ x∈xs
  concat-keep-∈ x∈xs (there pf) = ++-keep-∈ʳ (concat-keep-∈ x∈xs pf)

  map-keep-∈ : {A B : Set} {x : A} {xs : List A} → (f : A → B)
    → x ∈ xs → f x ∈ map f xs
  map-keep-∈ f (here pf) rewrite pf = here refl
  map-keep-∈ {A} {B} {x} {x' ∷ xs} f (there pf)
    = con-keep-∈ (f x) (f x') (map f xs) (map-keep-∈ f pf)

  ---

  prefix∈inits : {A : Set} {xs : List A} {ys : List A} → xs ⊆ᵖ ys → xs ∈ inits ys
  prefix∈inits {A} {[]} {[]} (prefix m pf) = here refl
  prefix∈inits {A} {[]} {y ∷ ys} (prefix m pf) = here refl
  prefix∈inits {A} {x ∷ xs} {y ∷ ys} (prefix (suc m) pf) rewrite take-head pf
    = there (map-keep-∈ (x ∷_) (prefix∈inits (prefix m (take-tail pf))))

  same-head : {A : Set} {x y : A} {xs : List A} {yss : List (List A)}
    → (x ∷ xs) ∈ map (y ∷_) yss → x ≡ y
  same-head {A} {x} {y} {xs} {ys ∷ yss} (here eq) = just-injective (cong head eq)
  same-head {A} {x} {y} {xs} {ys ∷ yss} (there pf) = same-head pf

  same-tail : {A : Set} {x y : A} {xs : List A} {yss : List (List A)}
    → (x ∷ xs) ∈ map (y ∷_) yss → xs ∈ yss
  same-tail {A} {x} {y} {xs} {ys ∷ yss} (here eq) = here (just-injective (cong tail eq))
  same-tail {A} {x} {y} {xs} {ys ∷ yss} (there pf) = there (same-tail pf)

  init-same-head : {A : Set} {x y : A} {xs ys : List A}
    → (x ∷ xs) ∈ inits (y ∷ ys) → x ≡ y
  init-same-head (here ())
  init-same-head (there pf) = same-head pf

  init-same-tail : {A : Set} {x y : A} {xs ys : List A}
    → (x ∷ xs) ∈ inits (y ∷ ys) → xs ∈ inits ys
  init-same-tail (here ())
  init-same-tail (there pf) = same-tail pf

  prefix-append : {A : Set} {xs ys : List A} → (x : A) → xs ⊆ᵖ ys → (x ∷ xs) ⊆ᵖ (x ∷ ys)
  prefix-append x (prefix m eq) = prefix (suc m) (cong (x ∷_) eq)

  init∈prefices : {A : Set} {xs ys : List A} → xs ∈ inits ys → xs ⊆ᵖ ys
  init∈prefices {A} {[]} {[]} _ = prefix 0 refl
  init∈prefices {A} {[]} {y ∷ ys} _ = prefix 0 refl
  init∈prefices {A} {x ∷ xs} {[]} (here ())
  init∈prefices {A} {x ∷ xs} {y ∷ ys} (here ())
  init∈prefices {A} {x ∷ xs} {y ∷ ys} (there pf) rewrite init-same-head (there pf) =
    let
      xs⊆ᵖys = init∈prefices (init-same-tail (there pf))
    in
      prefix-append y xs⊆ᵖys

  suffix-append : {A : Set} {xs ys : List A} → (y : A) → xs ⊆ˢ ys → xs ⊆ˢ (y ∷ ys)
  suffix-append y (suffix n eq) = suffix (suc n) eq

  suffix∈tails : {A : Set} {xs : List A} {ys : List A} → xs ⊆ˢ ys → xs ∈ tails ys
  suffix∈tails {A} {[]} {[]} _ = here refl
  suffix∈tails {A} {xs} {y ∷ ys} (suffix 0 pf) = here (sym pf)
  suffix∈tails {A} {xs} {y ∷ ys} (suffix (suc n) pf)
    = con-keep-∈ xs (y ∷ ys) (tails ys) (suffix∈tails (suffix n pf))

  tail∈suffices : {A : Set} {xs ys : List A} → xs ∈ tails ys → xs ⊆ˢ ys
  tail∈suffices {A} {[]} {[]} _ = suffix 0 refl
  tail∈suffices {A} {x ∷ xs} {[]} (here ())
  tail∈suffices {A} {xs} {y ∷ ys} (here eq) = suffix 0 (sym eq)
  tail∈suffices {A} {xs} {y ∷ ys} (there pf) = suffix-append y (tail∈suffices pf)

  segment-append : {A : Set} {xs ys : List A} → (y : A) → xs ⊆ ys → xs ⊆ (y ∷ ys)
  segment-append _ (segment m n pf) = segment m (suc n) pf

  ---

  pre-tails∈segs : {A : Set} {xs : List A} {ys : List A}
    → xs ⊆ᵖ ys → tails xs ∈ map tails (inits ys)
  pre-tails∈segs xs⊆ᵖys = map-keep-∈ tails (prefix∈inits xs⊆ᵖys)

  segment∈segs : {A : Set} {xs : List A} {ys : List A} → (xs ⊆ ys) → xs ∈ segs ys
  segment∈segs {A} {[]} {[]} _ = here refl
  segment∈segs {A} {[]} {y ∷ ys} _ = here refl
  segment∈segs {A} {xs} {ys} (segment m n pf) =
    concat-keep-∈ (suffix∈tails xs⊆ˢtar) (pre-tails∈segs tar⊆ᵖys)
    where
      tar = take (m + n) ys
      xs⊆ˢtar : xs ⊆ˢ tar
      xs⊆ˢtar = suffix n (trans (sym (take-drop-swap ys m n)) pf)
      tar⊆ᵖys : tar ⊆ᵖ ys
      tar⊆ᵖys = prefix (m + n) refl
  
  pre-suf-segment : {A : Set} {xs pre suf : List A} → pre ⊆ᵖ xs → suf ⊆ˢ pre → suf ⊆ xs
  pre-suf-segment (prefix m ispre) (suffix 0 issuf) = segment m 0 (trans ispre issuf)
  pre-suf-segment (prefix 0 ispre) (suffix (suc n) issuf)
    = segment 0 0 (sym (trans (sym issuf) (cong (drop (suc n)) (sym ispre))))
  pre-suf-segment {A} {[]} (prefix (suc m) ispre) (suffix (suc n) issuf)
    = segment 0 0 (sym (trans (sym issuf) (cong (drop (suc n)) (sym ispre))))
  pre-suf-segment {A} {x ∷ xs} {[]} (prefix (suc m) ())
  pre-suf-segment {A} {x ∷ xs} {x' ∷ pre} (prefix (suc m) ispre) (suffix (suc n) issuf) =
    let
      suf⊆xs = pre-suf-segment (prefix m (just-injective (cong tail ispre))) (suffix n issuf)
    in
      segment-append x suf⊆xs

-----------------------------

module general-mss
  (A : Set) (0R : A) (1R : A)
  (_⊕_ _⊗_ : A → A → A) (SR : Semiring 0R 1R _⊕_ _⊗_) where

  open import Data.List using (List; []; _∷_; [_]; _++_; foldl; foldr; map; concat; scanl; scanr)
  open bmf

  _⊙_ : A → A → A
  x ⊙ y = (x ⊗ y) ⊕ 1R

  sum : List A → A -- it's "product"
  sum = foldr _⊗_ 1R

  maximum : List A → A -- it's "sum"
  maximum = foldr _⊕_ 0R

  mss : List A → A
  mss = maximum ∘ map sum ∘ segs

  mss-medi : List A → A
  mss-medi = maximum ∘ ((maximum ∘ (sum *_) ∘ tails) *_) ∘ inits

  mss-fast : List A → A
  mss-fast = maximum ∘ scanl _⊙_ 1R

  derivation-mss-to-medi : mss ≡ mss-medi
  derivation-mss-to-medi =
    begin
      mss
    ≡⟨⟩
      maximum ∘ (sum *_) ∘ segs
    ≡⟨⟩
      maximum
      ∘ (sum *_) ∘ concat -- <- promote
      ∘ (tails *_) ∘ inits
    ≡⟨
      cong (λ f → maximum ∘ f ∘ (tails *_) ∘ inits)
      (extensionality (map-promotion sum))
    ⟩
      maximum ∘ concat -- <- promote
      ∘ ((sum *_) *_) ∘ (tails *_) ∘ inits
    ≡⟨
      cong (λ f → f ∘ ((sum *_) *_) ∘ (tails *_) ∘ inits)
      (extensionality (reduce-promotion (SR .⊕-monoid)))
    ⟩
      maximum ∘ (maximum *_)
      ∘ ((sum *_) *_) ∘ (tails *_) -- <- compose
      ∘ inits
    ≡⟨
      cong (λ f → maximum ∘ (maximum *_) ∘ f ∘ inits)
      (extensionality (map-composition (sum *_) tails))
    ⟩
      maximum
      ∘ (maximum *_) ∘ (((sum *_) ∘ tails) *_) -- <- compose
      ∘ inits
    ≡⟨
      cong (λ f → maximum ∘ f ∘ inits)
      (extensionality (map-composition maximum ((sum *_) ∘ tails)))
    ⟩
      maximum ∘ ((maximum ∘ (sum *_) ∘ tails) *_) ∘ inits
    ∎

  ---

  derivation-medi-to-fast : mss-medi ≡ mss-fast
  derivation-medi-to-fast =
    begin
      mss-medi
    ≡⟨⟩
      maximum ∘ (
        (maximum ∘ (sum *_) ∘ tails) -- <- Horner's rule
      *_) ∘ inits
    ≡⟨
      cong (λ f → (maximum ∘ (f *_) ∘ inits))
      (extensionality (horner-rule SR))
    ⟩
      maximum ∘ ((foldl _⊙_ 1R) *_) ∘ inits
    ≡⟨
      cong (maximum ∘_) (extensionality (prefix-accumulation 1R _⊙_))
    ⟩
      mss-fast
    ∎
  
  ---

  general-derivation : mss ≡ mss-fast
  general-derivation = trans derivation-mss-to-medi derivation-medi-to-fast

-----------------------------

module ℕ-mss where
  open import Data.Nat using (ℕ; _+_; _⊔_)
  open import Data.List using (List; []; _∷_; [_]; _++_; foldl; foldr; map; concat; scanl; scanr)
  open ℕ-algebra

  sum : List ℕ → ℕ
  sum = foldr _+_ 0

  maximum : List ℕ → ℕ
  maximum = foldr _⊔_ 0

  mss : List ℕ → ℕ
  mss = maximum ∘ map sum ∘ segs

  _⊙_ : ℕ → ℕ → ℕ
  x ⊙ y = (x + y) ⊔ 0

  mss-fast : List ℕ → ℕ
  mss-fast = maximum ∘ scanl _⊙_ 0

  open general-mss ℕ 0 0 _⊔_ _+_ ℕ-⊔-+-semiring using (general-derivation)

  {-
    Here we defined `mss` and `mss-fast` expicitly above
    to show that those in general-mss are just what we desire.
  -}
  derivation : mss ≡ mss-fast
  derivation = general-derivation

  module mss-is-correct where
    open import Data.Empty using (⊥; ⊥-elim)
    open import Data.Maybe using (just; nothing; Maybe)
    open import Data.Bool using (true; false)
    open import Function.Base using (case_of_)
    open import Relation.Binary.Core using (_⇒_)
    open import Data.Nat using (suc; _≤_; z≤n; s≤s; _≟_; _⊔′_; _<ᵇ_)
    open import Data.List using (head; tail; take; drop)
    open import Relation.Nullary.Decidable.Core using (yes; no)
    open import Relation.Nullary.Negation.Core using (¬_)
    open import Data.Nat.Properties
      using (m≤m⊔n; m≤n⊔m; ≤-trans; ⊔≡⊔′; ⊔-comm; +-identityʳ; +-suc)
    open import Data.List.Relation.Unary.Any using (Any; here; there)

    open bmf
    open my-base
    open 𝕃-algebra
    open segment-properties
    open import Data.Product using (_×_; ∃-syntax; _,_)
  
    ---

    maximum-is-max : {x : ℕ} {xs : List ℕ} → x ∈ xs → x ≤ maximum xs
    maximum-is-max {x} {[]} ()
    maximum-is-max {x} {x' ∷ xs} (there pf) = ≤-trans x≤rhs rhs≤ori
      where
        x≤rhs : x ≤ maximum xs
        x≤rhs = maximum-is-max pf
        rhs≤ori : maximum xs ≤ maximum (x' ∷ xs)
        rhs≤ori = m≤n⊔m x' (maximum xs)
    maximum-is-max {x} {x' ∷ xs} (here pf) rewrite sym pf = m≤m⊔n x (maximum xs)

    m⊔′n-deduce : {m n : ℕ} → ¬ (m ≡ m ⊔′ n) → m ⊔′ n ≡ n
    m⊔′n-deduce {m} {n} pf with keep (m <ᵇ n)
    m⊔′n-deduce {m} {n} pf | true , lt rewrite lt = refl
    m⊔′n-deduce {m} {n} pf | false , ge = ⊥-elim (pf m⊔′n≡m) where
      m⊔′n≡m : m ≡ m ⊔′ n
      m⊔′n≡m rewrite ge = refl

    ---

    m⊔n-deduce : {m n : ℕ} → ¬ (m ≡ m ⊔ n) → m ⊔ n ≡ n
    m⊔n-deduce {m} {n} pf rewrite ⊔≡⊔′ m n = m⊔′n-deduce pf

    ---

    mss-is-max : ∀ {xs ys} → xs ⊆ ys → sum xs ≤ mss ys
    mss-is-max xs⊆ys = maximum-is-max (map-keep-∈ sum (segment∈segs xs⊆ys))

    max-raise-map : {A : Set} {xs : List A} (f : A → ℕ)
      → nonempty xs ≡ true → ∃[ x ] (x ∈ xs) × (f x ≡ maximum (map f xs))
    max-raise-map {A} {[]} f ()
    max-raise-map {A} {x ∷ xs} f refl with f x ≟ maximum (map f (x ∷ xs))
    max-raise-map {A} {x ∷ xs} f refl | yes pf = x , (here refl , pf)
    max-raise-map {A} {x ∷ xs} f refl | no pf with keep (nonempty xs)
    max-raise-map {A} {x ∷ xs} f refl | no pf | true , ne =
      let
        who , (who∈xs , ismax) = max-raise-map f ne
      in
        who , (con-keep-∈ who x xs who∈xs  , trans ismax (sym (m⊔n-deduce pf)))
    max-raise-map {A} {x ∷ xs} f refl | no pf | false , ie rewrite ¬nonempty→[] ie
      = ⊥-elim (pf only-x) where
        only-x : f x ≡ maximum (map f (x ∷ []))
        only-x with f x
        ... | 0 = refl
        ... | (suc fx) = refl

    ---

    best-suffix-exists : (xs : List ℕ)
      → ∃[ ys ] ys ⊆ˢ xs × sum ys ≡ (maximum ∘ (sum *_) ∘ tails) xs
    best-suffix-exists xs = 
      let
        ys , (ys∈tails , is-this-sum) = max-raise-map sum (tails-nonempty xs)
      in
        ys , (tail∈suffices ys∈tails , is-this-sum)

    open general-mss ℕ 0 0 _⊔_ _+_ ℕ-⊔-+-semiring
      using (mss-medi; derivation-mss-to-medi; derivation-medi-to-fast)

    mss-medi-exists : {xs : List ℕ} → ∃[ ys ] ys ⊆ xs × sum ys ≡ mss-medi xs
    mss-medi-exists {xs} =
      let
        pre , (pre∈inits , best-pre) = max-raise-map
          (maximum ∘ (sum *_) ∘ tails) (inits-nonempty xs)
        pre⊆ᵖxs = init∈prefices pre∈inits
        suf , (suf⊆ˢpre , best-suf) = best-suffix-exists pre
      in
        suf , (pre-suf-segment pre⊆ᵖxs suf⊆ˢpre , trans best-suf best-pre)

    mss-exists : {xs : List ℕ} → ∃[ ys ] ys ⊆ xs × sum ys ≡ mss xs
    mss-exists {xs} =
      let
        ys , (ys⊆xs , sum≡mss-medi) = mss-medi-exists {xs}
      in
        ys , (ys⊆xs , trans sum≡mss-medi (sym (cong-app derivation-mss-to-medi xs)))


-----------------------------

module ℤ-mss where
  open import Data.Integer using (+0)
  open ℤ∞-base using (ℤ∞; -∞; fin; _+_; _⊔_)
  open ℤ∞-algebra using (ℤ∞-⊔-+-semiring)
  open general-mss ℤ∞ -∞ (fin +0) _⊔_ _+_ ℤ∞-⊔-+-semiring
    using (mss; mss-fast; general-derivation)

  {- That's it. -}
  derivation : mss ≡ mss-fast
  derivation = general-derivation

-----------------------------

module bmf2-1 where

  open import Data.Product using (_×_; _,_; Σ-syntax; proj₁)
  open import Data.Nat using (ℕ; _+_; zero; suc)
  open import Data.List using (List; []; _∷_; [_]; _++_)
  open import Relation.Nullary using (¬_)

  infixr 5 _∷′_
  data NList (A : Set) : Set where
    [_]′ : (x : A) → NList A
    _∷′_ : (x : A) → (xs : NList A) → NList A

  infixr 5 _++′_
  _++′_ : ∀ {A : Set} → NList A → NList A → NList A
  [ x ]′ ++′ ys = x ∷′ ys
  (x ∷′ xs) ++′ ys = x ∷′ xs ++′ ys

  ++′-assoc : ∀ {A : Set} (xs ys zs : NList A) → (xs ++′ ys) ++′ zs ≡ xs ++′ ys ++′ zs
  ++′-assoc [ x ]′    ys zs = refl
  ++′-assoc (x ∷′ xs) ys zs = cong (x ∷′_) (++′-assoc xs ys zs)

  NList-++′-semigroup : ∀ {A : Set} → Semigroup {NList A} _++′_
  NList-++′-semigroup .assoc = ++′-assoc

  reduce : ∀ {A : Set} → (_⊕_ : A → A → A) → NList A → A
  reduce {A} _⊕_ [ x ]′ = x
  reduce {A} _⊕_ (x ∷′ xs) = x ⊕ reduce _⊕_ xs

  map : ∀ {A B : Set} → (f : A → B) → NList A → NList B
  map f [ x ]′ = [ f x ]′
  map f (x ∷′ xs) = f x ∷′ map f xs

  record Homomorphism
    {A : Set} {_⊕_ : A → A → A} (m₁ : Semigroup _⊕_)
    {B : Set} {_⊗_ : B → B → B} (m₂ : Semigroup _⊗_)
    (f : A → B) : Set where
    field
      distrib : (x y : A) → f (x ⊕ y) ≡ f x ⊗ f y
  open Homomorphism

  split : ∀ {A : Set} → NList A → List A × A
  split = reduce combine ∘ map (λ x → [] , x)
    where
      combine : {A : Set} → List A × A → List A × A → List A × A
      combine (xs , x) (ys , y) = xs ++ (x ∷ ys) , y

  reduce-map-distrib : {A B : Set} (f : A → B) (_⊗_ : B → B → B) (G : Semigroup _⊗_)
    → (xs ys : NList A)
    → (reduce _⊗_ ∘ map f) (xs ++′ ys) ≡ (reduce _⊗_ ∘ map f) xs ⊗ (reduce _⊗_ ∘ map f) ys
  reduce-map-distrib f _⊗_ G [ x ]′ ys = refl
  reduce-map-distrib f _⊗_ G (x ∷′ xs) ys = let h = reduce _⊗_ ∘ map f in
    begin
      h ((x ∷′ xs) ++′ ys)
    ≡⟨⟩
      reduce _⊗_ (f x ∷′ map f (xs ++′ ys))
    ≡⟨⟩
      f x ⊗ h (xs ++′ ys)
    ≡⟨ cong (f x ⊗_) (reduce-map-distrib f _⊗_ G xs ys) ⟩
      f x ⊗ (h xs ⊗ h ys)
    ≡⟨ sym (G .assoc (f x) (h xs) (h ys)) ⟩
      h (x ∷′ xs) ⊗ h ys
    ∎

  reduce-map-is-homomorphism : ∀ {A B : Set}
    (f : A → B) (_⊗_ : B → B → B) (G : Semigroup _⊗_)
    → Homomorphism NList-++′-semigroup G (reduce _⊗_ ∘ map f)
  reduce-map-is-homomorphism f _⊗_ G  = homo
    where
      homo : Homomorphism NList-++′-semigroup G (reduce _⊗_ ∘ map f)
      homo .distrib = reduce-map-distrib f _⊗_ G

  NList2List : {A : Set} → NList A → List A
  NList2List [ x ]′ = [ x ]
  NList2List (x ∷′ xs) = x ∷ NList2List xs

  split-is-correct : split (1 ∷′ 2 ∷′ 3 ∷′ [ 4 ]′) ≡ (1 ∷ 2 ∷ 3 ∷ [] , 4)
  split-is-correct = refl

  split-is-indeed-correct : ∀ {A : Set} (xs : NList A)
    → let (ys , z) = split xs in NList2List xs ≡ ys ++ [ z ]
  split-is-indeed-correct [ x ]′ = refl
  split-is-indeed-correct (x ∷′ xs) =
    begin
      NList2List (x ∷′ xs)
    ≡⟨⟩
      x ∷ NList2List xs
    ≡⟨ cong (x ∷_) (split-is-indeed-correct xs) ⟩
      let (ys , z) = split xs in x ∷ (ys ++ [ z ])
    ∎ -- That's why I love Agda. I haven't checked it.

  init : ∀ {A : Set} → NList A → List A
  init = proj₁ ∘ split

  open import Data.Empty using (⊥; ⊥-elim)

  init-is-not-homomorphism : ∀ {_⊗_ : List ℕ → List ℕ → List ℕ} (m : Semigroup _⊗_)
    → ¬ Homomorphism NList-++′-semigroup m (init {ℕ})
  init-is-not-homomorphism {_⊗_} m H = ⊥-elim (¬paradox paradox)
    where
      []⊗[]≡[any] : (x : ℕ) → [] ⊗ [] ≡ [ x ]
      []⊗[]≡[any] x =
        begin
          [] ⊗ []
        ≡⟨⟩
          init [ x ]′ ⊗ init [ x ]′
        ≡⟨ sym (H .distrib [ x ]′ [ x ]′) ⟩
          init ([ x ]′ ++′ [ x ]′)
        ≡⟨⟩
          [ x ]
        ∎

      paradox : [ 0 ] ≡ [ 1 ]
      paradox rewrite sym ([]⊗[]≡[any] 0) | []⊗[]≡[any] 1 = refl

      ¬paradox : [ 0 ] ≢ [ 1 ]
      ¬paradox ()
