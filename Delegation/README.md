In this challenge, the `Delegation contract` was the one being interacted with.

The `DelegateCall function` enables a contract to dynamically load code from a different address at runtime.

The storage still refers to the calling contract, and only the code is taken from the called address.

With this in mind, solving this challenge involved calling the `fallback function` in the the `Delegation contract`, and in its `msg.data`, the function is instructed to call the `pwn function`, chaning the owner to the attacker's EOA.

	 
