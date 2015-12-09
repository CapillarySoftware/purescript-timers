## Module Control.Monad.Eff.Timer

## Exaple
```purescript
module Main where

import Prelude
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Console (print, CONSOLE())
import Control.Monad.Eff.Timer

main :: forall eff. Eff (console :: CONSOLE, timer :: TIMER | eff) Unit
main = do
  print 1
  t <- timeout 10 $ do
    print 3
  print 2
```

#### `TIMER`

``` purescript
data TIMER :: !
```

#### `Timeout`

``` purescript
data Timeout :: *
```

#### `Interval`

``` purescript
data Interval :: *
```

#### `Milliseconds`

``` purescript
type Milliseconds = Int
```

#### `timeout`

``` purescript
timeout :: forall a eff. Milliseconds -> Eff (timer :: TIMER | eff) a -> Eff (timer :: TIMER | eff) Timeout
```

#### `clearTimeout`

``` purescript
clearTimeout :: forall eff. Timeout -> Eff (timer :: TIMER | eff) Unit
```

#### `interval`

``` purescript
interval :: forall a eff. Milliseconds -> Eff (timer :: TIMER | eff) a -> Eff (timer :: TIMER | eff) Interval
```

#### `clearInterval`

``` purescript
clearInterval :: forall eff. Interval -> Eff (timer :: TIMER | eff) Unit
```

#### `delay`

``` purescript
delay :: forall a b eff. Milliseconds -> (a -> Eff (timer :: TIMER | eff) b) -> a -> Eff (timer :: TIMER | eff) Timeout
```

```purescript
delay 1000 log "hi"
```


