module AnagrammaticPalindrome where

import Data.List

-- |
-- check whether given string is a palindrome.
--
-- >>> isPalindrome "abcba"
-- True
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = False
isPalindrome xs = xs == (reverse xs)

-- |
-- check whether given word is a anagrammatic palindrome.
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

-- |
-- count up number of anagrammatic palindrome in substrings in given word.
--
-- >>> substrings "abc"
-- ["a","ab","abc","b","bc","c"]
countAnagrammaticPalindrome :: String -> Integer
countAnagrammaticPalindrome xs = countAnagrammaticPalindrome' $ substrings xs
    where countAnagrammaticPalindrome' [] = 0
          countAnagrammaticPalindrome' [y] | isAnagrammaticPalindrome y == True = 1
                                           | otherwise                          = 0
          countAnagrammaticPalindrome' (y:ys) | isAnagrammaticPalindrome y == True = 1 + (countAnagrammaticPalindrome' ys)
                                              | otherwise                          = 0 + (countAnagrammaticPalindrome' ys)

