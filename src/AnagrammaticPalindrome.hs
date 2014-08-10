-- | module for AnagrammaticPalindrome
module AnagrammaticPalindrome where
import Data.List

-- | check whether given string is a palindrome.
--
-- >>> isPalindrome "abc"
-- False
--
-- >>> isPalindrome "abcba"
-- True
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = False
isPalindrome xs = xs == (reverse xs)

-- | check whether given word is a anagrammatic palindrome.
--
-- >>> isAnagrammaticPalindrome "aabc"
-- False
--
-- >>> isAnagrammaticPalindrome "aabbc"
-- True
isAnagrammaticPalindrome :: (Eq a) => [a] -> Bool
isAnagrammaticPalindrome xs = isContainPalindrome $ permutations xs
    where isContainPalindrome [] = False
          isContainPalindrome [y] = isPalindrome y
          isContainPalindrome (y:ys) = (isPalindrome y) || (isContainPalindrome ys)

-- | generate substrings.
--
-- >>> substrings "abc"
-- ["a","ab","abc","b","bc","c"]
substrings :: String -> [String]
substrings [] = [[]]
substrings [x] = [[x]]
substrings xs = (tail $ inits xs) ++ (substrings $ tail xs)

-- | count up number of anagrammatic palindrome in substrings in given word.
--
-- >>> countAnagrammaticPalindrome "abc"
-- 3
--
-- >>> countAnagrammaticPalindrome "aabbc"
-- 12
countAnagrammaticPalindrome :: String -> Integer
countAnagrammaticPalindrome xs = count $ substrings xs
    where count [] = 0
          count [y] | isAnagrammaticPalindrome y == True = 1
                                           | otherwise   = 0
          count (y:ys) | isAnagrammaticPalindrome y == True = 1 + (count ys)
                                              | otherwise   = 0 + (count ys)
