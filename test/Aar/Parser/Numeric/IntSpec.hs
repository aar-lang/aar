module Aar.Parser.Numeric.IntSpec where

import           SpecHelper

import           Aar.Parser.Numeric.Int

spec :: Spec
spec =
  describe "Integer" $ do
    context "Valid" $ do
      it "parses an decimal int" $
        valueOf (parse parseInt "" "1234") `shouldBe` 1234
      it "parses an hexadecimal int" $
        valueOf (parse parseInt "" "0xFF") `shouldBe` 255
      it "parses an octal int" $
        valueOf (parse parseInt "" "07") `shouldBe` 7
    context "Invalid" $ do
      it "letters only" $
        parse parseInt "" "abcde" `shouldSatisfy` either (const True) (const False)

main :: IO ()
main = hspec spec
