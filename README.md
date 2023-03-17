This is an app I used for setting up GPT-4 and playing with it.

For initial setup, you can ask GPT-4 to tell a joke about a bored computer scientist prompting a language model to write proofs:

    export OPENAI_API_KEY=...
    pip install openai==v0.27.0
    python proofjoke.py

(Replace the `...` with your GPT-4 key.)

To use a really quickly written Coq proof bot with zero guarantees to do anything reasonable at all:

    python proof.py

Here are a few short theorem statements that my students wrote in a recent project, and that are simple but at least not obviously in the 2021-and-earlier training data (I'll add more when I find some):

    forall n (e : nat) lst, List.length (e::lst) = S n -> List.length (lst) = n.
    Lemma list_chop_determ : forall x x0 (stk: list nat) n, stk = x ++ x0 -> Datatypes.length stk > n -> Datatypes.length x = n -> firstn n stk = x.

There are GPT-4 generated proof attempts of those theorems in the wonderfully named Foo.v.

You can also try your own theorems. I don't expect it to do well on anything that isn't already in the training data as-is. Just have fun though.

Please feel free to contribute if you add your own fun proof-related GPT-4 things here, or make this nicer or whatever.
