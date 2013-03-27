Atlas     = require('../src/atlas.coffee')
chai      = require('chai')
sinon     = require('sinon')
sinonChai = require('sinon-chai')

chai.should()
chai.use(sinonChai)

describe 'Atlas', ->

  it 'a object', ->
    Atlas.should.be.defined
