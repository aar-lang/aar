module Main where

import           Control.Monad    (forM, forM_, liftM)
import           Debug.Trace      (trace)
import           System.Directory (doesDirectoryExist, getDirectoryContents)
import           System.FilePath  (takeExtension, (</>))
import           Test.DocTest

getRecursiveContents :: FilePath -> IO [FilePath]
getRecursiveContents topPath = do
  names <- getDirectoryContents topPath
  let
    properNames =
      filter (`notElem` [".", ".."]) $
      trace ("Processing " ++ topPath) names
  paths <- forM properNames $ \name -> do
    let path = topPath </> name
    isDirectory <- doesDirectoryExist path
    if isDirectory
      then getRecursiveContents path
      else return [path]
  return (concat paths)

isHaskellSource :: FilePath -> Bool
isHaskellSource = (".hs" ==) . takeExtension

main :: IO ()
main = do
  files <- getRecursiveContents "./lib"
  let hsfls = filter isHaskellSource files
  doctest ("-ilib":hsfls)
