module Control.Timer where

import Control.Monad.Eff
import Data.Foreign.EasyFFI

foreign import data Timer     :: !
foreign import data Timeout   :: *
foreign import data Interval  :: *

type Milliseconds = Number

type EffTimer e a = Eff (timer :: Timer | e) a

foreign import timeout """
  function timeout(time){                     
    return function(fn){                     
      return function(){                     
        return window.setTimeout(function(){ 
          fn();                              
        }, time);                            
      };                                     
    };                                       
  }
""" :: forall a e. Milliseconds -> EffTimer e a -> EffTimer e Timeout

foreign import clearTimeout """
  function clearTimeout(timer){
    return function(){
      return window.clearTimeout(timer);
    };
  }
""" :: forall e. Timeout -> EffTimer e Unit

foreign import interval """
  function interval(time){
    return function(fn){
      return function(){
        return window.setInterval(function(){ 
          fn();
        }, time);
      };
    };
  }
""" :: forall a e. Milliseconds -> EffTimer e a -> EffTimer e Interval

foreign import clearInterval """
  function clearInterval(timer){
    return function(){
      return window.clearInterval(timer);
    };
  }
""" :: forall e. Interval -> EffTimer e Unit
