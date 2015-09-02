# HTML::Pipeline::Vimeo

Convert [Vimeo](https://vimeo.com) links into embedded Players.

## Installation

Add this line to your application’s Gemfile:

```ruby
gem 'html-pipeline-vimeo'
```

## Usage

You can add `HTML::Pipeline::VimeoFilter` into your pipeline like this:

```ruby
pipeline = HTML::Pipeline.new [
  HTML::Pipeline::VimeoFilter,
  HTML::Pipeline::MarkdownFilter // or any other filters
]
result = pipeline.call(text)
```

Check class definition for [available context options](https://github.com/dlackty/html-pipeline-vimeo/blob/master/lib/html/pipeline/vimeo/vimeo_filter.rb).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dlackty/html-pipeline-vimeo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

