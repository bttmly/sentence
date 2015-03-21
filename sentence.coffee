exist = {}
empty = {}
ok = truthy = {}
not_ok = falsy = {}

is_empty = (x) ->
  if Array.isArray(x) 
    x.length is 0 
  else
    Object.keys(x).length is 0

guard = (type) -> (fn) -> (x) ->
  if a(type)(x) then fn(x) else throw new TypeError()
  

bool = (x) -> !!x
is_ok = (x) -> bool x
is_not_ok = (x) -> not x
does_exist = (x) -> x?

expect = (x) -> (y) -> 
  unless typeof y is "function"
    console.log typeof y
    console.log y
    throw new Error "Pass a function"

  unless y(x)
    console.log x, y
    throw new Error "Expectation failed."

than = (x) -> x

eq = equal = (y) -> (x) -> x is y

neq = not_equal = (y) -> (x) -> x isnt y

gt = greater = greater_than = (y) -> (x) -> x > y

lt = less = less_than = (y) -> (x) -> x < y

gte = greater_or_equal = (y) -> (x) -> x >= y

lte = less_or_equal = (y) -> (x) -> x <= y

be = to = (x) ->
  if x is empty then return is_empty
  if x is ok then return is_ok
  if x is not_ok then return is_not_ok
  if x is exist then return does_exist
  if x is to then return x
  x

n0t = nt = nnot = nott = (x) -> 
  if x is empty then return negate is_empty
  if x is ok then return negate is_ok
  if x is not_ok then return negate is_not_ok
  if x is exist then return negate does_exist
  (y) -> !x(y)

negate = (f) -> (x) -> not f x

contain = include = (x) -> (y) -> y.indexOf(x) isnt -1

length = (x) -> (y) -> y.length is x

match = (x) -> (y) -> x.test y

have = (p) ->
  return p if typeof p is "function"
  (x) -> (y) -> y[p] is x

a = an = (x) -> (y) -> Object(y) instanceof x

module.exports = {a, an, have, match, length, contain, include, negate, n0t, nt, nnot, nott, to, be, than, less, less_than, less_or_equal, greater, greater_than, greater_or_equal, expect, equal, not_equal}

Object.defineProperty module.exports, "globals", value: ->
  Object.keys(module.exports).forEach (k) -> global[k] = module.exports[k]


