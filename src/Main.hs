module Main where
import System.IO
import Control.Exception
import AnagrammaticPalindrome

catchAny :: IO a -> (SomeException -> IO a) -> IO a
catchAny = Control.Exception.catch

main :: IO()
main = do
    num <- getNumber
    list <- createWordList num
    printResult $ map countAnagrammaticPalindrome list

getNumber :: IO Integer
getNumber = do
    putStr "Enter a number of words> "
    hFlush stdout
    num <- catchAny (readLn :: IO Integer) $ \_ -> do
        putStrLn "Invalid input, again."
        newNum <- getNumber
        return newNum
    if num < 0 then do
        putStrLn "Number should be positive, again."
        newNum <- getNumber
        return newNum
    else do
        return num

getWord :: IO String
getWord = do
    putStr "Enter a word> "
    hFlush stdout
    str <- getLine
    return str

createWordList :: Integer -> IO [String]
createWordList 0 = do
    return []
createWordList n = do
    item <- getWord
    if item == "" then do
        newItem <- createWordList n
        return newItem
    else do
        newItem <- createWordList (n - 1)
        return (item : newItem)

printResult :: [Integer] -> IO()
printResult [] = return()
printResult (x:xs) = do
    putStrLn $ show x
    printResult xs
