# RGdal

Wrapper for the C++ish GDal Api

### Terminology Reference:

GDAL  //  Relation Database  
layer == table  
field_def == column  
feature == record  
field == record attribute  

## Examples
    
### Writing
    > file = RGdal::SHP.new('tmp/tmpfolder')
    > file.create_layer('filename')
    > file.feature(lat, long, {attr: 'foo', bar: 'baz'})
    > file.close
    
### Reading
    > file = RGdal::SHP.new('tmp/tmpfolder')
    > file.create_layer('filename')
    > layer = file.current_layer
    > layer.features.first.attributes
    => {attr: 'foo', bar: 'baz'}
    > file.close

## Installation

Add this line to your application's Gemfile:

    gem 'rgdal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rgdal
