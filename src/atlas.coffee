Atlas = {}

class Atlas.View

  constructor: (@options = {}) ->
    @initialize?(@options)

if window?
  window.Atlas = Atlas
else
  module.exports = Atlas
