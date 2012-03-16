# RGdal

Wrapper for the C++ish GDal Api

## Examples

    file = RGdal::SHP.new('tmp', 'foobar')
    file.create_layer('filename')
    file.feature(lat, long, {attr: 'foo', bar: 'baz'})
    file.close

## Installation

Add this line to your application's Gemfile:

    gem 'rgdal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rgdal
