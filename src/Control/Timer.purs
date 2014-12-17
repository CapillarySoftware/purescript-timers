module Control.Timer
  ( Timer(),
    Timeout(),
    Interval(),
    Milliseconds(),
    EffTimer(),

    timeout,
    clearTimeout,
    interval,
    clearInterval
  ) where

import Control.Monad.Eff
import Data.Foreign.OOFFI(method1EffC, method2EffC)

foreign import data Timer     :: !
foreign import data Timeout   :: *
foreign import data Interval  :: *

type Milliseconds = Number

type EffTimer e a = Eff (timer :: Timer | e) a

timeout       :: forall a e. Milliseconds -> EffTimer e a -> EffTimer e Timeout
timeout       = flip $ method2EffC "setTimeout"

clearTimeout  :: forall e. Timeout -> EffTimer e Unit
clearTimeout  = method1EffC "clearTimeout"

interval      :: forall a e. Milliseconds -> EffTimer e a -> EffTimer e Interval
interval      = flip $ method2EffC "setInterval"

clearInterval :: forall e. Interval -> EffTimer e Unit
clearInterval = method1EffC "clearInterval"
