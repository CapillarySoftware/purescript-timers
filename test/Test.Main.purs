module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (logShow, CONSOLE)
import Control.Monad.Eff.Exception (throwException, error, EXCEPTION)
import Control.Monad.Eff.Timer (TIMER, clearInterval, clearTimeout, delay, interval, timeout)

main :: forall eff. Eff (console :: CONSOLE, timer :: TIMER, exception :: EXCEPTION | eff) Unit
main = do
  logShow 1
  a <- timeout 10 $ do
    logShow 4
  logShow 2
  _ <- delay 20 logShow 5
  logShow 3
  b <- interval 30 $ do
    logShow 6
  _ <- delay 40 clearInterval b
  c <- timeout 0 $ throwException $ do
    error "clearTimeout is not working"
  clearTimeout c
  d <- interval 0 $ throwException $ do
    error "clearInterval is not working"
  clearInterval d
  pure unit
