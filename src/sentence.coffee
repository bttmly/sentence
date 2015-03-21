exist = {}
empty = {}
ok = truthy = {}
not_ok = falsy = {}
error = {}

is_empty = require "lodash.isempty"
bool = (x) -> !!x
is_ok = (x) -> bool x
is_not_ok = (x) -> not x
does_exist = (x) -> x?
should_throw = (f) -> try do f catch e; e?

expect = (x) -> (y) -> 
  unless typeof y is "function"
    throw new Error "Pass a function"
  unless y x
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
  if x is error then return should_throw
  x

nt = (f) -> 
  if f is empty then return negate is_empty
  if f is ok then return negate is_ok
  if f is not_ok then return negate is_not_ok
  if f is exist then return negate does_exist
  if f is error then return negate should_throw
  negate f

negate = (f) -> (x) -> not f x

contain = include = (x) -> (y) -> y.indexOf(x) isnt -1

length = (x) -> (y) -> y.length is x

match = (x) -> (y) -> x.test y

have = (p) ->
  return p if typeof p is "function"
  (x) -> (y) -> y[p] is x

a = an = (x) -> (y) -> Object(y) instanceof x

sentence = module.exports = {exist, empty, ok, not_ok, error, a, an, have, match, length, contain, include, negate, nt, to, be, than, less, lt, less_than, less_or_equal, lte, greater, gt, greater_than, greater_or_equal, gte, expect, equal, not_equal}

Object.defineProperty sentence, "globals", value: ->
  Object.keys(sentence).forEach (k) -> global[k] = sentence[k]
  sentence


