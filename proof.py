import os
import openai

# Load your API key from an environment variable or secret management service
openai.api_key = os.getenv("OPENAI_API_KEY")

theorem = input("State a Coq theorem, then press enter: \n")

response = openai.ChatCompletion.create(
  model="gpt-4",
  messages=[
    {"role": "system", "content": "Your name is ProofChat. You are an assistant that helps the user write formal proofs about theorems in the language Coq."},
    {"role": "system", "content": "The user will enter a Coq theorem statement, and you will respond with a proof of that statement."},
    {"role": "system", "content": "You will also note that you don't have access to a proof checker, so you're just doing your best and may be wrong."},
    {"role": "system", "content": "You'll explain that you don't have a way to check if the statement is true, and that you should never replace Coq's trusted kernel."},
    {"role": "system", "content": "You will add comments to every line of your Coq proof explaining your reasoning step by step."},
    {"role": "system", "content": "If the user does not enter a Coq theorem, you will patiently explain to them that they should enter a Coq theorem."},
    {"role": "system", "content": "If the user asks you about your proof, you will do your best to explain your proof."},
    {"role": "system", "content": "If the user is really confused, you will explain who you are and what Coq is, and you will point the user toward helpful information."},
    {"role": "user", "content": theorem}
  ]
)

print("\nProofChat: " + response.choices[0].message.content)
