$ ->
  cam = new Camera()
  hsv = Color.convert('#BADBAD', 'lab')

start = () -> 
  pop = new Population(10)
  pop.run()
  