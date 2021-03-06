'use strict';

namespace = require 'node-namespace'

# Needed so that tests don't implode
namespace 'Cylon', ->
  class @Basestar
    constructor: ->

crazyflie = source("cylon-crazyflie")

describe "basic tests", ->
  it "standard async test", (done) ->
    bool = false
    bool.should.be.false

    setTimeout ->
      bool.should.be.false
      bool = true
      bool.should.be.true
    150

    setTimeout ->
      bool.should.be.true
      done()
    300

  it "standard sync test", ->
    data = []
    obj = id: 5, name: 'test'
    data.should.be.empty
    data.push obj
    data.should.have.length 1
    # soft equal
    data[0].should.be.eql obj
    # hard equal
    data[0].should.be.equal obj

  it "should be able to register", ->
    crazyflie.register.should.be.a 'function'

  it "should be able to create adaptor", ->
    crazyflie.adaptor.should.be.a 'function'
    
  it "should be able to create driver", ->
    crazyflie.driver.should.be.a 'function'
