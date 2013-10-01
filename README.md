# Couchbase::ViewHelpers

After using Couchbase::View in a few projects, I quickly tired of having to reference the API
docs for the specific options needed.  This gem adds some simple methods to make configuring
a View before the query is executed.

## Installation

Add this line to your application's Gemfile:

    gem 'couchbase-view-helpers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install couchbase-view-helpers

## Usage

```
require 'couchbase/model'

class Post < Couchbase::Model
  attribute :title
  attribute :body
  attribute :draft

  view :all, :by_draft_status
end
```

Normal View access:

```
drafts = Post.by_draft_status(key: true)
all    = Post.all(descending: true)
```

With ViewHelpers:

```
drafts = Post.by_draft_status.key(true)
all    = Post.all.desc
```

Supports will_paginate and kaminari style pagination.  Normal View pagination:

```
page  = 3
per   = 20
skip  = (page - 1) * per
limit = per
page  = Post.all(skip: skip, limit: limit)
```

With ViewHelpers:

```
page = Post.all.paginate(page: 3, per_page: 20)
# or
page = Post.all.page(3).per(20)
```

## TODO

1. Full coverage of all options (key ranges, etc.)
2. Integrate pagination and other defaults in the class level view declaration.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
