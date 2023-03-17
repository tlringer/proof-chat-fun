Require Import List.
Import ListNotations.
Open Scope list_scope.

(* A successful example from ProofChat: *)
Theorem length_s_n: forall (n : nat) (e : nat) (lst : list nat),
  List.length (e :: lst) = S n -> List.length (lst) = n.
Proof.
  intros n e lst H. (* Introduce all the variables and the hypothesis H *)
  simpl in H. (* Simplify the expression in hypothesis H *)
  apply eq_add_S in H. (* Convert "S n = S (length lst)" to "n = length lst" *)
  exact H. (* Since the hypothesis H now matches the goal, the proof is complete *)
Qed.

(* A failed example from ProofChat (fails on "reflexivity", goal is not what it claims the goal is: *)
Lemma list_chop_determ :
  forall (x x0 : list nat) (stk : list nat) n,
  stk = x ++ x0 -> Datatypes.length stk > n -> Datatypes.length x = n ->
  firstn n stk = x.
Proof.
  intros x x0 stk n Hstk Hlen Hx.  (* Introduce variables and assumptions *)
  rewrite Hstk.                 (* Rewrite the goal using the equality Hstk *)
  rewrite firstn_app.           (* Use firstn_app lemma *)

  (* Show firstn n x = x *)
  rewrite firstn_all2. 
  - reflexivity.               (* Prove firstn n x = x *)
  
  (* We need to show firstn n x0 = [] *)
  - rewrite <- Hstk in Hlen.   (* Rewrite Hlen using Hstk *)
    rewrite app_length in Hlen. (* Use app_length lemma in Hlen *)
    rewrite Hx in Hlen.         (* Rewrite Hlen with Hx *)

    (* Show n >= length x0 *)
    assert (Hge: n >= length x0).
    { omega. }                  (* omega tactic can help in solving basic arithmetics *)

    (* Use firstn_gt to show firstn n x0 = [] *)
    apply firstn_gt.
    assumption.                 (* Prove firstn n x0 = [] using Hge *)
Qed.
