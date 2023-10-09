=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: "Few things in life are as important as house training your pet
           dinosaur"
-  Output: "Few things in life are as ungent as house training your pet
           dinosaur"

---

**Problem Domain:**

-Replace 'important' with 'urgent' in the specified string
---

**Implicit Requirements:**
- Only needs to use for problem string ("this string")
---

**Clarifying Questions:**

1. 
2.
3.

---

**Mental Model:**

-Split the string into an array with each element being each individual word
-Replace the index for the string 'important' with the string 'urgent'
-Rejoin the array in a string in an initialized variable, 'better_advice'
-Output the new variable

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
-2 Strings, the input/output
-Array
---

Algorithm
---------

split 'advice'
'advice index 6 = 'urgent'
better_advice = join advice with ' '
print better_advice

=end

advice = "Few things in life are as important as house training your pet dinosaur."

better_advice = advice.split
better_advice[6] = 'urgent'
better_advice = better_advice.join(' ')

puts better_advice