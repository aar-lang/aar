{-# OPTIONS_GHC -fno-warn-orphans #-}

module SpecHelper ( module Test.Hspec
                  , module Text.ParserCombinators.Parsec
                  , module Text.ParserCombinators.Parsec.Error
                  ) where

import Test.Hspec

import Text.ParserCombinators.Parsec
import Text.ParserCombinators.Parsec.Error ( ParseError
                                           , Message
                                           , errorMessages
                                           , messageEq
                                           )

instance Eq ParseError where
    a == b = errorMessages a == errorMessages b

