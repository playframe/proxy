
![PlayFrame](https://avatars3.githubusercontent.com/u/47147479)
# Proxy

###### Proxy traps for given methods

## Installation
```sh
npm install --save @playframe/proxy
```

## Usage
```js
import proxy from '@playframe/proxy'

const methods = ['walk', 'run', 'fly']

const handler = (method, arg1, arg2)=>
  console.log(`${method}(${arg1}, ${arg2})`)


const Proxy = proxy(methods)
const trap = Proxy handler
trap.run('very', 'fast') // log> run(very, fast)
```

## Annotated Source

Caching `Object.create` for perf and minification

    {create} = Object

Let's define a higher order function takes a list of methods,

    module.exports = (methods)=>

creates a prototype with traps calling a handler function
passing method name and 2 arguments

      proto = create null # not extending Object.prototype
      methods.forEach (method)=>
        proto[method] = (x, y)->
          @_h method, x, y

and returns a factory function,
that creates a proxy for given handle

      (handle)=> create proto, _h: value: handle
