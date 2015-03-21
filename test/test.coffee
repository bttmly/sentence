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

  it "less", ->
    expect(1) to be less than 2
    expect(-> expect(2) to be less than 1) to error

  
