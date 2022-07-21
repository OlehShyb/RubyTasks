class Photo
  attr_accessor :image, :title

  def initialize
  end


  def code
      @image.each_pixel do |pixel, c, r|
        if c == 10 && r == 1
          @image.pixel_color(c,r,'red')
        end
      end
  end

  def decode

  end
end
