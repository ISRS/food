## food Finder   ##


# launch this ruby file from command line to get started

APP_ROOT=File.dirname(__FILE__)
# require
#require file.join(APP_ROOT, 'lib','guide')
#require file.join(APP_ROOT, 'lib','guide')

$:.unshift(File.join(APP_ROOT,'lib'))
require 'guide'
guide =Guide.new("restaurants.txt")
guide.launch!