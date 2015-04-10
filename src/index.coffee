_deep_equal = require "deep-equal"
_empty = require "lodash.isempty"

exist = {}
empty = {}
error = {}
ok = truthy = {}

is_empty = (x) -> [_empty(x), "expected #{x} to be empty"]
is_ok = (x) -> [!!x, "expected #{x} to be truthy"]
does_exist = (x) -> [x?, "expected #{x} to exist"]
should_throw = (f) -> [(try do f catch e; e?), "expected function to throw an error"]

expect = (x) -> (y) ->
  unless typeof y is "function"
    throw new Error "Pass a function"
  [okay, label] = y x
  throw new Error(label) unless okay


than = (x) -> x

eq = equal = (y) -> (x) -> [x is y, "expected #{x} to equal #{y}"]

neq = not_equal = (y) -> (x) -> [x isnt y, "expected #{x} to not equal #{y}"]

eql = deep_equal = (a) -> (b) -> _deep_equal a, b, strict: true

gt = greater = greater_than = (y) -> (x) -> [x > y, "expected #{x} to be greater than #{y}"]

lt = less = less_than = (y) -> (x) -> [x < y, "expected #{x} to be less than #{y}"]

gte = greater_or_equal = (y) -> (x) -> [x >= y, "expected #{x} to be greater than or equal to #{y}"]

lte = less_or_equal = (y) -> (x) -> [x <= y, "expected #{x} to be less than or equal to #{y}"]

contain = include = (x) -> (y) -> [y.indexOf(x) isnt -1, "expected #{y} to contain #{x}"]

length = (x) -> (y) -> [y.length is x, "expected #{y} to have `length` #{x}"]

match = (x) -> (y) -> [x.test(y), "expected #{y} to match #{x}"]

negate = (f) -> (x) ->
  [okay, label] = f x
  [not okay, label.replace("expected", "did not expect")]

have = (p) ->
  return p if typeof p is "function"
  (x) -> (y) -> [y[p] is x, "expected property #{p} of #{y} to equal #{x}"]

a = an = (x) -> (y) ->
  if x is Object then return [y instanceof x, "expected #{y} to be an instance of #{x.name}"]
  [Object(y) instanceof x, "expected #{y} to be an instance of #{x.name}"]

be = to = (x) ->
  if x is empty then return is_empty
  if x is ok then return is_ok
  if x is exist then return does_exist
  if x is error then return should_throw
  x

nt = (f) ->
  if f is empty then return negate is_empty
  if f is ok then return negate is_ok
  if f is exist then return negate does_exist
  if f is error then return negate should_throw
  negate f

sentence = module.exports = {exist, empty, ok, error, a, an, have, match, length, contain, include, negate, nt, to, be, than, less, lt, less_than, less_or_equal, lte, greater, gt, greater_than, greater_or_equal, gte, expect, equal, not_equal, deep_equal, eql}

Object.defineProperty sentence, "globals", value: ->
  Object.keys(sentence).forEach (k) -> global[k] = sentence[k]
  sentence
