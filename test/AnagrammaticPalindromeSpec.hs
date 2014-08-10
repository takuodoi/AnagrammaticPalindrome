module AnagrammaticPalindromeSpec where

import AnagrammaticPalindrome

import Test.Hspec
--import Test.Hspec.HUnit ()
--import Test.HUnit (assertBool, assertFailure, Assertion)

spec :: Spec
spec = do
    describe "isPalindrome" $ do
        it "isPalindrome abcba returns True" $
            isPalindrome "abcba" `shouldBe` True
        it "isPalindrome abc returns False" $
            isPalindrome "abc" `shouldBe` False
