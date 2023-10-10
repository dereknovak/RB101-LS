=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: Hash: `ages`
-  Output: Boolean: `true` or `false`

---

**Problem Domain:**

- Write code to show if `spot` is present in the `ages` hash

---

**Implicit Requirements:**

---

**Clarifying Questions:**

1. Should I be checking both the keys and values, or just keys?
2.
3.

---

**Mental Model:**

Check if hash includes the key `Spot`
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs:
  -  Output:
-  Example 2
  -  Inputs:
  -  Output:

---

_Your Test Cases:_

-  Example 3
  -  Inputs:
  -  Output:

---

_Your Edge Cases:_

-  Example 4
  -  Inputs:
  -  Output:

---

Data Structure
--------------

Hash: `ages`
---

Algorithm
---------

Print (Ages include? 'Spot')
Code
----

=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.include?('Spot')
puts ages.key?('Spot')
puts ages.has_key?('Spot')
puts ages.member?('Spot')

