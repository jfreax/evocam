class Individual
  camera_ctx = document.getElementById('camera').getContext('2d')
  width = document.getElementById('faces-1').width
  height = document.getElementById('faces-1').height
 
  constructor: () ->
    @boxes = []
    @count = Math.floor(Math.random()*1000)
    
    @create()
    
  create: () ->
    for num in [1..@count]
      @boxes.push new Box(
        {
          x: width*Math.random(), 
          y: height*Math.random()
        },
        { 
          x: width*Math.random(),
          y: height*Math.random()
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
        
        dist += @distance( src_pixel, camera_pixel )
    return dist
  
  evolve: () ->
    @boxes[Math.floor(Math.random()*(@count-1))].pos.x = width*Math.random()
    @boxes[Math.floor(Math.random()*(@count-1))].pos2.x = width*Math.random()
      
    @boxes[Math.floor(Math.random()*(@count-1))].pos.y = height*Math.random()
    @boxes[Math.floor(Math.random()*(@count-1))].pos2.y = height*Math.random()
      
    
  distance: (p1, p2) ->    
    (p1[0]-p2[0])*(p1[0]-p2[0]) + (p1[1]-p2[1])*(p1[1]-p2[1]) + (p1[2]-p2[2])*(p1[2]-p2[2])
  
  distanceLAB: (p1, p2) ->
    (p1.l-p2.l)*(p1.l-p2.l) + (p1.a-p2.a)*(p1.a-p2.a) + (p1.b-p2.b)*(p1.b-p2.b)
