# EventbriteClient

[![Build Status](https://secure.travis-ci.org/kurtisnelson/EventbriteClient.png?branch=master)](http://travis-ci.org/kurtisnelson/EventbriteClient)

A library for querying the EventBrite API.

## Installation

Add this line to your application's Gemfile:

    gem 'EventbriteClient'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install EventbriteClient

## Usage

	eb = EventbriteClient::API.new(:app_key => "YOUR KEY")
        events = eb.event_search({:keywords => ("food", "fun")})

Currently just event search is implemented. All parameters [documented](http://developer.eventbrite.com/doc/events/event_search/) should be supported.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
