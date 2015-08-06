module Control.Timer where

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


delay :: forall a b eff.
          Milliseconds
          -> (a -> Eff (timer :: Timer | eff) b)
          ->  a -> Eff (timer :: Timer | eff) Timeout
delay x cb a = timeout x $ cb a
