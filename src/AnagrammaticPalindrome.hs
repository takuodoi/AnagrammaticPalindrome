-- | module for AnagrammaticPalindrome
module AnagrammaticPalindrome where
import Data.List

-- | sort elements by Quicksort algorithm.
--
-- >>> qsort "baBAbA"
-- "AABabb"
qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
        where smaller = [ a | a <- xs, a <= x ]
              larger = [ b | b <- xs, b > x ]

-- | count number of elements that appears odd number of times.
--
-- >>> countOddItem "ababa"
-- 1
countOddItem :: (Ord a) => [a] -> Integer
countOddItem = sum . map oddOrEven . runLength
    where runLength xs = map (\x -> length x) (group $ qsort xs)
          oddOrEven n | odd n     = 1
                      | otherwise = 0

-- | check whether given word is a anagrammatic palindrome.
--
-- >>> isAnagrammaticPalindrome "aabc"
-- False
--
-- >>> isAnagrammaticPalindrome "aabbc"
-- True
isAnagrammaticPalindrome :: (Ord a) => [a] -> Bool
isAnagrammaticPalindrome [] = False
isAnagrammaticPalindrome xs | oddItems == 0 = True
                            | oddItems == 1 = True
                            | otherwise     = False
    where oddItems = countOddItem xs

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
                    | otherwise                          = 0
          count (y:ys) | isAnagrammaticPalindrome y == True = 1 + (count ys)
                       | otherwise                          = 0 + (count ys)
