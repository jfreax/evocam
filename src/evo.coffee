## Canvas
canvas = document.getElementById('faces-1')
if !canvas.getContext
  alert("This page uses HTML 5 to render correctly. Other browsers may not see anything.")


class Box
  constructor: (@pos, @pos2, @color) ->

  draw: ( ctx ) ->
    ctx.fillStyle = "rgba(#{@color.r}, #{@color.g}, #{@color.b}, #{@color.a})"
    ctx.fillRect(@pos.x, @pos.y, @pos.x-@pos2.x, @pos.y-@pos2.y)



class Individual
  
  constructor: () ->
    @boxes = []
    @count = Math.random()*100
    
    @create()
    
  create: () ->
    for num in [1..@count]
      @boxes.push new Box(
        {
          x: canvas.width*Math.random(), 
          y: canvas.height*Math.random()
        },
        { 
          x: canvas.width*Math.random(),
          y: canvas.height*Math.random()
        },
        { 
          r: Math.floor(Math.random()*255),
          g: Math.floor(Math.random()*255),
          b: Math.floor(Math.random()*255),
          a: Math.random()
        })
    return
  
  draw: ( ctx, canvas, face ) ->
    ctx.clearRect( 0, 0, canvas.width, canvas.height )
    for i in @boxes
      i.draw( ctx )



class Population
  face = 0
  individuals: []

  constructor: (@count) ->
    @populate()
  
  populate: () ->
    for num in [1..@count]
      @individuals.push new Individual()
    return

  draw: () ->
    for i in @individuals
      canvas = document.getElementById('faces-'+face)
      ctx = canvas.getContext('2d')
      i.draw(ctx, canvas, face)

      face += 1
      face %= 5

