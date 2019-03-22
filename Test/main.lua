function love.load()
  sprite = love.graphics.newImage("eggman.png-1.png.png")
  sprite1 = love.graphics.newImage("egg.png-1.png.png")
  sprite2 = love.graphics.newImage("pan.png.png")
  sprite3 = love.graphics.newImage("chicken-1.png.png")
  sprite4 = love.graphics.newImage("sell.png.png")
  px = 400
  py = 300
  speed = 1
  stamina = 100
  egglimit = 10
  eggslaid = 0
  eggrate = 1
  time = love.timer.getTime()
  col = false
  eggsheld = 0
  panlimit = 10
  eggspan = 0
  pl = 0
  eggscooked = 0
end

function love.update(dt)
  if col == true then
    eggsheld = eggsheld + eggslaid
    eggslaid = 0
  end

  if col1 == true then
    pl = pl + 1
    if pl == 1 then
      if eggsheld > panlimit - eggspan then
        eggspan = panlimit
        eggsheld = eggsheld - panlimit
      else
        eggspan = eggspan + eggsheld
        eggsheld = 0
      end
    end
  end

  col = CheckCollision(90,500,30,60, px,py,50,50)
  col1 = CheckCollision(40,35,90,30, px,py,50,50)

  if love.timer.getTime() - time > eggrate and eggslaid < egglimit then
    eggslaid = eggslaid + 1
    time = love.timer.getTime()
    if stamina < 100 and not love.keyboard.isDown('p') then
      stamina = stamina + 5
    end
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
  love.graphics.print(eggslaid.."/"..egglimit, 80, 475)
  love.graphics.print(eggspan.."/"..panlimit,90, 30)
  love.graphics.print(px..", "..py..", "..stamina)
  love.graphics.draw(sprite,px,py)
  love.graphics.draw(sprite4,650,300)
  love.graphics.draw(sprite2,75,55)
  love.graphics.draw(sprite3,75,500)
  love.graphics.print(eggsheld..", "..pl, 0, 20)
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
