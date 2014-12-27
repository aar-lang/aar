module Aar.Generator.C (generate) where

import           Control.Monad.State.Strict
import           System.FilePath

import           Aar.Lexer.Token

generate :: [Token] -> FilePath -> IO (Either String ())
generate ts path = undefined

generator :: [Token] -> FilePath -> State () (Either String ())
generator ts path = undefined
