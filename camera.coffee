$ ->
  cam = new Camera()

class Camera
  constructor: () ->
    window.URL = window.URL || window.webkitURL
    navigator.getUserMedia  = navigator.getUserMedia || 
                              navigator.webkitGetUserMedia ||
                              navigator.mozGetUserMedia || 
                              navigator.msGetUserMedia
    
    @ctx = document.getElementById('camera').getContext('2d')
    
    # We can't `new Video()` yet, so we'll resort to the vintage
    # "hidden div" hack for dynamic loading.
    streamContainer = document.createElement('div')
    streamContainer.setAttribute('id', 'video')
    
    @video = document.createElement('video')
    @video.setAttribute('autoplay', '1')
    
    # The video should fill out all of the canvas
    @video.setAttribute('width', @ctx.canvas.width)
    @video.setAttribute('height', @ctx.canvas.height)
    
    @video.setAttribute('style', 'display:none')
    streamContainer.appendChild(@video)
    document.body.appendChild(streamContainer)
    
    navigator.getUserMedia({video: true}, (stream) =>
        @video.src = window.URL.createObjectURL(stream)
        #@update()
        setTimeout(@draw, 1000, this) 
      )
      
    console.log navigator
      
  update: () ->
    setTimeout(@draw, 1000, this) 
    
  draw: (self) ->
    self.ctx.drawImage(self.video, 0, 0, self.ctx.canvas.width, self.ctx.canvas.height)
    document.body.removeChild(document.getElementById('video'))


