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

  DUMMY_HTML = '<div id="div"><div></div></div> <div id="div2"></div>'

  beforeEach ->
    $('body').empty()

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

    it 'assigns jQuery object from #el', ->
      class View extends Atlas.View
        el: 'body'
      view = new View()
      view.$el.should.be.instanceOf $
      view.$el[0].should.be.eq $('body')[0]

  describe '#$()', ->

    it 'performs scoped selector', ->
      $('body').html(DUMMY_HTML)
      class View extends Atlas.View
        el: '#div'
      view = new View()
      view.$('div').length.should.be.eq 1

  describe '#delegateEvents()', ->

    it 'binds events to el for rules with only event name', ->
      clickSpy = sinon.spy()
      $('body').html(DUMMY_HTML)
      class View extends Atlas.View
        el:   '#div'
        click: clickSpy
      view = new View()
      view.delegateEvents(click: 'click')
      $('#div').click()
      clickSpy.should.be.calledOnce

    it 'delegates events from passed map', ->
      viewClickStub = sinon.stub().returns(false)
      divClickStub  = sinon.stub().returns(false)
      $('body').html(DUMMY_HTML)
      class View extends Atlas.View
        el:        '#div'
        viewClick: viewClickStub
        divClick:  divClickStub
      view = new View()
      view.delegateEvents('click div': 'divClick', click: 'viewClick')
      $('#div').click()
      $('#div div').click()
      viewClickStub.should.be.calledOnce
      divClickStub.should.be.calledOnce

    it 'delegates events from #events', ->
      viewClickStub = sinon.stub().returns(false)
      divClickStub  = sinon.stub().returns(false)
      $('body').html(DUMMY_HTML)
      class View extends Atlas.View
        el: '#div'
        events:
          click:       'viewClick'
          'click div': 'divClick'
        viewClick: viewClickStub
        divClick:  divClickStub
      view = new View()
      $('#div').click()
      $('#div div').click()
      viewClickStub.should.be.calledOnce
      divClickStub.should.be.calledOnce

  describe '#undelegateEvents()', ->

    it 'removes all binded callbacks', ->
      clickSpy = sinon.spy()
      $('body').html(DUMMY_HTML)
      class View extends Atlas.View
        el:   '#div'
        click: clickSpy
      view = new View()
      view.delegateEvents(click: 'click')
      view.undelegateEvents()
      $('#div').click()
      clickSpy.should.not.be.called

    it 'removes all delegated callbacks', ->
      clickSpy = sinon.spy()
      $('body').html(DUMMY_HTML)
      class View extends Atlas.View
        el:   '#div'
        click: clickSpy
      view = new View()
      view.delegateEvents(click: 'click')
      view.undelegateEvents()
      $('#div').click()
      clickSpy.should.not.be.called

    it 'keep other callbacks binded', ->
      clickSpy = sinon.spy()
      $('body').html(DUMMY_HTML)
      class View extends Atlas.View
        el:   '#div'
        click: clickSpy
      view = new View()
      view.delegateEvents(click: 'click')
      view.undelegateEvents()
      $('#div').click()
      clickSpy.should.not.be.called

  describe '#remove()', ->

    it 'removes el from DOM', ->
      $('body').html(DUMMY_HTML)
      class View extends Atlas.View
        el: '#div'
      view = new View()
      view.remove()
      $('#div').length.should.be.eq 0

    it 'runs undelegateEvents', ->
