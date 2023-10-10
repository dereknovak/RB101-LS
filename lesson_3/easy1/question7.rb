=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
-  Output: ["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"]

---

**Problem Domain:**

- Unnest the array referenced by local variable `flintstones`

---

**Implicit Requirements:**

---

**Clarifying Questions:**

1. Should I define a method that prevents nesting in the first place, or simply
unnest the original output?
2. Should this be destructive or non-destructive?
3.

---

**Mental Model:**

- Invoke a method that unnest the array
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

- Array: `flintstones`
---

Algorithm
---------

- unnest flintstones 
- output result
Code
----

=end

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!
p flintstones