import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; _≢_; refl; trans; sym; cong; cong-app; subst)
open Eq.≡-Reasoning using (begin_; _∎)

infixr 2 _≡⟨⟩_ _≡⟨_⟩_

_≡⟨⟩_ : ∀ {ℓ} {A : Set ℓ} (x : A) {y : A} → x ≡ y → x ≡ y
x ≡⟨⟩ refl = refl

_≡⟨_⟩_ : ∀ {ℓ} {A : Set ℓ} (x : A) {y z : A} → x ≡ y → y ≡ z → x ≡ z
x ≡⟨ refl ⟩ refl = refl

record Group {A : Set} (_*_ : A → A → A) : Set where
  field
    e : A
    inv : A → A
    assoc : ∀ x y z → (x * y) * z ≡ x * (y * z)
    identᴸ : ∀ x → e * x ≡ x
    identᴿ : ∀ x → x * e ≡ x
    invertᴸ : ∀ x → inv x * x ≡ e
    invertᴿ : ∀ x → x * inv x ≡ e
open Group

module Left-Inversion-Always-Exists where
  record Group' {A : Set} (_*_ : A → A → A) : Set where
    field
      e : A
      invᴸ : A → A
      assoc : ∀ x y z → (x * y) * z ≡ x * (y * z)
      identᴸ : ∀ x → e * x ≡ x
      identᴿ : ∀ x → x * e ≡ x
      invertᴸ : ∀ x → invᴸ x * x ≡ e
  open Group'

  Group'≡Group : {A : Set} {_*_ : A → A → A} (G' : Group' _*_) → Group _*_
  Group'≡Group {A} {_*_} G' = G
    where
      G : Group _*_
      G .e = G' .e
      G .inv = G' .invᴸ
      G .assoc = G' .assoc
      G .identᴸ = G' .identᴸ
      G .identᴿ = G' .identᴿ
      G .invertᴸ = G' .invertᴸ
      G .invertᴿ x =
        begin
          x * G .inv x
        ≡⟨ sym (G. identᴸ (x * G .inv x)) ⟩
          G .e * (x * G .inv x)
        ≡⟨ cong (_* (x * G .inv x)) (sym (G .invertᴸ (G .inv x))) ⟩
          (G .inv (G .inv x) * G .inv x) * (x * G .inv x)
        ≡⟨ G .assoc (G .inv (G .inv x)) (G .inv x) (x * G .inv x) ⟩
          G .inv (G .inv x) * (G .inv x * (x * G .inv x))
        ≡⟨ cong (G .inv (G .inv x) *_) (sym (G .assoc (G .inv x) x (G .inv x))) ⟩
          G .inv (G .inv x) * ((G .inv x * x) * G .inv x)
        ≡⟨ cong (λ t → G .inv (G .inv x) * (t * G .inv x)) (G .invertᴸ x) ⟩
          G .inv (G .inv x) * (G .e * G .inv x)
        ≡⟨ cong (G .inv (G .inv x) *_) (G .identᴸ (G .inv x)) ⟩
          G .inv (G .inv x) * G .inv x
        ≡⟨ G .invertᴸ (G .inv x) ⟩
          G .e
        ∎

--------------------------

