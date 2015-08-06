## Module Control.Timer

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


