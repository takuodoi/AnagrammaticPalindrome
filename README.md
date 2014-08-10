# Anagrammatic Palindrome

## Documentation

### isPalindrome :: Eq a => [a] -> BoolSource

check whether given string is a palindrome.

```
>>> isPalindrome "abc"
False
```

```
>>> isPalindrome "abcba"
True
```

### isAnagrammaticPalindrome :: Eq a => [a] -> BoolSource

check whether given word is a anagrammatic palindrome.

```
>>> isAnagrammaticPalindrome "aabc"
False
```

```
>>> isAnagrammaticPalindrome "aabbc"
True
```

### substrings :: String -> [String]Source

generate substrings.

```
>>> substrings "abc"
["a","ab","abc","b","bc","c"]
```

### countAnagrammaticPalindrome :: String -> IntegerSource

count up number of anagrammatic palindrome in substrings in given word.


```
>>> countAnagrammaticPalindrome "abc"
3
```

```
>>> countAnagrammaticPalindrome "aabbc"
12
```
