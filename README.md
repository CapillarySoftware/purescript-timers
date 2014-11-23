# Module Documentation

[![Build Status](https://travis-ci.org/CapillarySoftware/purescript-timers.svg?branch=master)](https://travis-ci.org/CapillarySoftware/purescript-timers)
[![Bower version](https://badge.fury.io/bo/purescript-timers.svg)](http://badge.fury.io/bo/purescript-timers)
[![Dependency Status](https://www.versioneye.com/user/projects/54722c968101065aaf000981/badge.svg?style=flat)](https://www.versioneye.com/user/projects/54722c968101065aaf000981)

## Module Control.Reactive.Timer

### Types

    data Interval :: *

    data Timeout :: *

    data Timer :: !


### Values

    clearInterval :: forall eff. Interval -> Eff (timer :: Timer | eff) Unit

    clearTimeout :: forall eff. Timeout -> Eff (timer :: Timer | eff) Unit

    interval :: forall a d eff. Number -> (d -> Eff (timer :: Timer | eff) a) -> Eff (timer :: Timer | eff) Interval

    timeout :: forall a d eff. Number -> (d -> Eff (timer :: Timer | eff) a) -> Eff (timer :: Timer | eff) Timeout



