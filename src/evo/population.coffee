class Population
  best_ctx = document.getElementById('face').getContext('2d')

  faceID: 0
  best_fitting: -1
  individuals: []

  constructor: (@count) ->
    best_ctx.globalCompositeOperation = 'copy'
    @populate()
  
  populate: () ->
    for num in [1..@count]
      @individuals.push new Individual()
    return

  evolve: (self) ->
    for i in self.individuals
      i.evolve()

  run: (self) ->
    for i in self.individuals
      canvas = document.getElementById('faces-' + self.faceID)
      i.ctx = canvas.getContext('2d')
      
      i.clear()
      i.draw()
      fitting = i.fitting()
      
      if fitting < self.best_fitting || self.best_fitting == -1
        self.best_fitting = fitting
        self.copyBest( canvas )
        console.log fitting

      self.faceID += 1
      self.faceID %= 5
        
    self.evolve( self )
    setTimeout( self.run, 10, self )
  
  copyBest: ( c ) ->
    best_ctx.drawImage(c, 0, 0, best_ctx.canvas.width, best_ctx.canvas.height)
