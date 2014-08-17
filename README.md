# Anagrammatic Palindrome

## Documentation

### countOddItem :: Ord a => [a] -> Integer

count number of elements that appears odd number of times.

```
>>> countOddItem "ababa"
1
```

### isAnagrammaticPalindrome :: Ord a => [a] -> Bool

check whether given word is a anagrammatic palindrome.

```
>>> isAnagrammaticPalindrome "aabc"
False
```

```
>>> isAnagrammaticPalindrome "aabbc"
True
```

### substrings :: Ord a => [a] -> [[a]]

generate substrings.

```
>>> substrings "abc"
["a","ab","abc","b","bc","c"]
```

### qsort :: Ord a => [a] -> [a]

sort elements by Quicksort algorithm.

```
>>> qsort "baBAbA"
"AABabb"
```

### countAnagrammaticPalindrome :: String -> Integer

count up number of anagrammatic palindrome in substrings in given word.

```
>>> countAnagrammaticPalindrome "abc"
3
```

```
>>> countAnagrammaticPalindrome "aabbc"
12
```
