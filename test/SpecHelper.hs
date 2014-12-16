{-# OPTIONS_GHC -fno-warn-orphans #-}

module SpecHelper ( module X
                  , valueOf
                  ) where

import           Test.Hspec                          as X

import           Text.ParserCombinators.Parsec       as X
import           Text.ParserCombinators.Parsec.Error as X (ParseError,
                                                           errorMessages)

import           Aar.Parser.Numeric.Int

instance Eq ParseError where
    a == b = errorMessages a == errorMessages b

valueOf (Right (TokInt _ v)) = v
