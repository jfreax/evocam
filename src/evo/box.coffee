# Represents a rectangle.
class Box
  # Each one is defined by its upper left start position *pos* and
  # lower right *pos2*. Apart from that there is the color encoded in RGB.
  constructor: (@pos, @pos2, @color) ->

  # Draws the box on given canvas context (has to be 2d!) *ctx*.
  draw: ( ctx ) ->
    ctx.fillStyle = "rgba(#{@color.r}, #{@color.g}, #{@color.b}, #{@color.a})"
    ctx.fillRect(@pos.x, @pos.y, @pos.x-@pos2.x, @pos.y-@pos2.y)
