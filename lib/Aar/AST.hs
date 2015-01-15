module Aar.AST where

-- | The Abstract Syntax Tree
data AST = Import  !String !(Maybe String) -- ^ Importing the module specified by the first `String`, it is always fully
                                           --   qualified. The `(Maybe String)` does save an optional qualification alias.
         | FunCall !String ![AST] -- ^ Call the function with its arguments
