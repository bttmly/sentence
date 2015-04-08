do require("../src").globals

describe "sentence", ->

  it "equal", ->
    expect(1) to equal 1
    expect(-> expect(2) to equal 1) to error

  xit "be", ->
    expect(1) to be 1
    expect(-> expect(2) to be 1) to error

  it "eql/deep_equal", ->
    expect([1, 2, 3]) to eql [1, 2, 3]
    expect(-> expect([1, 2, 3]) to eql [2, 3, 4]) to error

  it "not_equal", ->
    expect(1) to not_equal 2
    expect(-> expect(1) to nt equal 1) to error

  it "greater", ->
    expect(2) to be greater than 1
    expect(-> expect(1) to be greater than 2) to error
    expect(greater) to equal gt
    expect(greater) to equal greater_than

  it "less", ->
    expect(1) to be less than 2
    expect(-> expect(2) to be less than 1) to error
    expect(less) to equal lt
    expect(less) to equal less_than

  it "contain/include", ->
    expect("abcde") to include "bcd"
    expect(-> expect("abcde") to include "xyz") to error

    expect([1, 2, 3]) to include 2
    expect(-> expect([1, 2, 3]) to include 4) to error

    expect include to equal contain

  it "length", ->
    o = length: 5
    a = [1, 2, 3, 4, 5]
    expect(a) to have length 5
    expect(o) to have length 5
    expect(-> expect(a) to have length 6) to error
    expect(-> expect(o) to have length 6) to error

  it "match", ->
    expect("hello") to match /ell/
    expect(-> expect("heyo") to match /ell/) to error

  it "have", ->
    o = prop: "val"
    expect(o) to have("prop") "val"
    expect(-> expect(o) to have("prop") "not_val") to error

  it "error", ->
    expect(-> expect(1) to equal 2) to error

  it "ok", ->
    expect(true) to be ok
    expect(-> expect(false) to be ok) to error

  it "exist", ->
    expect(-> expect(null) to exist) to error
    expect(-> expect(undefined) to exist) to error
    expect(1) to exist

  it "empty", ->
    expect([]) to be empty
    expect({}) to be empty
    expect(-> expect([1]) to be empty) to error
    expect(-> expect(a: "b") to be empty) to error

  it "a/an", ->
    expect([]) to be an Array
    expect([]) to be an Object
    expect(->) to be a Function
    expect("") to be a String
    expect(true) to be a Boolean
    expect(20) to be a Number
    expect(/x/) to be a RegExp
    expect(-> expect("") to be an Object) to error
    class Thing and expect(new Thing()) to be a Thing

  it "nt", ->
    describe "nt have", ->
      expect([1]) to nt have length 0
      expect(-> expect([]) to nt have length 0) to error

    describe "nt include", ->
      expect("abc") to nt include "z"
      expect(-> expect("abc") to nt include "a") to error

    describe "nt match", ->
      expect("hello world") to nt match /goodbye/
      expect(-> expect("hello world") to nt match /hello/) to error

    describe "nt a", ->
      expect({}) to nt be an Array
      expect(-> expect([]) to nt be an Array) to error




