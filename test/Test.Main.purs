module Test.Main where

import Prelude
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Console (print, CONSOLE())
import Control.Monad.Eff.Exception (throwException, error, EXCEPTION())
import DOM.Timer

main :: forall eff. Eff (console :: CONSOLE, timer :: Timer, err :: EXCEPTION | eff) Unit
main = do
  print 1
  a <- timeout 10 $ do
    print 4
  print 2
  delay 20 print 5
  print 3
  b <- interval 30 $ do
    print 6
  delay 40 clearInterval b
  c <- timeout 0 $ throwException $ do
    error "clearTimeout is not working"
  clearTimeout c
  d <- interval 0 $ throwException $ do
    error "clearInterval is not working"
  clearInterval d
  return unit
