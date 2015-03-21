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