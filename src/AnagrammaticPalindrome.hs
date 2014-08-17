-- | module for AnagrammaticPalindrome
module AnagrammaticPalindrome where
import Data.List
import Control.Parallel

parallelMap :: (a -> b) -> [a] -> [b]
parallelMap _ [] = []
parallelMap f (x:xs) = fx `par` fxs `pseq` (fx:fxs)
    where fx = f x
          fxs = parallelMap f xs

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
substrings (x:xs) = (tail $ inits (x:xs)) ++ (substrings xs)

-- | sort elements by Quicksort algorithm.
--
-- >>> qsort "baBAbA"
-- "AABabb"
qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = small `par` (large `par` ((qsort small) ++ [x] ++ (qsort large)))
       where
           small = [p | p <- xs, p <= x]
           large = [p | p <- xs, p > x]

-- | count up number of anagrammatic palindrome in substrings in given word.
--
-- >>> countAnagrammaticPalindrome "abc"
-- 3
--
-- >>> countAnagrammaticPalindrome "aabbc"
-- 12
countAnagrammaticPalindrome :: String -> Integer
countAnagrammaticPalindrome xs = sum $ parallelMap (\x -> check x) (substrings xs)
    where check x | isAnagrammaticPalindrome x == True = 1
                  | otherwise                          = 0