module Has-Left-And-Right-Inversion where
  record Group' {A : Set} (_*_ : A → A → A) : Set where
    field
      e : A
      invᴸ : A → A
      invᴿ : A → A
      assoc : ∀ x y z → (x * y) * z ≡ x * (y * z)
      identᴸ : ∀ x → e * x ≡ x
      identᴿ : ∀ x → x * e ≡ x
      invertᴸ : ∀ x → invᴸ x * x ≡ e
      invertᴿ : ∀ x → x * invᴿ x ≡ e
  open Group'

  Group'≡Group : {A : Set} {_*_ : A → A → A} (G' : Group' _*_) → Group _*_
  Group'≡Group {A} {_*_} G' = G
    where
      G : Group _*_
      G .e = G' .e
      G .inv = G' .invᴸ
      G .assoc = G' .assoc
      G .identᴸ = G' .identᴸ
      G .identᴿ = G' .identᴿ
      G .invertᴸ = G' .invertᴸ
      G .invertᴿ x =
        begin
          x * G .inv x
        ≡⟨ cong (x *_) (sym (G .identᴿ (G .inv x))) ⟩
          x * (G .inv x * G .e)
        ≡⟨ cong (λ t → x * (G .inv x * t)) (sym (G' .invertᴿ x)) ⟩
          x * (G .inv x * (x * G' .invᴿ x))
        ≡⟨ cong (x *_) (sym (G .assoc (G .inv x) x (G' .invᴿ x))) ⟩
          x * ((G .inv x * x) * G' .invᴿ x)
        ≡⟨ cong (λ t → x * (t * G' .invᴿ x)) (G .invertᴸ x) ⟩
          x * (G .e * G' .invᴿ x)
        ≡⟨ cong (x *_) (G .identᴸ (G' .invᴿ x)) ⟩
          x * G' .invᴿ x
        ≡⟨ G' .invertᴿ x ⟩
          G .e
        ∎

--------------------------

module Has-Left-And-Right-One where
  record Group' {A : Set} (_*_ : A → A → A) : Set where
    field
      eᴸ : A
      eᴿ : A
      inv : A → A
      assoc : ∀ x y z → (x * y) * z ≡ x * (y * z)
      identᴸ : ∀ x → eᴸ * x ≡ x
      identᴿ : ∀ x → x * eᴿ ≡ x
      invertᴸ : ∀ x → inv x * x ≡ eᴸ
      invertᴿ : ∀ x → x * inv x ≡ eᴸ
  open Group'

  Group'≡Group : {A : Set} {_*_ : A → A → A} (G' : Group' _*_) → Group _*_
  Group'≡Group {A} {_*_} G' = G
    where
      G : Group _*_
      G .e = G' .eᴸ
      G .inv = G' .inv
      G .assoc = G' .assoc
      G .identᴸ = G' .identᴸ
      G .invertᴸ = G' .invertᴸ
      G .invertᴿ = G' .invertᴿ
      G .identᴿ x =
        begin
          x * G .e
        ≡⟨ cong (x *_) (sym (G' .identᴿ (G .e))) ⟩
          x * (G .e * G' .eᴿ)
        ≡⟨ cong (x *_) (G. identᴸ (G' .eᴿ)) ⟩
          x * G' .eᴿ
        ≡⟨ G' .identᴿ x ⟩
          x
        ∎

--------------------------

module Has-Unique-Left-One where
  record Group' {A : Set} (_*_ : A → A → A) : Set where
    field
      eᴸ : A
      inv : A → A
      assoc : ∀ x y z → (x * y) * z ≡ x * (y * z)
      identᴸ : ∀ x → eᴸ * x ≡ x
      invertᴸ : ∀ x → inv x * x ≡ eᴸ
      invertᴿ : ∀ x → x * inv x ≡ eᴸ
  open Group'

  Group'≡Group : {A : Set} {_*_ : A → A → A} (G' : Group' _*_) → Group _*_
  Group'≡Group {A} {_*_} G' = G
    where
      G : Group _*_
      G .e = G' .eᴸ
      G .inv = G' .inv
      G .assoc = G' .assoc
      G .identᴸ = G' .identᴸ
      G .invertᴸ = G' .invertᴸ
      G .invertᴿ = G' .invertᴿ
      G .identᴿ x =
        begin
          x * G .e
        ≡⟨ cong (x *_) (sym (G .invertᴸ x)) ⟩
          x * (G .inv x * x)
        ≡⟨ sym (G .assoc x (G .inv x) x) ⟩
          (x * G .inv x) * x
        ≡⟨ cong (_* x) (G .invertᴿ x) ⟩
          G .e * x
        ≡⟨ G .identᴸ x ⟩
          x
        ∎