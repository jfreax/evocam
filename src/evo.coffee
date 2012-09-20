## Canvas
camera = document.getElementById('camera')
canvas = document.getElementById('faces-1')
if !camera.getContext
  alert("This page uses HTML 5 to render correctly. Other browsers may not see anything.")

camera_ctx = camera.getContext('2d')

class Box
  constructor: (@pos, @pos2, @color) ->

  draw: ( ctx ) ->
    ctx.fillStyle = "rgba(#{@color.r}, #{@color.g}, #{@color.b}, #{@color.a})"
    ctx.fillRect(@pos.x, @pos.y, @pos.x-@pos2.x, @pos.y-@pos2.y)



class Individual
  
  constructor: () ->
    @boxes = []
    @count = 1 #Math.random()*100
    
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
  
  clear: () ->
    @ctx.clearRect( 0, 0, @ctx.canvas.width, @ctx.canvas.height )
  
  draw: () ->
    for i in @boxes
      i.draw( @ctx )
      
  fitting: () ->
    dist = 0
    for x in [0..@ctx.canvas.width]
      for y in [0..@ctx.canvas.height]
        src_pixel = @ctx.getImageData(x, y, 1, 1).data
        camera_pixel = camera_ctx.getImageData(x, y, 1, 1).data
        
        #src_color = Color.convert({ r: src_pixel[0], g: src_pixel[1], b: src_pixel[2], a: src_pixel[3]}, 'lab')
        #camera_color = Color.convert({ r: camera_pixel[0], g: camera_pixel[1], b: camera_pixel[2], a: camera_pixel[3]}, 'lab')
        #dist += @distanceLAB( src_pixel, camera_pixel )
               
        dist += @distance( src_pixel, camera_pixel )
    return dist
    
  distance: (p1, p2) ->    
    (p1[0]-p2[0])*(p1[0]-p2[0]) + (p1[1]-p2[1])*(p1[1]-p2[1]) + (p1[2]-p2[2])*(p1[2]-p2[2])
  
  distanceLAB: (p1, p2) ->
    (p1.l-p2.l)*(p1.l-p2.l) + (p1.a-p2.a)*(p1.a-p2.a) + (p1.b-p2.b)*(p1.b-p2.b)



class Population
  face = 0
  best = -1
  individuals: []

  constructor: (@count) ->
    @populate()
  
  populate: () ->
    for num in [1..@count]
      @individuals.push new Individual()
    return

  evolve: () ->
    

  run: () ->
    #while true
    for i in @individuals
      canvas = document.getElementById('faces-'+face)
      i.ctx = canvas.getContext('2d')
      
      i.clear()
      i.draw()
      fitting = i.fitting()
      
      if fitting < best || best == -1
        best = fitting
        console.log fitting

      face += 1
      face %= 5
        
    @evolve()

