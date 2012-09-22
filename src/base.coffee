$ ->
  cam = new Camera()

start = () -> 
  pop = new Population(3)
  pop.run(pop)
  
  
# shim layer with setTimeout fallback
requestAnimFrame = ( () -> 
         return window.requestAnimationFrame       || 
                window.webkitRequestAnimationFrame || 
                window.mozRequestAnimationFrame    || 
                window.oRequestAnimationFrame      || 
                window.msRequestAnimationFrame     || 
                (callback) -> window.setTimeout(callback, 1000 / 60)
)()
