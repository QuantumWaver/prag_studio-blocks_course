class Canvas
  attr_accessor :width, :height, :color

  def initialize
    # default intialization
    @width = 100
    @height = 100
    @color = :black
    # allow for block intialization
    yield self if block_given?
  end

end

canvas = Canvas.new
canvas.width = 200
canvas.height = 300
canvas.color = :green
p canvas

canvas2 = Canvas.new do |c|
  c.width = 500
  c.height = 600
  c.color = :blue
end
p canvas2
