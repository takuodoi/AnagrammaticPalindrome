module AnagrammaticPalindrome where

import Data.List

-- |
-- check whether given string is a palindrome
--
-- >>> isPalindrome "abcba"
-- True
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = False
isPalindrome xs = xs == (reverse xs)

-- |
-- check whether given string is a anagrammatic palindrome
--
-- >>> isAnagrammaticPalindrome "aabbc"
-- True
isAnagrammaticPalindrome :: (Eq a) => [a] -> Bool
isAnagrammaticPalindrome xs = isContainPalindrome $ permutations xs
    where isContainPalindrome [] = False
          isContainPalindrome [y] = isPalindrome y
          isContainPalindrome (y:ys) = (isPalindrome y) || (isContainPalindrome ys)

-- |
-- generate substrings.
--
-- >>> substrings "abc"
-- ["a","ab","abc","b","bc","c"]
substrings :: String -> [String]
substrings [] = [[]]
substrings [x] = [[x]]
substrings xs = (tail $ inits xs) ++ (substrings $ tail xs)
