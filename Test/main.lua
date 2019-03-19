function love.load()
  sprite = love.graphics.newImage("New Piskel-1.png.png")
  sprite1 = love.graphics.newImage("egg.png.png")
  px = 400
  py = 300
  speed = 1
  stamina = 100
end

function love.update(dt)
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
    stamina = stamina - 0.5
  else
    speed = 1
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
  love.graphics.print(px..", "..py..", "..stamina)
  love.graphics.draw(sprite,px,py)
  love.graphics.draw(sprite1,420,300)
end
