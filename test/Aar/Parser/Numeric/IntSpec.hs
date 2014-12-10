module Aar.Parser.Numeric.IntSpec where

import SpecHelper

import Aar.Parser.Numeric.Int

spec :: Spec
spec = do
  describe "Integer" $ do
    context "Valid" $ do
      it "parses an decimal int" $ do
        parse parseInt "" "1234" `shouldBe` Right 1234
      it "parses an hexadecimal int" $ do
        parse parseInt "" "0xFF" `shouldBe` Right 255
      it "parses an octal int" $ do
        parse parseInt "" "07" `shouldBe` Right 7
    context "Invalid" $ do
      it "letters only" $ do
        parse parseInt "" "abcde" `shouldSatisfy` either (const True) (const False)
      it "letters after decimal int" $ do
        parse parseInt "" "1234a" `shouldSatisfy` either (const True) (const False)
      it "letters after hexadecimal int" $ do
        parse parseInt "" "0x1234a" `shouldSatisfy` either (const True) (const False)
      it "letters after octal int" $ do
        parse parseInt "" "07a" `shouldSatisfy` either (const True) (const False)

main :: IO ()
main = hspec spec
