-- | ## Exaple
-- | ```purescript
-- | module Main where
-- |
-- | import Prelude
-- | import Control.Monad.Eff (Eff())
-- | import Control.Monad.Eff.Console (print, CONSOLE())
-- | import Control.Timer
-- |
-- | main :: forall eff. Eff (console :: CONSOLE, timer :: Timer | eff) Unit
-- | main = do
-- |   print 1
-- |   t <- timeout 10 $ do
-- |     print 3
-- |   print 2
-- | ```

module DOM.Timer where

import Prelude
import Control.Monad.Eff

foreign import data Timer     :: !
foreign import data Timeout   :: *
foreign import data Interval  :: *

type Milliseconds = Int

foreign import timeout :: forall a eff.
          Milliseconds ->
          (Eff (timer :: Timer | eff) a) ->
          Eff (timer :: Timer | eff) Timeout

foreign import clearTimeout :: forall eff.
          Timeout ->
          Eff (timer :: Timer | eff) Unit

foreign import interval :: forall a d eff.
          Milliseconds ->
          (Eff (timer :: Timer | eff) a) ->
          Eff (timer :: Timer | eff) Interval

foreign import clearInterval :: forall eff.
          Interval ->
          Eff (timer :: Timer | eff) Unit

-- | ```purescript
-- | delay 1000 log "hi"
-- | ```
delay :: forall a b eff.
          Milliseconds
          -> (a -> Eff (timer :: Timer | eff) b)
          ->  a -> Eff (timer :: Timer | eff) Timeout
delay x cb a = timeout x $ cb a
