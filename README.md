# Atlas.js - micro Backbone.js optimized for size

[![Build Status](https://secure.travis-ci.org/kossnocorp/atlas.png?branch=master)](http://travis-ci.org/kossnocorp/atlas)

Atlas.js useful for mini applications like landings, home pages, CV's and so on.

Initially sponsored by [Toptal](http://toptal.com/).

This project is a member of the [OSS Manifesto](http://ossmanifesto.org/).

## What is Atlas.js?

* Is a micro JavaScript library;
* lightweight (0.45kb when compressend and gzipped);
* has limited Backbone.View-compatible API;
* can be easily scaled to Backbone.js on demand;
* has detailed test suite & clean CoffeeScript code;
* avaliable to download as [atlas.js](https://raw.github.com/kossnocorp/atlas/v0.1.0/lib/atlas.js) and [atlas.min.js](https://raw.github.com/kossnocorp/atlas/v0.1.0/lib/atlas.min.js).

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

#### #el

Every view has `el` property. It's a DOM representation of view.

You can specify `el` in prototype (it's actually regular jQuery selector):

``` coffeescript
class SearchView extends Atlas.View

  el: 'body'

  initialize: ->
    @el #=> [<body>...</body>]
```

Or pass `el` as option (you can pass jQuery or DOM object):

``` coffeescript
class SearchView extends Atlas.View

  initialize: ->
    @el #=> [<body>...</body>]

new SearchView(el: $('body'))
```

#### #$el

`$el` it's a jQuery object for `el`.

``` coffeescript
class SearchView extends Atlas.View

  el: 'body'

  initialize: ->
    @$el #=> $('body')
```

#### #$()

Perform scoped (to current `el`) selector.

``` coffeescript
class SearchView extends Atlas.View

  el: 'body'

  initialize: ->
    @$('div') #=> $('div', @$el)
```

#### #remove()

Removes `el` from DOM.

``` coffeescript
class SearchView extends Atlas.View

  el: '#search'

  initialize: ->
    @remove()
```

#### #delegateEvents()

Delegate events specified in format `{ 'event selector': 'callback' }`. You specify only event name (without selector) event will be binded to `el`.

``` coffeescript
class SearchView extends Atlas.View

  events:
    submit:         'doSearch'
    'click #clear': 'clearQuery'
```

You can manually call `#delegateEvents()` and pass events map as argument:

``` coffeescript
class SearchView extends Atlas.View

  initialize: ->
    @delegateEvents(submit: 'doSearch')
```

#### #undelegateEvents()

Removes all of the view's delegated events.

## Roadmap

See [milestones](https://github.com/kossnocorp/atlas/issues/milestones).

## Changelog

This project uses [Semantic Versioning](http://semver.org/) for release numbering.

### v0.1.0, released 28 March 2013

First, initial release.

## Contributors

Idea and code by [@kossnocorp](http://koss.nocorp.me/).

Check out full list of [contributors](https://github.com/kossnocorp/atlas/contributors).

## License

The MIT License

Copyright (c) 2013 Sasha Koss

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
