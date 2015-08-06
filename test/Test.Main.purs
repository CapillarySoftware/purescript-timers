module Test.Main where

import Prelude
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Console (print, CONSOLE())
import Control.Monad.Eff.Exception(throwException, error, EXCEPTION())
import Control.Timer

main :: forall a. Eff (console :: CONSOLE, timer :: Timer,  err :: EXCEPTION | a) Unit
main = do
  print 1
  t <- timeout 10 $ do
    print 5
  print 2
  f <- timeout 0 $ do
    throwException $ error "clearTimeout not working"
  clearTimeout f
  delay 20 print 6
  print 3
  g <- interval 20 $ do
    print 7
  delay 30 clearInterval g
  print 4
  return unit
  where
    lst = Nil
