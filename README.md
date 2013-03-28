# Atlas.js - micro Backbone.js optimized for size

[![Build Status](https://secure.travis-ci.org/kossnocorp/atlas.png?branch=master)](http://travis-ci.org/kossnocorp/atlas)

Atlas.js useful for mini applications like landings, home pages, CV's and so on.

## What is Atlas.js?

* Is a micro JavaScript library;
* lightweight (0.45kb when compressend and gzipped);
* has limited Backbone.View-compatible API;
* can be easily scaled to Backbone.js on demand.

## Upgrade to Backbone.js

Just replace `Atlas.View` with `Backbone.View` and continue having fun with extended API.

## API

### Atlas.View

#### #initialize()

When you are create new instance of Atlas.View `#initialize()` will be called with passed options. Options also can be accessed later via `@options`. Inside of `#initialize()` you can access `@el` and `@$el`. Events from `#events` also delegates before `#initialize()` call.

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
