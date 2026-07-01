Set Warnings "-notation-overridden,-parsing,-deprecated-hint-without-locality".
From Stdlib Require Import Strings.String.
From LF Require Export ProofObjects.

Inductive count (P:nat->Prop) : list nat -> nat -> Prop :=
  | cnil : count P nil 0
  | cyes x l n (H:count P l n) : P x -> count P (x::l) (S n)
  | cno x l n (H:count P l n) : ~(P x) -> count P (x::l) n.

Definition iszero : nat -> Prop.
Proof.
  intros n.
  apply (n=0).
Defined.

Inductive sinstr : Type :=
  | SPush (n:nat)
  | SPlus.

Inductive bstep : list sinstr -> list nat -> list nat -> Prop :=
  | B_Nil st : bstep nil st st
  | B_Push n prog st st' :
    bstep prog (n::st) st' -> bstep ((SPush n)::prog) st st'
  | B_Plus a b prog st st' :
    bstep prog ((a + b)::st) st' -> bstep (SPlus::prog) (a::b::st) st'.

Example btest1 : bstep [SPush 1] [2] [1;2].
Proof.
  apply B_Push.
  apply B_Nil.
Qed.

Example btest2 : bstep [SPlus;SPlus] [4;2;1] [7].
Proof.
  apply B_Plus.
  apply B_Plus.
  apply B_Nil.
Qed.

Inductive cstep : list sinstr -> list nat -> list nat -> Prop :=
  | C_Nil st : cstep nil st st
  | C_Push n prog st : cstep ((SPush n)::prog) st (n::st)
  | C_Plus a b prog st : cstep (SPlus::prog) (a::b::st) ((a + b)::st).

Example ctest1 : cstep [SPush 1] [2] [1;2].
Proof.
  apply C_Push.
Qed.

Example ctest2 : cstep [SPlus;SPlus] [4;2;1] [6;1].
Proof.
  apply C_Plus.
Qed.

Definition neq10 : 1 <> 0 :=
  fun contra : 1 = 0 => eq_ind 0 (
    fun n : nat => match n with
      | 0 => True
      | _ => False
    end
  ) I 1 contra.
