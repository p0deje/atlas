$ = window.jQuery or require?('jquery')

Atlas = {}

class Atlas.View

  constructor: (@options = {}) ->
    @el = $(@options.el || @el)[0]
    @initialize?(@options)

if window?
  window.Atlas = Atlas
else
  module.exports = Atlas
