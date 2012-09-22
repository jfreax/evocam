class Individual
  
  constructor: () ->
    @boxes = []
    @count = Math.floor(Math.random()*1000)
    
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
    for x in [0..@ctx.canvas.width] by 10
      for y in [0..@ctx.canvas.height] by 10
        src_pixel = @ctx.getImageData(x, y, 1, 1).data
        camera_pixel = camera_ctx.getImageData(x, y, 1, 1).data
        
        #src_color = Color.convert({ r: src_pixel[0], g: src_pixel[1], b: src_pixel[2], a: src_pixel[3]}, 'lab')
        #camera_color = Color.convert({ r: camera_pixel[0], g: camera_pixel[1], b: camera_pixel[2], a: camera_pixel[3]}, 'lab')
        #dist += @distanceLAB( src_pixel, camera_pixel )
               
        dist += @distance( src_pixel, camera_pixel )
    return dist
  
  evolve: () ->
    @boxes[Math.floor(Math.random()*(@count-1))].pos.x = canvas.width*Math.random()
    @boxes[Math.floor(Math.random()*(@count-1))].pos2.x = canvas.width*Math.random()
      
    @boxes[Math.floor(Math.random()*(@count-1))].pos.y = canvas.height*Math.random()
    @boxes[Math.floor(Math.random()*(@count-1))].pos2.y = canvas.height*Math.random()
      
    
  distance: (p1, p2) ->    
    (p1[0]-p2[0])*(p1[0]-p2[0]) + (p1[1]-p2[1])*(p1[1]-p2[1]) + (p1[2]-p2[2])*(p1[2]-p2[2])
  
  distanceLAB: (p1, p2) ->
    (p1.l-p2.l)*(p1.l-p2.l) + (p1.a-p2.a)*(p1.a-p2.a) + (p1.b-p2.b)*(p1.b-p2.b)
