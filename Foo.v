Require Import List.
Import ListNotations.
Open Scope list_scope.

Theorem length_s_n: forall (n : nat) (e : nat) (lst : list nat),
  List.length (e :: lst) = S n -> List.length (lst) = n.
Proof.
  intros n e lst H. (* Introduce all the variables and the hypothesis H *)
  simpl in H. (* Simplify the expression in hypothesis H *)
  apply eq_add_S in H. (* Convert "S n = S (length lst)" to "n = length lst" *)
  exact H. (* Since the hypothesis H now matches the goal, the proof is complete *)
Qed.

