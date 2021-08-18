module Main where

import Greeter
import System.Environment.Blank (getArgs)

main = mapM_ (putStrLn . greet) =<< getArgs