=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: Number: 42
-  Output: Boolean: true

---

**Problem Domain:**

-Write a program that proves that the integer '42' is found between the
integers 10 - 100
-Should lie between, should not include top range.
---

**Implicit Requirements:**

-Return a boolean: 'true'

--- 

**Clarifying Questions:**

1. Do I need to create a method or simply write a string of code?
2. Do we include 10 and 100 in the range?
3.

---

**Mental Model:**
Use a range of integers 10-100 and determine if it includes the integer '42'
print result
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

---

Algorithm
---------

(10 - 100) includes '42'?

Code
----

=end

p (10...100).include?(42)