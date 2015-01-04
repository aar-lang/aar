module Aar.Generator where

import           Aar.AST

data DbgLevel = None
              | Debug
              | Trace
              deriving (Eq)

data OutputType = RawAST
                | C
                deriving ( Eq
                         , Show
                         )

data CodegenInfo = CodegenInfo { outputFile :: String
                               , outputType :: OutputType
                               , targetCPU  :: String
                               , includes   :: [FilePath]
                               , debugLevel :: DbgLevel
                               , ast        :: AST
                               }

type CodeGenerator = CodegenInfo -> IO ()
