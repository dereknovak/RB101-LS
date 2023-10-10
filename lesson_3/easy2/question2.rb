=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: String: "The Musters are creepy in a good way."
-  Output: Strings
           1. "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
           2. "The munsters are creepy in a good way."
           3. "the munsters are creepy in a good way."
           4. "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

---

**Problem Domain:**

- Convert inputted local variable `munster_description` into the provided example
outputs.
- Will always use the original local variable
---

**Implicit Requirements:**

- This will be 4 different lines of code

---

**Clarifying Questions:**

1. Should each operation be created with a method? Or simply a line of code
2. Should these mutate the caller?
3.

---

**Mental Model:**

1. Switch the case of each letter in string
2. Capitalize first letter of entire string
3. Lowercase all letters in string
4. Uppercase all letters in string
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

- Strings
---

Algorithm
---------

1. munster_description switch case
2. munster_description capitalize
3. munster_description downcase
4. munster_description upcase

Code
----

=end

munsters_description = "The Munsters are creepy in a good way."

puts munsters_description.swapcase
puts munsters_description.capitalize
puts munsters_description.downcase
puts munsters_description.upcase