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

foreign import data Timer     :: !
foreign import data Timeout   :: *
foreign import data Interval  :: *

type Milliseconds = Number

type EffTimer e a = Eff (timer :: Timer | e) a

foreign import globalEnv
  "var globalEnv = typeof window === 'undefined' ? global : window"
  :: forall a. a

foreign import timeout """
  function timeout(time){
    return function(fn){
      return function(){
        return globalEnv.setTimeout(function(){
          fn();
        }, time);
      };
    };
  }
""" :: forall a e. Milliseconds -> EffTimer e a -> EffTimer e Timeout

foreign import clearTimeout """
  function clearTimeout(timer){
    return function(){
      return globalEnv.clearTimeout(timer);
    };
  }
""" :: forall e. Timeout -> EffTimer e Unit

foreign import interval """
  function interval(time){
    return function(fn){
      return function(){
        return globalEnv.setInterval(function(){
          fn();
        }, time);
      };
    };
  }
""" :: forall a e. Milliseconds -> EffTimer e a -> EffTimer e Interval

foreign import clearInterval """
  function clearInterval(timer){
    return function(){
      return globalEnv.clearInterval(timer);
    };
  }
""" :: forall e. Interval -> EffTimer e Unit
