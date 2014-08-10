module AnagrammaticPalindromeSpec where

import AnagrammaticPalindrome

import Test.Hspec
--import Test.Hspec.HUnit ()
--import Test.HUnit (assertBool, assertFailure, Assertion)

spec :: Spec
spec = do
    describe "isPalindrome" $ do
        it "isPalindrome abc returns False" $
            isPalindrome "abc" `shouldBe` False
        it "isPalindrome abcba returns True" $
            isPalindrome "abcba" `shouldBe` True
        it "isPalindrome wasitacatisaw returns True" $
            isPalindrome "wasitacatisaw" `shouldBe` True
        it "isPalindrome WasItACatISaw returns False" $
            isPalindrome "WasItACatISaw" `shouldBe` False

    describe "isAnagrammaticPalindrome" $ do
        it "isAnagrammaticPalindrome aaa returns True" $
            isAnagrammaticPalindrome "aaa" `shouldBe` True
        it "isAnagrammaticPalindrome aab returns True" $
            isAnagrammaticPalindrome "aab" `shouldBe` True
        it "isAnagrammaticPalindrome abc returns False" $
            isAnagrammaticPalindrome "abc" `shouldBe` False
