class Code
  attr_accessor :text, :words_number
  def initialize(text='')
    @text = text
    @words_number = @text.split.size
  end
  def count_words
    # str =
      @text.split.size
  end
  def code

  end
end

code = Code.new("I am Oleh")
puts code.text
puts code.words_number