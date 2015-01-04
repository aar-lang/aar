{-|
Module      : Aar.Generator
Description :
Copyright   : (c) Norbert Melzer, 2015
License     : GPL-3
Maintainer  : timmelzer@gmail.com
Stability   : experimental
Portability : POSIX

Some preconfiguration of the codegenerator
-}
module Aar.Generator where

import           Aar.AST

-- | Debuglevel for codegenerator
data DbgLevel = None -- ^ Don't spit out debug information
              | Debug -- ^ Spit out some debug information
              | Trace -- ^ Spit out much debug information
              deriving (Eq)

-- | Type of the output format
data OutputType = RawAST -- ^ Just print out the AST
                | C -- ^ Generate C code
                deriving ( Eq
                         , Show
                         )

-- | Information about how to generate the code
data CodegenInfo = CodegenInfo { outputFile :: FilePath
                                 -- ^ File to generate, there might happen
                                 --   modification on the extension of the file.
                               , outputType :: OutputType
                                 -- ^ Type of generated code
                               , targetCPU  :: String
                                 -- ^ The targeted CPU, needed for some generators
                               , includes   :: [FilePath]
                                 -- ^ List of files/modules which need to get
                                 --   imported. This is the name of Aar-modules!
                               , debugLevel :: DbgLevel
                                 -- ^ Debug level that the generator shall use
                               , ast        :: AST
                                 -- ^ The actual AST that shall get transformed
                                 --   into other code.
                               }

-- | the type for any Codegenerator
type CodeGenerator = CodegenInfo -> IO ()
