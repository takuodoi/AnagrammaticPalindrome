-- | module for AnagrammaticPalindrome
module AnagrammaticPalindrome where
import Data.List

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
isAnagrammaticPalindrome xs | oddItems == 0 || oddItems == 1 = True
                            | otherwise                      = False
  where oddItems = countOddItem xs

-- | generate substrings.
--
-- >>> substrings "abc"
-- ["a","ab","abc","b","bc","c"]
substrings :: (Ord a) => [a] -> [[a]]
substrings [] = [[]]
substrings [x] = [[x]]
substrings (x:xs) = initialSegments ++ substrings xs
  where initialSegments = tail $ inits (x:xs)

-- | sort elements by Quicksort algorithm.
--
-- >>> qsort "baBAbA"
-- "AABabb"
qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort small ++ [x] ++ qsort large
  where small = [p | p <- xs, p <= x]
        large = [p | p <- xs, p > x]

-- | count up number of anagrammatic palindrome in substrings in given word.
--
-- >>> countAnagrammaticPalindrome "abc"
-- 3
--
-- >>> countAnagrammaticPalindrome "aabbc"
-- 12
countAnagrammaticPalindrome :: String -> Integer
countAnagrammaticPalindrome xs = sum $ map (\x -> check x) (substrings xs)
  where check x | isAnagrammaticPalindrome x == True = 1
                | otherwise                          = 0
