## Module Control.Timer

## Exaple
```purescript
module Main where

import Prelude
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Console (print, CONSOLE())
import Control.Timer

main :: forall eff. Eff (console :: CONSOLE, timer :: Timer | eff) Unit
main = do
  print 1
  t <- timeout 10 $ do
    print 3
  print 2
```

#### `Timer`

``` purescript
data Timer :: !
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
timeout :: forall a eff. Milliseconds -> Eff (timer :: Timer | eff) a -> Eff (timer :: Timer | eff) Timeout
```

#### `clearTimeout`

``` purescript
clearTimeout :: forall eff. Timeout -> Eff (timer :: Timer | eff) Unit
```

#### `interval`

``` purescript
interval :: forall a d eff. Milliseconds -> Eff (timer :: Timer | eff) a -> Eff (timer :: Timer | eff) Interval
```

#### `clearInterval`

``` purescript
clearInterval :: forall eff. Interval -> Eff (timer :: Timer | eff) Unit
```

#### `delay`

``` purescript
delay :: forall a b eff. Milliseconds -> (a -> Eff (timer :: Timer | eff) b) -> a -> Eff (timer :: Timer | eff) Timeout
```

```purescript
delay 1000 log "hi"
```


