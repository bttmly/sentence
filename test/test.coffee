s = require("../src/sentence").globals()

describe "sentence", ->

  it "equal", ->
    expect(1) to equal 1
    expect(-> expect(2) to equal 1) to error

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
    expect(-> expect("wxyz") to include "bcd") to error
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

