module Aar.AST where

-- | The Abstract Syntax Tree
data AST = Import  !String -- ^ Importing a module
         | FunCall !String ![AST] -- ^ Call the function with its arguments
