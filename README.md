# TaipParser

Parses TAIP formatted data into a readable hash.

## Installation

Add this line to your application's Gemfile:

    gem 'taip_parser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install taip_parser

## Usage

```ruby
TaipParser.parse ">RPV79000+3034433-0950850700000032;ID=1234;*74<"
#=> {type: "R", data: "PV", time_of_day: "79000", latitude: "+30.34433", longitude: "-095.08507", speed: 0, heading: 0, source: 3, age: 2, id: "1234", checksum: "74"}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

Chris Oliver <excid3@gmail.com>