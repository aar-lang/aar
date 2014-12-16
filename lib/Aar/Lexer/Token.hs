module Aar.Lexer.Token where

import           Text.ParserCombinators.Parsec

data Token = TokInt !SourcePos !Integer
           deriving (Show, Eq)
