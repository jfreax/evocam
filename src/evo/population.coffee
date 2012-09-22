class Population
  face = 0
  best_fitting = -1
  individuals: []

  constructor: (@count) ->
    @populate()
  
  populate: () ->
    for num in [1..@count]
      @individuals.push new Individual()
    return

  evolve: () ->
    for i in pop.individuals
      i.evolve()

  run: () ->
    #while true
    for i in pop.individuals
      canvas = document.getElementById('faces-'+face)
      i.ctx = canvas.getContext('2d')
      
      i.clear()
      i.draw()
      fitting = i.fitting()
      
      if fitting < best_fitting || best_fitting == -1
        best_fitting = fitting
        pop.copyBest( canvas )
        console.log fitting

      face += 1
      face %= 5
        
    pop.evolve()
    
    setTimeout( pop.run, 10 )
  
  copyBest: ( c ) ->
    best_ctx.drawImage(c, 0, 0, best_ctx.canvas.width, best_ctx.canvas.height)
