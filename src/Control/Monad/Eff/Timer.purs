-- | ## Exaple
-- | ```purescript
-- | module Main where
-- |
-- | import Prelude
-- | import Control.Monad.Eff (Eff())
-- | import Control.Monad.Eff.Console (print, CONSOLE())
-- | import Control.Monad.Eff.Timer
-- |
-- | main :: forall eff. Eff (console :: CONSOLE, timer :: TIMER | eff) Unit
-- | main = do
-- |   print 1
-- |   t <- timeout 10 $ do
-- |     print 3
-- |   print 2
-- | ```

module Control.Monad.Eff.Timer where

import Prelude
import Control.Monad.Eff

foreign import data TIMER     :: !
foreign import data Timeout   :: *
foreign import data Interval  :: *

type Milliseconds = Int

foreign import timeout :: forall a eff.
          Milliseconds ->
          Eff (timer :: TIMER | eff) a ->
          Eff (timer :: TIMER | eff) Timeout

foreign import clearTimeout :: forall eff.
          Timeout ->
          Eff (timer :: TIMER | eff) Unit

foreign import interval :: forall a eff.
          Milliseconds ->
          Eff (timer :: TIMER | eff) a ->
          Eff (timer :: TIMER | eff) Interval

foreign import clearInterval :: forall eff.
          Interval ->
          Eff (timer :: TIMER | eff) Unit

-- | ```purescript
-- | delay 1000 log "hi"
-- | ```
delay :: forall a b eff.
          Milliseconds
          -> (a -> Eff (timer :: TIMER | eff) b)
          ->  a -> Eff (timer :: TIMER | eff) Timeout
delay x cb a = timeout x $ cb a
