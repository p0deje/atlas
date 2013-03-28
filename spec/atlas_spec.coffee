Atlas     = require('../src/atlas.coffee')
chai      = require('chai')
sinon     = require('sinon')
sinonChai = require('sinon-chai')

chai.should()
chai.use(sinonChai)

describe 'Atlas', ->

  describe '#initialize()', ->

    it 'runs on instance create'

    it 'accept options object'

  describe '#el', ->

    it 'assigns DOM node from string'

    it 'assigns from options'

    it 'will not assign if options.el is not DOM node'

  describe '#$el', ->

    it 'assigns jQuery object from #el'

  describe '#$()', ->

    it 'performs scoped selector'

  describe '#remove()', ->

    it 'removes el from DOM'

    it 'runs undelegateEvents'

  describe '#delegateEvents()', ->

    it 'delegates events from passed map'

    it 'delegates evenets from #events'

    it 'binds events for rules with only event name'

  describe '#undelegateEvents()', ->

    it 'removes all delegated callbacks'
