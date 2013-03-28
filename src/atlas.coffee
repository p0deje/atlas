$ = window.jQuery or require?('jquery')

Atlas = {}

class Atlas.View

  @counter: 0

  DELEGATE_SPLITTER = /^(\S+)\s*(.*)$/

  constructor: (@options = {}) ->
    @cid = 'view' + Atlas.View.counter
    Atlas.View.counter += 1

    @el  = $(@options.el || @el)[0]
    @$el = $(@el)

    @delegateEvents(@events) if @events

    @initialize?(@options)

  $: (selector) ->
    $(selector, @el)

  remove: ->
    @$el.remove()

  delegateEvents: (map) ->
    for eventRule, callbackName of map
      [__, jQueryEvent, selector] = eventRule.split(DELEGATE_SPLITTER)

      event = jQueryEvent + '.' + @cid

      if selector == ''
        @$el.bind(event, @[callbackName])
      else
        @$el.delegate(selector, event, @[callbackName])

  undelegateEvents: ->
    @$el
      .undelegate('.' + @cid)
      .unbind('.' + @cid)

if window?
  window.Atlas = Atlas
else
  module.exports = Atlas
