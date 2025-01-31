=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: String: "Four score and "
-  Output: String: "Four score and seven years ago..."

---

**Problem Domain:**

- Use 2 methods to concatenate 1 string into the front of the other

---

**Implicit Requirements:**

- famous_words must go in front, cannot reverse

---

**Clarifying Questions:**

1. Do I have to preppend the string onto variable 'famous_words'?
2. Should this mutate the caller?
3.

---

**Mental Model:**

Method 1:
PREPEND
- Prepend the local variable `famous_words` with the string 'Four score and '
- Output the results

Method 2:
STRING INTERPOLATION
 - Have the local variable `famous_words` reference a new value, the sum of 
 the string "Four score and " and the local variable `famous_words`.
 - Output the results.



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

prepend famous_words with  'Four score and ' 
print famous_words

famous_words = 'Four score and ' + famous_words
preint famous_words

Code
----

=end

# Methods 1
famous_words = 'seven years ago...'

famous_words.prepend('Four score and ')
puts famous_words

# Method 2
famous_words = "seven years ago..."

famous_words = 'Four score and ' + famous_words
puts famous_words
