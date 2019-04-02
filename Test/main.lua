function love.load()
  sprite = love.graphics.newImage("eggman.png-1.png.png")
  sprite1 = love.graphics.newImage("egg.png-1.png.png")
  sprite2 = love.graphics.newImage("pan.png.png")
  sprite3 = love.graphics.newImage("chicken-1.png.png")
  sprite4 = love.graphics.newImage("sell.png.png")
  arrow = love.graphics.newImage("arrowpic-1.png.png")
  takeall = love.graphics.newImage("take all-1.png.png")
  px = 400
  py = 300
  speed = 1
  stamina = 100
  egglimit = 10
  eggslaid = 0
  eggrate = 1
  time = love.timer.getTime()
  time1 = love.timer.getTime()
  time2 = love.timer.getTime()
  time3 = love.timer.getTime()
  col = false
  eggsheld = 0
  panlimit = 10
  eggspan = 0
  pl = 0
  eggscooked = 0
  arrowgo = "r"
  arrowx = 140
  eggsdone = 0
  donelimit = 10
  eggscookedheld = 0
end

function love.update(dt)
  if col == true then
    eggsheld = eggsheld + eggslaid
    eggslaid = 0
  end

  if col1 == true then
    if love.timer.getTime() - time2 > eggrate then -- TURN TO WORK RATE
      if eggsheld > 0 and panlimit > eggspan then
        eggsheld = eggsheld - 1
        eggspan = eggspan + 1
        time2 = love.timer.getTime()
      end
    end
  end

  if col2 == true then
    if love.timer.getTime() - time3 > eggrate then -- TURN TO WORK RATE
      if eggsdone > 0 then
        eggsdone = eggsdone - 1
        eggscookedheld = eggscookedheld + 1
        time3 = love.timer.getTime()
      end
    end
  end

  col = CheckCollision(90,500,30,60, px,py,50,50)
  col1 = CheckCollision(40,35,90,30, px,py,50,50)
  col2 = CheckCollision(205,30,40,60, px,py,50,50)

  if love.timer.getTime() - time > eggrate and eggslaid < egglimit then
    eggslaid = eggslaid + 1
    time = love.timer.getTime()
    if stamina < 100 and not love.keyboard.isDown('p') then
      stamina = stamina + 5
    end
  end
  if love.timer.getTime() - time1 > eggrate then -- TURN EGGRATE INTO COOK RATE SOON
    if eggspan > 0 and donelimit > eggsdone then
      eggspan = eggspan - 1
      eggsdone = eggsdone + 1
      time1 = love.timer.getTime()
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

  if arrowx == 140 then
    arrowgo = "r"
  elseif arrowx == 150 then
    arrowgo = "l"
  end

  if arrowgo == "r" then
    arrowx = arrowx + 0.5
  elseif arrowgo == "l" then
    arrowx = arrowx - 0.5
  end
end

function love.draw()
  love.graphics.print(eggslaid.."/"..egglimit, 80, 475)
  love.graphics.print(eggspan.."/"..panlimit,90, 30)
  love.graphics.print(eggsdone.."/"..donelimit,205, 10)
  love.graphics.print(px..", "..py..", "..stamina)
  love.graphics.draw(sprite,px,py)
  love.graphics.draw(sprite4,650,50)
  love.graphics.draw(sprite2,75,55)
  love.graphics.draw(arrow,arrowx,50)
  love.graphics.draw(takeall,185,25)
  love.graphics.draw(sprite3,75,500)
  love.graphics.print(eggsheld,0, 20)
  love.graphics.print(eggscookedheld,0, 40)
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
