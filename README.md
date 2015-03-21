# sentence [![Build Status](https://travis-ci.org/nickb1080/sentence.svg?branch=master)](https://travis-ci.org/nickb1080/sentence)

Beautiful assertions for CoffeeScript. See the test file for examples.

Looks like this:

```coffeescript
expect(a) to equal b

expect(c) to exist

expect(d) to nt equal e

expect([]) to have length 0
```

This assertion DSL is designed to take advantage of CoffeeScript's largely parenthesis-free syntax. Don't use it with plain JS unless you want assertions that look like this

```js
expect({})(to(nt(be(an(Array)))));
```

In many cases CoffeeScript's terse syntax is especially great for writing unit tests, since there tends to be lots of boilerplate and repeated code, and tons of `it` and `describe` blocks to close. Even for projects written in regular JS, testing with CoffeeScript is excellent. While not as full-featured as libraries like Chai, `sentence` provides a basic set of assertions that will cover most use cases. 

Admittedly, I've focused on keeping the code itself as pretty as possible. A number of features are infeasible with the current approach.

#### `equal`
```
expect(1) to equal 1
```
Assert that two values are equal.

#### `greater`
```
expect(2) to be greater than 1
```
Assert that a value is greater than another value.

#### `less`
```
expect(1) to be less than 2
```
Assert that a value is less than another value

#### `contain`
```
expect("hello there") to contain "hello"
```
Assert that one value contains another value (using `indexOf`). Supports strings and arrays.

#### `have`
```
expect(name: "Nick") to have("name") "Nick"
```
Assert that an object has a property equal to a value.

#### `match`
```
expect("hello there") to match /hello/
```
Assert that a string satisfies a regular expression.

#### `an`
```
expect([]) to be an Array
```
Assert that an object is an instance of a constructor

#### `exist`
```
expect(0) to exist
```
Assert that a value is not `null` or `undefined`


#### `empty`
```
expect({}) to be empty
```

Assert that an object has no own enumerable keys, or if an array that it's length is zero.

#### `ok`
```
expect(1) to be ok
```
Assert that a value is truthy

#### `error`
```
expect(-> throw new Error) to error
```
Assert that a function throws an error when called
