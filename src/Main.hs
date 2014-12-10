{-# LANGUAGE NoMonomorphismRestriction #-}

module Main where

import Control.Monad
import Text.ParserCombinators.Parsec
import Text.ParserCombinators.Parsec.Char
import System.Environment

parseOctNum :: Parser String
parseOctNum = do
  string "0" <|> string "o" <|> string "O"
  octStr <- many1 octDigit
  return ('0':'o':octStr)

parseHexNum :: Parser String
parseHexNum = do
  try (string "0x") <|> string "0X"
  hexStr <- many1 hexDigit
  return ('0':'x':hexStr)

parseDecNum :: Parser String
parseDecNum = do
  decStr <- many1 digit
  return decStr

parseInt :: Parser Integer
parseInt = do
  numStr <- try parseOctNum <|>
            try parseHexNum <|>
            parseDecNum
  return $ read numStr

main :: IO ()
main = do
  source <- liftM head getArgs
  print source
  case parse parseInt "Commandline Argument Testparser" source of
    Left  err -> print err
    Right res -> print res
