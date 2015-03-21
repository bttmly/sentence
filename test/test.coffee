s = require("../src/sentence").globals()

describe "sentence", ->

  it "equal", ->
    expect(1) to equal 1
    expect(-> expect(2) to equal 1) to error

  xit "be", ->
    expect(1) to be 1
    expect(-> expect(2) to be 1) to error

  it "not_equal", ->
    expect(1) to not_equal 2
    expect(-> expect(1) to_not equal 1) to error

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

  it "not_ok", ->
    expect(false) to be not_ok
    expect(-> expect(true) to be not_ok) to error

  it "exist", ->
    expect(-> expect(null) to exist) to error
    expect(-> expect(undefined) to exist) to error
    expect(1) to exist

  it "empty", ->
    expect([]) to be empty
    expect({}) to be empty
    expect(-> expect([1]) to be empty) to error
    expect(-> expect(a: "b") to be empty) to error

