module Control.Reactive.Timer where

import Control.Monad.Eff
import Data.Foreign.EasyFFI

foreign import data Timer     :: !
foreign import data Timeout   :: *
foreign import data Interval  :: *

foreign import timeout
  "function timeout(time) {\
  \  var env = typeof global !== 'undefined' ? global : window;\
  \  return function(fn) {\
  \    return function() {\
  \      return env.setTimeout(fn, time);\
  \    };\
  \  };\
  \}" :: forall a eff.
         Number ->
         (Eff (timer :: Timer | eff) a) ->
         Eff (timer :: Timer | eff) Timeout

foreign import clearTimeout
  "function clearTimeout(timer) {\
  \  var env = typeof global !== 'undefined' ? global : window;\
  \  return function() {\
  \    return env.clearTimeout(timer);\
  \  };\
  \}" :: forall eff.
         Timeout ->
         Eff (timer :: Timer | eff) Unit

foreign import interval
  "function interval(time) {\
  \  var env = typeof global !== 'undefined' ? global : window;\
  \  return function(fn) {\
  \    return function() {\
  \      return env.setInterval(fn, time);\
  \    };\
  \  };\
  \}" :: forall a d eff.
         Number ->
         (Eff (timer :: Timer | eff) a) ->
         Eff (timer :: Timer | eff) Interval

foreign import clearInterval
  "function clearInterval(timer) {\
  \  var env = typeof global !== 'undefined' ? global : window;\
  \  return function() {\
  \    return env.clearInterval(timer);\
  \  };\
  \}" :: forall eff.
         Interval ->
         Eff (timer :: Timer | eff) Unit
