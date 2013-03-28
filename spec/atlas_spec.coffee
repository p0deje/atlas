jsdom = require('jsdom').jsdom

global.document = jsdom()
global.window   = document.createWindow()

require('../src/atlas.coffee')

chai      = require('chai')
sinon     = require('sinon')
sinonChai = require('sinon-chai')
$         = require('jquery')

chai.should()
chai.use(sinonChai)

Atlas = window.Atlas

describe 'Atlas', ->

  describe '#initialize()', ->

    View          = null
    initializeSpy = null

    beforeEach ->
      View = class extends Atlas.View
        initialize: ->
      initializeSpy = sinon.spy(View::, 'initialize')

    it 'runs on instance create', ->
      new View()
      initializeSpy.should.be.calledOnce

    it 'accept options object', ->
      new View(itWorks: true)
      initializeSpy.should.be.calledWithMatch(sinon.match.has('itWorks', true))

    it 'stores options to @options', ->
      view = new View(itWorks: true)
      view.options.itWorks.should.be.true

  describe '#el', ->

    it 'assigns DOM node from string', ->
      class View extends Atlas.View
        el: 'body'
      view = new View()
      view.el.should.be.eq $('body')[0]

    describe 'assign it from options', ->

      View = null

      beforeEach ->
        View = class extends Atlas.View

      it 'assigns from options', ->
        view = new View(el: $('body')[0])
        view.el.should.be.eq $('body')[0]

      it 'assigns jQuery object from options', ->
        view = new View(el: $('body'))
        view.el.should.be.eq $('body')[0]

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
