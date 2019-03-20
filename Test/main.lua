function love.load()
  sprite = love.graphics.newImage("eggman.png-1.png.png")
  sprite1 = love.graphics.newImage("egg.png-1.png.png")
  sprite2 = love.graphics.newImage("pan.png.png")
  sprite3 = love.graphics.newImage("chicken-1.png.png")
  px = 400
  py = 300
  speed = 1
  stamina = 100
  egglimit = 10
  eggs = 0
  eggrate = 1
  time = love.timer.getTime()
end

function love.update(dt)

  if love.timer.getTime() - time > eggrate and eggs < egglimit then
    eggs = eggs + 1
    time = love.timer.getTime()
  end
  if love.keyboard.isDown('w') then
    py = py - speed
  end
  if love.keyboard.isDown('s') then
    py = py + speed
  end
  if love.keyboard.isDown('a') then
    px = px - speed
  end
  if love.keyboard.isDown('d') then
    px = px + speed
  end
  if love.keyboard.isDown('p') and stamina > 0 then
    speed = 2
    stamina = stamina - 1
  else
    speed = 1
  end
  if not love.keyboard.isDown('p') and stamina < 100 then
    stamina = stamina + 0.5
  end

  if px > 795 then
    px = -5
  end
  if px < -5 then
    px = 795
  end

  if py > 590 then
    py = -10
  end
  if py < -10 then
    py = 590
  end

end

function love.draw()
  love.graphics.print(eggs.."/"..egglimit, 80, 475)
  love.graphics.print(px..", "..py..", "..stamina)
  love.graphics.draw(sprite,px,py)
  love.graphics.draw(sprite1,650,300)
  love.graphics.draw(sprite2,75,55)
  love.graphics.draw(sprite3,75,500)
  love.graphics.print(time, 0, 20)
end
