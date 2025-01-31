=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: String: "The Flintstones Rock!"
-  Output: Strings: "The Flintstones Rock!" printed 10 times, on 3 separate lines
and each string starting 1 space to the right

---

**Problem Domain:**

- Must be a one-line program
- Print 10 times
- Each string must be indented 1 space to right compared to previous

---

**Implicit Requirements:**

- The first string is not indented

---

**Clarifying Questions:**

1. Can we create a multiple line method first, then refactor to one line?
2.
3.

---

**Mental Model:**

- Initialize a local variable referencing the string "The Flintstones Rock"
- Iterate on the string 10 times
- Each iteration prints the string, and recenter it 1 unit to right (2 spaces added)

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

flintstones_string = "The Flintstones Rock!"
10 times ITERATRE
  print flintstones_string center (21(string length) + 2 * iteration))

Code
----

=end

10.times { |i| puts "The Flintstones Rock!".center(21 + (2 * i)) }

10.times { |i| puts (' ' * i) + "The Flintstones Rock!" }