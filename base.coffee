## Canvas
canvas = document.getElementById('face')
if !canvas.getContext
  alert("This page uses HTML 5 to render correctly. Other browsers may not see anything.")
ctx = canvas.getContext('2d')

## Static variables
canvasSize = { width: 400, height: 600 }


## Initialization
$ ->
  pop = new Population(500)
  pop.draw()
  
  
class Individual
  constructor: (@pos, @pos2, @color) ->

  draw: () ->
    ctx.fillStyle = "rgba("+@color.r+","+@color.g+","+@color.b+","+@color.a+")"
    ctx.fillRect(@pos.x, @pos.y, @pos.x-@pos2.x, @pos.y-@pos2.y)
  

class Population
  individuals: []
  
  constructor: (@count) ->
    @populate()
    
  populate: () ->
    for num in [1..@count]
      @individuals.push new Individual(
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
  
  draw: () ->
    for i in @individuals
      i.draw()