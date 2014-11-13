# Module Documentation

[![Build Status](https://travis-ci.org/CapillarySoftware/purescript-timers.svg?branch=master)](https://travis-ci.org/CapillarySoftware/purescript-timers)
[![Bower version](https://badge.fury.io/bo/purescript-timers.svg)](http://badge.fury.io/bo/purescript-timers)
[![Dependency Status](https://www.versioneye.com/user/projects/54722c968101065aaf000981/badge.svg?style=flat)](https://www.versioneye.com/user/projects/54722c968101065aaf000981)


## Module Control.Timer

### Types

    type EffTimer e a = Eff (timer :: Timer | e) a

    data Interval :: *

    type Milliseconds  = Number

    data Timeout :: *

    data Timer :: !


### Values

    clearInterval :: forall e. Interval -> EffTimer e Unit

    clearTimeout :: forall e. Timeout -> EffTimer e Unit

    interval :: forall a e. Milliseconds -> EffTimer e a -> EffTimer e Interval

    timeout :: forall a e. Milliseconds -> EffTimer e a -> EffTimer e Timeout



