# Atlas is micro JavaScript framework which can be scaled to Backbone.js on demand

Useful for mini applications like landing, home pages, CV's etc.

## API

### Atlas.View

#### initialize

``` coffeescript
class SearchView extends Atlas.View

  initialize: (options) ->
```

#### el

``` coffeescript
class SearchView extends Atlas.View

  el: 'body'

  initialize: ->
    @el #=> [<body>...</body>]
```

``` coffeescript
class SearchView extends Atlas.View

  initialize: ->
    @el #=> [<body>...</body>]

new SearchView(el: $('body'))
```

#### $el

``` coffeescript
class SearchView extends Atlas.View

  el: 'body'

  initialize: ->
    @$el #=> $('body')
```

#### $

``` coffeescript
class SearchView extends Atlas.View

  el: 'body'

  initialize: ->
    @$('div') #=> $('div', @$el)
```

#### remove

``` coffeescript
class SearchView extends Atlas.View

  el: '#search'

  initialize: ->
    @remove()
```

#### delegateEvents

``` coffeescript
class SearchView extends Atlas.View

  events:
    submit:         'doSearch'
    'click #clear': 'clearQuery'
```

``` coffeescript
class SearchView extends Atlas.View

  initialize: ->
    @delegateEvents(submit: 'doSearch')
```

#### undelegateEvents

Removes all of the view's delegated events.
