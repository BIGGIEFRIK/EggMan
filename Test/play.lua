local Eggman = require 'eggman'

Play = {}

local egg = love.graphics.newImage("egg.png")
local pan = love.graphics.newImage("pan.png")
local chicken = love.graphics.newImage("chicken.png")
local sell = love.graphics.newImage("sell.png")
local arrow = love.graphics.newImage("arrow.png")
local takeall = love.graphics.newImage("take all.png")
local upgrade = love.graphics.newImage("upgrade.png")
local button = love.graphics.newImage("button.png")
local egglimit = 10
local eggslaid = 0
local eggrate = 1
local time = love.timer.getTime() -- laying eggs
local time1 = love.timer.getTime() -- cooking
local time2 = love.timer.getTime() -- also cooking
local time3 = love.timer.getTime() -- taking eggs from pan
local time4 = love.timer.getTime() -- stamina
local col = false
local eggsheld = 0
local panlimit = 10
local eggspan = 0
local eggscooked = 0
local arrowx = 140
local arrowgo = "r"
local eggsdone = 0
local donelimit = 10
local eggscookedheld = 0
local cookrate = 5
local layingPrice = 10
local dialogue = "Welcome to Eggman Incremental! WASD to move."
local tutorial = 0
local tY = 270

function Play:new()
  local play = {}
  setmetatable(play, self)
  self.__index = self
  return play
end

function Play:load()
  man = Eggman:new()
  man:load()
end

function Play:update(dt)
  man:update(dt)
  if col == true then
    eggsheld = eggsheld + eggslaid
    eggslaid = 0
  end
  if col1 == true then
    if love.timer.getTime() - time2 > man.workrate then
      if eggsheld > 0 and panlimit > eggspan then
        eggsheld = eggsheld - 1
        eggspan = eggspan + 1
        time2 = love.timer.getTime()
      end
    end
  end

  if col2 == true then
    if love.timer.getTime() - time3 > man.workrate then
      if eggsdone > 0 then
        eggsdone = eggsdone - 1
        eggscookedheld = eggscookedheld + 1
        time3 = love.timer.getTime()
      end
    end
  end

  if col3 == true then
    man.money = man.money + eggscookedheld
    eggscookedheld = 0
  end

  col = CheckCollision(90,500,30,60, man.px, man.py,50,50) -- chicken
  col1 = CheckCollision(40,35,90,30, man.px, man.py,50,50) -- pan
  col2 = CheckCollision(205,30,40,60, man.px, man.py,50,50) -- take all
  col3 = CheckCollision(660,55,50,50, man.px, man.py,50,50) -- sell
  col4 = CheckCollision(660,500,50,30, man.px,man.py,50,50) -- upgrade

  if love.timer.getTime() - time > eggrate and eggslaid < egglimit then
    eggslaid = eggslaid + 1
    time = love.timer.getTime()
  end

  if love.timer.getTime() - time1 > cookrate then
    if eggspan > 0 and donelimit > eggsdone then
      eggspan = eggspan - 1
      eggsdone = eggsdone + 1
      time1 = love.timer.getTime()
    end
  end

    if love.timer.getTime() - time4 > 1 then -- stamina rate instead of 1?
    if man.stamina < 100 and not love.keyboard.isDown('p') then
      man.stamina = man.stamina + 5
    end
    time4 = love.timer.getTime()
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
  --tutorial
  if tutorial == 0 then
    if love.keyboard.isDown('w') or love.keyboard.isDown('a') or love.keyboard.isDown('s') or love.keyboard.isDown('d') then
      dialogue = "Cool! Also use P to sprint!"
      tutorial = 1
    end
  end

  if tutorial == 1 then
    if love.keyboard.isDown('p') and tutorial == 1 then
      dialogue = "NICE! Now, go to the chicken for eggs!"
      tutorial = 2
    end
    if col == true then
      dialogue = "Ok then don't sprint I guess... Put those eggs in the pan!"
      tutorial = 3
    end
  end

  if tutorial == 2 then
    if col == true then
      dialogue = "WOW! Now you have raw eggs! Put em in the pan!"
      tutorial = 3
    end
  end

  if tutorial == 3 then
    if col1 == true then
      dialogue = "The eggs are cooking! They'll take like... 5 secs per egg."
      tutorial = 4
    end
  end

  if tutorial == 4 then
    if col2 == true then
      dialogue = "NOW SELL THE COOKED EGGS! :DDD"
      tutorial = 5
    end
  end

  if tutorial == 5 then
    if col3 == true then
      dialogue = "PROFIT!! One more thing. You can also upgrade stuff at the bottom right!"
      tutorial = 6
    end
  end

  if tutorial == 6 then
    if col4 == true then
      dialogue = "Ok gtg lol bye"
      tutorial = 7
    end
  end

  if tutorial == 7 then
    tY = tY + 0.5
  end
  --end tutorial

  mouseY = love.mouse.getY()
  mouseX = love.mouse.getX()
  if col4 == true then
    if mouseY > 450 and mouseY < 490 and mouseX > 650 and mouseX < 745 and love.mouse.isDown(1) then
      if man.money > layingPrice - 1 then
        money = money - layingPrice
        eggrate = eggrate - 0.2
      end
    end
  end
end

function Play:draw()
  love.graphics.print(eggslaid.."/"..egglimit, 80, 475)
  love.graphics.print(eggspan.."/"..panlimit,90, 30)
  love.graphics.print(eggsdone.."/"..donelimit,205, 10)
  love.graphics.print("STAMINA: "..man.stamina,0, 140)
  love.graphics.print("MONEY: "..man.money,0,160)
  love.graphics.print("RAW EGGS: "..eggsheld,0, 100)
  love.graphics.print("COOKED EGGS: "..eggscookedheld,0, 120)
  love.graphics.draw(man.img,man.px,man.py)
  love.graphics.draw(sell,650,50)
  love.graphics.draw(pan,75,55)
  love.graphics.draw(arrow,arrowx,50)
  love.graphics.draw(takeall,185,25)
  love.graphics.draw(chicken,75,500)
  love.graphics.draw(upgrade, 650, 500)
  love.graphics.print(dialogue,100,tY)
  love.graphics.print(mouseX..", "..mouseY)

  if col4 == true then
    love.graphics.draw(button, 650, 450)
    love.graphics.print("FASTER LAYING",650,455)
    love.graphics.print("$"..layingPrice,650,475)
  end

end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

return Play
