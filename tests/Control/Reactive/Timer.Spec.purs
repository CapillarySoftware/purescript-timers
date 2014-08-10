module Control.Reactive.Timer.Spec where

import Control.Reactive.Timer
import Control.Monad.ST
import Debug.Trace
import Test.Mocha
import Test.Chai

spec = describe "Timer" $ do

  itAsync "timeout should resolve" $ \done -> do
    timeout 5 $ return $ itIs done

  itAsync "clearTimeout cancels the timer" $ \done -> do
    hasRun <- newSTRef false
    
    t <- timeout 5 $ modifySTRef hasRun \_ -> true    
    clearTimeout t

    timeout 10 $ do
      hasRun' <- readSTRef hasRun
      expect hasRun' `toEqual` false
      return $ itIs done

  itAsync "interval should resolve" $ \done -> do 
    let rate  = 10
    let count = 7
    
    runCount <- newSTRef 0
    t <- interval rate $ modifySTRef runCount \n -> n + 1

    timeout (rate * (count + 1)) $ do
      runCount' <- readSTRef runCount
      expect runCount' `toBeAtLeast` count
      clearInterval t
      return $ itIs done

  itAsync "clearInterval cancels the timer" $ \done -> do 
    hasRun <- newSTRef false

    t <- interval 5 $ modifySTRef hasRun \_ -> true
    clearInterval t

    timeout 10 $ do
      hasRun' <- readSTRef hasRun
      expect hasRun' `toEqual` false
      return $ itIs done



    