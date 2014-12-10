module Aar.Parser.Numeric.NatSpec where

import           SpecHelper

import           Aar.Parser.Numeric.Nat

spec :: Spec
spec =
  describe "Natural" $
    context "Valid" $
      parse parseNat "" "1234" `shouldBe` Right 1234
