module AnagrammaticPalindrome where

import Data.List

-- |
-- check whether given string is a palindrome
--
-- >>> isPalindrome "abcba"
-- True
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == (reverse xs)

-- |
-- check whether given string is a anagrammatic palindrome
--
-- >>> isAnagrammaticPalindrome "abcba"
-- True
isAnagrammaticPalindrome :: (Eq a) => [a] -> Bool
isAnagrammaticPalindrome xs = isContainPalindrome $ permutations xs
    where isContainPalindrome [] = False
          isContainPalindrome [y] = isPalindrome y
          isContainPalindrome (y:ys) = (isPalindrome y) || (isContainPalindrome ys)
