class Box
  constructor: (@pos, @pos2, @color) ->

  draw: ( ctx ) ->
    ctx.fillStyle = "rgba(#{@color.r}, #{@color.g}, #{@color.b}, #{@color.a})"
    ctx.fillRect(@pos.x, @pos.y, @pos.x-@pos2.x, @pos.y-@pos2.y)
