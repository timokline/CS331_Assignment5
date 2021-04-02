# Assignment5
## Exercise A: Running a Scheme Program
Test to execute Scheme code (not included in repo).

## Exercise B: Haskell Variables & Functions
Write a Haskell module `PA5`, contained in the file `PA5.hs`. Module PA5 should contain the following public functions/variables: `collatzCounts`, `findList`, `##` (infix operator), `filterAB`, `sumEvenOdd`.

* Variable `collatzCounts`. This is a list of `Integer` values. Item __*k*__ (counting from zero) of `collatzCounts` tell how many iterations of the Collatz function are required to take the number __*k*+1__ to __1__. Something you may find useful: The Haskell function `div` does integer division. For example, `div 57 10` returns `5`.

* Function `findList`. This takes two lists of the same type. It returns a `Maybe Int`. It the first list is found as a continguous sublist of the second list, then the return value is `Just n`, where `n` is the earlier index (starting from zero) at which a copy of the first list begins. If the first list is *not* found as a contiguous sublist of the second, then the return value is `Nothing`.

* Infix operator `##`. The two operands are lists of the same type. The return value is an `Int` giving the number of indices at which the two lists contain equal values.

* Function `filterAB`. This takes a boolean function and two lists. It returns a list of all items in the second list for which the corresponding item in the first list makes the boolean function true.

* Function `sumEvenOdd`. This takes a list of numbers. It returns a tuple of two numbers: the sum of the even-index items in the given list, and the sum of the odd-index items in the given list. Indices are zero-based.

__You must implement__ `sumEvenOdd` __using a “fold” function:__ `foldl`, `foldr`, `foldl1`, or `foldr1`, as follows.


## Exercise C: A Complete Haskell Program
Write a Haskell program contained in the file `median.hs`. When executed (that is, when function `main` is called), it should do the following:

* Print and explanatory message.
* Input a sequence of integers from the user, one on each line, ending with a blank line.
* If the list is empty, then print a message indicating this. Otherwise, print a median for the list (see "Median", below).
* Ask the user whether to repeat the program. If so, start over; if not, exit.

Other requirements:

* When the program runs, it should be clear what the program is for, and what the user is expected to do.
* Robust programs (those than can handle any input whatsoever) are nice, but they can be difficult to write. Your program must either be robust, or it must contain, near the beginning of the source code, a prominent comment indicating what input it can handle.
* Your code must run reasonably quickly.

Something you may find useful: In Haskell, you can sort a list with the library function `sort`. This takes a list and returns a sorted list. To make function `sort` available for use, put the following line near the beginning of your code:
```import Data.List```
