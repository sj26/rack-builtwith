# Rack BuiltWith

Serve a `builtwith.txt` file from your [Ruby on Rails](https://rubyonrails.org) or [Rack](https://rack.github.io) application so you can [remove your site](https://builtwith.com/removals) from [BuiltWith](https://builtwith.com). 🙅‍♀️

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rack-builtwith"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-builtwith

## Usage

If you're using Rails, you can add the middleware in an initializer:

```ruby
# config/initializers/rack-builtwith.rb

Rails.application.middleware.use Rack::BuiltWith
```

or add it to any rack application in your rackup config:

```ruby
# config.ru

use Rack::BuiltWith

run [200, {}, ["Hello, world!"]]
```

By default, the middleware will respond to "/builtwith.txt" on any host with the correct hostname. You can force it to use the same host in the response, regardless of the request host, by specifying an argument to the middleware:

```ruby
use Rack::BuiltWith, "example.com"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in the gemspec, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sj26/rack-builtwith.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
