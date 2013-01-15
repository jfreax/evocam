class Camera
  constructor: () ->
    window.URL = window.URL || window.webkitURL
    navigator.getUserMedia  = navigator.getUserMedia || 
                              navigator.webkitGetUserMedia ||
                              navigator.mozGetUserMedia || 
                              navigator.msGetUserMedia
    
    @ctx = document.getElementById('snapshot').getContext('2d')
    @video = document.getElementById('video')
    
    setTimeout( @showPopover, 1000 )
    
    @bind()
    @begin()


  showPopover: () ->
    $('#video').popover('show', {animate: true})
    $('#cam-help').tooltip({'title': 'Don\'t see anything? Click here!'})


  bind: () =>
    $('#video').bind('click', () =>
        @draw(this)
        @end()
        
        $('#main').removeClass('hide-opacity')
        
        setTimeout(start, 1000)
      )
  

  begin: () ->
    navigator.getUserMedia({video: true}, (stream) =>
        @video.src = window.URL.createObjectURL(stream)
      )


  end: () ->
    $('#video').remove()


  draw: (self) ->
    self.ctx.drawImage(self.video, 0, 0, self.ctx.canvas.width, self.ctx.canvas.height)

