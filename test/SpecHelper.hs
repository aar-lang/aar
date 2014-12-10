{-# OPTIONS_GHC -fno-warn-orphans #-}

module SpecHelper ( module X
                  ) where

import           Test.Hspec                          as X

import           Text.ParserCombinators.Parsec       as X
import           Text.ParserCombinators.Parsec.Error as X (ParseError,
                                                           errorMessages)

instance Eq ParseError where
    a == b = errorMessages a == errorMessages b

