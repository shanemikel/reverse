#!/usr/bin/env nix-shell
#! nix-shell -i runghc -p myHaskellEnv

module Main where

import System.Environment
import Control.Monad
import Control.Monad.ST.Strict
import Data.STRef

main = do
  (n:_) <- getArgs
  let n' = read n :: Integer
  putStrLn $ show n' ++ " -> " ++ show (reverse' n')

infix 0 |$=|
(|$=|) = modifySTRef
infix 0 |:=|
(|:=|) = writeSTRef

reverse' :: (Show a, Integral a) => a -> a
reverse' n = runST $ do
  n <- newSTRef n
  m <- newSTRef 0
  forM_ [i,i-1..0] $ \i -> do
    n' <- readSTRef n
    let (q,r) = n' `divMod` 10
    m |$=| (+ r*10^i)
    n |:=| q
  readSTRef m

  where i = (digits n)-1

digits :: Integral a => a -> a
digits = ceiling . logBase 10 . fromIntegral
