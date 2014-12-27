module Aar.Generator.C (generate) where

import           Control.Monad.State.Strict
import           System.FilePath

import           Aar.Lexer.Token

type Imports   = [String]
type Functions = [Function]
type Params    = [(Type, Name)]
type Type      = String
type Name      = String
type Code      = Lines
type Lines     = [String]

data Function  = Function Type Name Params Code

data GState = GState Imports Functions

generate :: [Token] -> FilePath -> IO (Either String ())
generate ts path = undefined

generator :: [Token] -> FilePath -> State () (Either String ())
generator ts path = undefined
