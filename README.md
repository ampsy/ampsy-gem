# Ampsy

Ampsy API wrapper.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ampsy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ampsy

## Usage

``` ruby
client = Ampsy::Client.new 'the-access-token'

data = client.flips flipbook_id
puts data.inspect

result = client.create_flipbook brand_id, kind: 'crowdbook',
                                          title: 'Test Crowdbook'#, ...
if result.success?
  puts result.data.inspect
else
  puts result.error_message
end


client.create_card number: '4111 1111 1111 1111',
                   name: 'Test User',
                   expiration_month: 1,
                   expiration_year: 2020,
                   secret_token: 123

# ...
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fliptu/ampsy-gem.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

