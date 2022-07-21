require 'rmagick'
require_relative 'photo'
include Magick

photo = Photo.new
photo.image = ImageList.new("photo2.jpg")
photo.title = 'pineapple'


photo.code
photo.image.write("photo.jpg")

