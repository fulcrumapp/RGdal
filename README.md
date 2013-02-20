# RGdal

Ruby wrapper for GDAL/OGR

### Terminology Reference:

| GDAL      | Database  |
| --------- | --------- |
| layer     | table     |
| field_def | column    |
| feature   | record    |
| field     | attribute |

## Examples

### Writing
    > file = RGdal::SHP.new('tmp/tmpfolder')
    > file.create_layer('filename')
    > file.feature(lat, long, {attr: 'foo', bar: 'baz'})
    > file.close

### Reading
    > file = RGdal::SHP.new('tmp/tmpfolder')
    > layer = file.current_layer
    > layer.features.first.attributes
    => {attr: 'foo', bar: 'baz'}
    > file.close

## Installation

Add this line to your application's Gemfile:

    gem 'rgdal', git: 'git@github.com:spatialnetworks/RGdal.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rgdal
