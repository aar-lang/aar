module Aar.Parser.Numeric.IntSpec where

import           SpecHelper

import           Aar.Parser.Numeric.Int

spec :: Spec
spec =
  describe "Integer" $ do
    context "Valid" $ do
      it "parses an decimal int" $
        parse parseInt "" "1234" `shouldBe` Right 1234
      it "parses an hexadecimal int" $
        parse parseInt "" "0xFF" `shouldBe` Right 255
      it "parses an octal int" $
        parse parseInt "" "07" `shouldBe` Right 7
    context "Invalid" $ do
      it "letters only" $
        parse parseInt "" "abcde" `shouldSatisfy` either (const True) (const False)

main :: IO ()
main = hspec spec
