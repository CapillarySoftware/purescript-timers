/* global exports */
"use strict";


// module DOM.Timer

exports.timeout = function(time){
  return function(fn){
    return function(){
      return setTimeout(function(){
        fn();
      }, time);
    };
  };
};

exports.clearTimeout = function(timer){
  return function(){
    return clearTimeout(timer);
  };
};

exports.interval = function(time){
  return function(fn){
    return function(){
      return setInterval(function(){
        fn();
      }, time);
    };
  };
};

exports.clearInterval = function(timer){
  return function(){
    return clearInterval(timer);
  };
};
