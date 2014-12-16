module Aar.Parser.Numeric.Int where

import           Control.Monad
import           Text.Parsec.Prim                   (ParsecT)
import           Text.ParserCombinators.Parsec
import           Text.ParserCombinators.Parsec.Char

data Token = TokInt !SourcePos !Integer
           deriving (Show, Eq)

sourcePos :: Monad m => ParsecT s u m SourcePos
sourcePos = statePos `liftM` getParserState

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
parseDecNum = many1 digit

parseInt :: Parser Token
parseInt = do
  pos    <- sourcePos
  numStr <- try parseOctNum <|>
            try parseHexNum <|>
            parseDecNum
  return $ TokInt pos (read numStr)
