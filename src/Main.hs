module Main where

import           Control.Monad
import           System.Environment
import           Text.ParserCombinators.Parsec

import           Aar.Parser.Numeric.Int

main :: IO ()
main = do
  source <- liftM head getArgs
  print source
  case parse parseInt "Commandline Argument Testparser" source of
    Left  err -> print err
    Right res -> print res
