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
import Data.Foreign.OOFFI(method1Eff, method2Eff)
import Context(getContext)

foreign import data Timer     :: !
foreign import data Timeout   :: *
foreign import data Interval  :: *

type Milliseconds = Number

type EffTimer e a = Eff (timer :: Timer | e) a

timeout         :: forall a e. Milliseconds -> EffTimer e a -> EffTimer e Timeout
timeout m fn    = getContext >>= \c -> method2Eff "setTimeout" c fn m 

clearTimeout    :: forall e. Timeout -> EffTimer e Unit
clearTimeout t  = getContext >>= \c -> method1Eff "clearTimeout" c t 

interval        :: forall a e. Milliseconds -> EffTimer e a -> EffTimer e Interval
interval m fn   = getContext >>= \c -> method2Eff "setInterval" c fn m  

clearInterval   :: forall e. Interval -> EffTimer e Unit
clearInterval t = getContext >>= \c -> method1Eff "clearInterval" c t 
