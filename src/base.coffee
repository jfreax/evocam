$ ->
  cam = new Camera()

start = () -> 
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

## Canvas
camera = document.getElementById('camera')
canvas = document.getElementById('faces-1')
if !camera.getContext
  alert("This page uses HTML 5 to render correctly. Other browsers may not see anything.")

camera_ctx = camera.getContext('2d')
best_ctx = document.getElementById('face').getContext('2d')
best_ctx.globalCompositeOperation = 'copy'

camera_ctx.globalCompositeOperation = 'darker'


pop = new Population(3)
