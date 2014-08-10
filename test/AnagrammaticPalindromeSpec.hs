module AnagrammaticPalindromeSpec where

import AnagrammaticPalindrome

import Test.Hspec
--import Test.Hspec.HUnit ()
--import Test.HUnit (assertBool, assertFailure, Assertion)

spec :: Spec
spec = do
    describe "isPalindrome" $ do
        it "empty test" $
            isPalindrome "" `shouldBe` False
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

    describe "p.e.p.p.e.r. test" $ do
        it "isAnagrammaticPalindrome p returns True" $
            isAnagrammaticPalindrome "p" `shouldBe` True
        it "isAnagrammaticPalindrome e returns True" $
            isAnagrammaticPalindrome "e" `shouldBe` True
        it "isAnagrammaticPalindrome r returns True" $
            isAnagrammaticPalindrome "r" `shouldBe` True

        it "isAnagrammaticPalindrome pe returns False" $
            isAnagrammaticPalindrome "pe" `shouldBe` False
        it "isAnagrammaticPalindrome ep returns False" $
            isAnagrammaticPalindrome "ep" `shouldBe` False
        it "isAnagrammaticPalindrome pp returns True" $
            isAnagrammaticPalindrome "pp" `shouldBe` True
        it "isAnagrammaticPalindrome er returns False" $
            isAnagrammaticPalindrome "er" `shouldBe` False

        it "isAnagrammaticPalindrome pep returns True" $
            isAnagrammaticPalindrome "pep" `shouldBe` True
        it "isAnagrammaticPalindrome epp returns True" $
            isAnagrammaticPalindrome "epp" `shouldBe` True
        it "isAnagrammaticPalindrome ppe returns True" $
            isAnagrammaticPalindrome "ppe" `shouldBe` True
        it "isAnagrammaticPalindrome per returns False" $
            isAnagrammaticPalindrome "per" `shouldBe` False

        it "isAnagrammaticPalindrome pepp returns False" $
            isAnagrammaticPalindrome "pepp" `shouldBe` False
        it "isAnagrammaticPalindrome eppe returns True" $
            isAnagrammaticPalindrome "eppe" `shouldBe` True
        it "isAnagrammaticPalindrome pper returns False" $
            isAnagrammaticPalindrome "pper" `shouldBe` False

        it "isAnagrammaticPalindrome peppe returns True" $
            isAnagrammaticPalindrome "peppe" `shouldBe` True
        it "isAnagrammaticPalindrome epper returns True" $
            isAnagrammaticPalindrome "epper" `shouldBe` True

        it "isAnagrammaticPalindrome pepper returns False" $
            isAnagrammaticPalindrome "pepper" `shouldBe` False
