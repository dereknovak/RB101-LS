=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: Hash: flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, 
          "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
-  Output: Array: Barney name, Barney number

---

**Problem Domain:**

- Create an array contating 2 values, Barney's name and Barney's number, 
using the `flintstones` hash
- 
---

**Implicit Requirements:**


---

**Clarifying Questions:**

1.
2.
3.

---

**Mental Model:**

- Initialize the new local variable `barney` that references an array containing
2 elements: the key `:barney` from the hash `flintstones` and the value, integer
2, that it is paired with.

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
Hash: `flintstones`
Array: Barney's name and number
---

Algorithm
---------

-barney = [ flintstons key :barney, :barney value '2']

Code
----

=end

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

barney = [flintstones.key(2), flintstones['Barney']]
p barney

barney2 = flintstones.assoc('Barney')
p barney2