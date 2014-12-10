module MainSpec where

import Test.Hspec

import Text.ParserCombinators.Parsec
import Text.ParserCombinators.Parsec.Error ( ParseError
                                           , Message
                                           , errorMessages
                                           , messageEq
                                           )

import Main hiding (main)

instance Eq ParseError where
  a == b = errorMessages a == errorMessages b



spec :: Spec
spec = do
  describe "Main" $ do
    context "foo" $ do
      it "parses an decimal int" $ do
        parse parseInt "" "1234" `shouldBe` Right 1234
      it "parses an hexadecimal int" $ do
        parse parseInt "" "0xFF" `shouldBe` Right 255
      it "parses an octal int" $ do
        parse parseInt "" "07" `shouldBe` Right 7

main :: IO ()
main = hspec spec
