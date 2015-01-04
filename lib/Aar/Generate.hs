module Aar.Generate (generate) where

import           Aar.Generator
import qualified Aar.Generator.C as C

-- | Takes a given codeinformation and then sends it to the appropriate
--   generator
generate :: CodeGenerator
generate ci = case outputType ci of
                RawAST -> undefined
                C      -> C.generate ci
