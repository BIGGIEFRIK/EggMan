local Eggman = require 'eggman'
local Enemy = require 'enemy'

Play = {}

local egg = love.graphics.newImage("egg.png")
local pan = love.graphics.newImage("pan.png")
local chickenpng = love.graphics.newImage("chicken.png")
local sell = love.graphics.newImage("sell.png")
local arrow = love.graphics.newImage("arrow.png")
local takeall = love.graphics.newImage("take all.png")
local upgrade = love.graphics.newImage("upgrade.png")
local button = love.graphics.newImage("button.png")
local evilEggs = love.graphics.newImage("evilEggs.png")
local evileggs = {}
local nuclear = love.graphics.newImage("nuclear thing.png")
local build = love.graphics.newImage("build.png")
local silo = love.graphics.newImage("silo.png")
local silop = love.graphics.newImage("silop.png")
local silom = love.graphics.newImage("silom.png")
local egglimit = 10
local plateSizePrice = 10
local eggslaid = 0
local eggrate = 5
local egglimitPrice = 10
local time = love.timer.getTime() -- laying eggs
local time1 = love.timer.getTime() -- cooking
local time2 = love.timer.getTime() -- also cooking
local time3 = love.timer.getTime() -- taking eggs from pan
local time4 = love.timer.getTime() -- stamina
local time5 = love.timer.getTime() -- button delay
local time6 = love.timer.getTime() -- news
local time7 = love.timer.getTime() -- autobrick delay
local col = false
local eggsheld = 0
local panlimit = 10
local eggspan = 0
local eggscooked = 0
local arrowx = 140
local arrowgo = "r"
local eggsdone = 0
local donelimit = 10
local cookrate = 5
local layingPrice = 10
local dialogue = "Welcome to Eggman Incremental! WASD to move."
local tutorial = 0
local tY = 270
local panheatPrice = 10
local pansizePrice = 10
local workratePrice = 10
local eggvalPrice = 10
local stamMaxPrice = 10
local speedPrice = 1000
local eggvalue = 1
local brickPrice = 100
local autobrickPrice = 100
local autobricks = 0
local silobuy = false
local maxSiloStorage = 0
siloStorage = 0
local siloPrice = 500
local nuclearPrice = 10000
local nuclearbuy = false
nuclearpower = 0
local timeEggs = love.timer.getTime()
evilkiller = 1
chicken = 0
local evkillPrice = 5000
local news1 = {
  "Local farmer ",
  "Random man ",
  "Celebrity chef Gordon Ramsegg ",
  "Some weeb ",
  "An edgy 16 year old athiest ",
  "One of the boys ",
  "Local chemistry teacher"
}
local news2 = {
  "won the hotdog eating contest ",
  "committed arson ",
  "planted eggs expecting eggplants ",
  "now identifies as a war veteran ",
  "made really good pasta ",
  "cracked one too many cold ones ",
  "broke too bad "
}
BPA = 0
BN = 0
BPL = 0
WR = 0
BE = 0

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

  if love.timer.getTime() - time7 > 1 then
    man.bricks = man.bricks + autobricks
    if man.eggschmax > man.eggscookedheld + nuclearpower then
      man.eggscookedheld = man.eggscookedheld + nuclearpower
    elseif maxSiloStorage > siloStorage + nuclearpower then
      siloStorage = siloStorage + nuclearpower
    end
    time7 = love.timer.getTime()
  end

  if col1 == true then
    if love.timer.getTime() - time2 > man.workrate and man.stamina > 0 then
      if eggsheld > 0 and panlimit > eggspan then
        eggsheld = eggsheld - 1
        eggspan = eggspan + 1
        man.stamina = man.stamina - 1
        time2 = love.timer.getTime()
      end
    end
  end

  if col2 == true then
    if love.timer.getTime() - time3 > man.workrate then
      if eggsdone > 0 and man.eggschmax > man.eggscookedheld then
        eggsdone = eggsdone - 1
        man.eggscookedheld = man.eggscookedheld + 1
        time3 = love.timer.getTime()
      end
    end
  end

  if col3 == true then
    man.money = man.money + man.eggscookedheld * eggvalue
    man.eggscookedheld = 0
  end

  col = CheckCollision(90,500,30,60, man.px, man.py,50,50) -- chicken
  col1 = CheckCollision(40,35,90,30, man.px, man.py,50,50) -- pan
  col2 = CheckCollision(205,30,40,60, man.px, man.py,50,50) -- take all
  col3 = CheckCollision(660,55,50,50, man.px, man.py,50,50) -- sell
  col4 = CheckCollision(660,500,50,30, man.px,man.py,50,50) -- upgrade
  col5 = CheckCollision(550,500,50,30, man.px,man.py,50,50) -- build

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
    if man.stamina < man.staminamax and not love.keyboard.isDown('p') then
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
      dialogue = "NICE! Now, go to and click the chicken for eggs! The chicken also makes 1 egg every 5 secs by itself."
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
      dialogue = "The eggs are cooking! They'll take like... 5 secs per egg. But could you... dare I ask... click the pan?"
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
    if mouseY > 450 and mouseY < 490 and mouseX > 650 and mouseX < 745 and love.mouse.isDown(1) and man.money >= layingPrice and love.timer.getTime() - time5 > 0.2 then
      man.money = man.money - layingPrice
      eggrate = eggrate - 0.08
      layingPrice = layingPrice + 2
      time5 = love.timer.getTime()
    end

    if mouseY > 400 and mouseY < 440 and mouseX > 650 and mouseX < 745 and love.mouse.isDown(1) and man.money >= egglimitPrice and love.timer.getTime() - time5 > 0.2 then
      man.money = man.money - egglimitPrice
      egglimit = egglimit + 2
      egglimitPrice = egglimitPrice + 2
      BN = BN + 1
      time5 = love.timer.getTime()
    end

    if mouseY > 350 and mouseY < 390 and mouseX > 650 and mouseX < 745 and love.mouse.isDown(1) and man.money >= panheatPrice and love.timer.getTime() - time5 > 0.2 then
      man.money = man.money - panheatPrice
      cookrate = cookrate - 0.08
      panheatPrice = panheatPrice + 2
      time5 = love.timer.getTime()
    end
    if mouseY > 300 and mouseY < 340 and mouseX > 650 and mouseX < 745 and love.mouse.isDown(1) and man.money >= pansizePrice and love.timer.getTime() - time5 > 0.2 then
      man.money = man.money - pansizePrice
      panlimit = panlimit + 2
      pansizePrice = pansizePrice + 2
      BPA = BPA + 1
      time5 = love.timer.getTime()
    end
    if mouseY > 250 and mouseY < 290 and mouseX > 650 and mouseX < 745 and love.mouse.isDown(1) and man.money >= plateSizePrice and love.timer.getTime() - time5 > 0.2 then
      man.money = man.money - plateSizePrice
      donelimit = donelimit + 2
      plateSizePrice = plateSizePrice + 2
      BPL = BPL + 1
      time5 = love.timer.getTime()
    end

    if mouseY > 200 and mouseY < 240 and mouseX > 650 and mouseX < 745 and love.mouse.isDown(1) and man.money >= workratePrice and love.timer.getTime() - time5 > 0.2 then
      man.money = man.money - workratePrice
      workratePrice = workratePrice + 2
      man.workrate = man.workrate - 0.04
      WR = WR + 1
      time5 = love.timer.getTime()
    end

    if mouseY > 150 and mouseY < 190 and mouseX > 650 and mouseX < 745 and love.mouse.isDown(1) and man.money >= eggvalPrice and love.timer.getTime() - time5 > 0.2 then
      man.money = man.money - eggvalPrice
      eggvalPrice = eggvalPrice + 2
      eggvalue = eggvalue + 1
      BE = BE + 1
      time5 = love.timer.getTime()
    end

    if mouseY > 450 and mouseY < 490 and mouseX > 550 and mouseX < 645 and love.mouse.isDown(1) and man.money >= stamMaxPrice and love.timer.getTime() - time5 > 0.2 then
      man.money = man.money - stamMaxPrice
      man.staminamax = man.staminamax + 5
      stamMaxPrice = stamMaxPrice + 2
      time5 = love.timer.getTime()
    end

    if mouseY > 400 and mouseY < 440 and mouseX > 550 and mouseX < 645 and love.mouse.isDown(1) and man.money >= speedPrice and love.timer.getTime() - time5 > 0.2 then
      man.money = man.money - speedPrice
      man.multspeed = man.multspeed + 0.05
      speedPrice = speedPrice + 10
      time5 = love.timer.getTime()
    end

    if mouseY > 350 and mouseY < 390 and mouseX > 550 and mouseX < 645 and love.mouse.isDown(1) and man.money >= brickPrice and love.timer.getTime() - time5 > 0.2 then
      man.money = man.money - brickPrice
      man.bricks = man.bricks + 1
      brickPrice = brickPrice + 10
      time5 = love.timer.getTime()
    end
  end

  if mouseX >= 75 and mouseX <= 125 and mouseY >= 500 and mouseY <= 580 and love.mouse.isDown(1) and love.timer.getTime() - time5 > 0.2 and eggslaid < egglimit then
    eggslaid = eggslaid + 1
    time5 = love.timer.getTime()
  end

  if mouseX >= 75 and mouseX <= 130 and mouseY >= 50 and mouseY <= 70 and love.mouse.isDown(1) and love.timer.getTime() - time5 > 0.2 then
    if eggspan > 0 and donelimit > eggsdone then
      eggspan = eggspan - 1
      eggsdone = eggsdone + 1
      time5 = love.timer.getTime()
    end
  end

  if col5 == true then
    if mouseY > 450 and mouseY < 490 and mouseX > 550 and mouseX < 645 and love.mouse.isDown(1) and man.bricks >= autobrickPrice and love.timer.getTime() - time5 > 0.2 then
      man.bricks = man.bricks - autobrickPrice
      autobricks = autobricks + 1
      autobrickPrice = autobrickPrice + 50
      time5 = love.timer.getTime()
    end

    if mouseY > 400 and mouseY < 440 and mouseX > 550 and mouseX < 645 and love.mouse.isDown(1) and man.bricks >= siloPrice and love.timer.getTime() - time5 > 0.2 then
      man.bricks = man.bricks - siloPrice
      maxSiloStorage = maxSiloStorage + 100
      silobuy = true
      siloPrice = siloPrice + 50
      time5 = love.timer.getTime()
    end

    if mouseY > 300 and mouseY < 340 and mouseX > 550 and mouseX < 645 and love.mouse.isDown(1) and man.bricks >= evkillPrice and love.timer.getTime() - time5 > 0.2 then
      man.bricks = man.bricks - evkillPrice
      evilkiller = evilkiller + 1
      evkillPrice = evkillPrice + 500
      time5 = love.timer.getTime()
    end

    if mouseY > 350 and mouseY < 390 and mouseX > 550 and mouseX < 645 and love.mouse.isDown(1) and man.bricks >= nuclearPrice and silobuy == true and love.timer.getTime() - time5 > 0.2 then
      man.bricks = man.bricks - nuclearPrice
      nuclearpower = nuclearpower + 1
      if nuclearbuy == false then
        nuclearbuy = true
        timeEggs = love.timer.getTime()
        nuclearPrice = nuclearPrice + 10000
        time5 = love.timer.getTime()
      else
        nuclearPrice = nuclearPrice + 10000
        time5 = love.timer.getTime()
      end

      if mouseY > 450 and mouseY < 490 and mouseX > 450 and mouseX < 545 and love.mouse.isDown(1) and man.money >= 1000000 and love.timer.getTime() - time5 > 0.2 then
        -- man.money = man.money - 1000000
        -- chicken = chicken + 1
        -- eggvalue = 1
        -- eggsheld = 0
        -- eggscookedheld = 0
        -- eggspan = 0
        -- eggslaid = 0
        -- eggsdone = 0
        -- man.bricks = 0
        man.money = "testing"
        time5 = love.timer.getTime()
      end

    end
  end
  if nuclearbuy == true and love.timer.getTime() - timeEggs > (evilkiller/(nuclearpower/2)) then
    table.insert(evileggs, Enemy:new(380, 120))
    timeEggs = love.timer.getTime()
  end

  if silobuy == true then
    if mouseX >= 15 and mouseX <= 45 and mouseY >= 370 and mouseY <= 400 and love.mouse.isDown(1) and love.timer.getTime() - time5 > 0.2 then
      if man.eggscookedheld > 0 and maxSiloStorage > siloStorage then
        man.eggscookedheld = man.eggscookedheld - 1
        siloStorage = siloStorage + 1
        time5 = love.timer.getTime()
      end
    end

    if mouseX >= 45 and mouseX <= 75 and mouseY >= 370 and mouseY <= 400 and love.mouse.isDown(1) and love.timer.getTime() - time5 > 0.2 then
      if siloStorage > 0 and man.eggschmax > man.eggscookedheld then
        man.eggscookedheld = man.eggscookedheld + 1
        siloStorage = siloStorage - 1
        time5 = love.timer.getTime()
      end
    end
  end
  if #evileggs > 0 then
    for i = 1, #evileggs do
      evileggs[i]:update()
    end
    if evileggs[1].exists == false then
      table.remove(evileggs, 1)
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
  love.graphics.print("COOKED EGGS: "..man.eggscookedheld.."/"..man.eggschmax,0, 120)
  love.graphics.print("BRICKS: "..man.bricks,0,180)
  love.graphics.draw(man.img,man.px,man.py)
  love.graphics.draw(sell,650,50)
  love.graphics.draw(pan,75,55)
  love.graphics.draw(arrow,arrowx,50)
  love.graphics.draw(takeall,185,25)
  love.graphics.draw(chickenpng,75,500)
  love.graphics.draw(upgrade, 650, 500)
  love.graphics.print(dialogue,100,tY)
  love.graphics.print(mouseX..", "..mouseY)
  if nuclearpower >= 1 then
    --love.graphics.draw(evilEggs, eex,eey)
    for i = 1, #evileggs do
      evileggs[i]:draw()
    end

  end

  if man.bricks >= 1 then
    love.graphics.draw(build, 550, 500)
  end

  if silobuy == true then
    love.graphics.draw(silo, 10, 270)
    love.graphics.draw(silop, 15, 370)
    love.graphics.draw(silom, 45, 370)
    love.graphics.print(siloStorage.."/"..maxSiloStorage, 50, 430)
  end

  if nuclearbuy == true then
    love.graphics.draw(nuclear, 350, 0)
    love.graphics.print("NUCLEAR POWER: "..nuclearpower, 350, 120)
  end

  -- if love.timer.getTime() - time6 > 5 then
  --   love.graphics.print("NEWS: "..news1[math.random(#news1)], 150, 550)
  --   time6 = love.timer.getTime()
  -- end

  --section[math.random(#section)]
  -- love.graphics.draw(evilEggs, 200, 200)

  if col4 == true then
    love.graphics.draw(button, 650, 450)
    love.graphics.print("FASTER LAYING",650,455)
    love.graphics.print("$"..layingPrice,650,475)

    love.graphics.draw(button, 650, 400)
    love.graphics.print("BIGGER NEST",650,405)
    love.graphics.print("$"..egglimitPrice,650,425)

    love.graphics.draw(button, 650, 350)
    love.graphics.print("HOTTER PAN", 650, 355)
    love.graphics.print("$"..panheatPrice,650,375)

    love.graphics.draw(button, 650, 300)
    love.graphics.print("BIGGER PAN", 650, 305)
    love.graphics.print("$"..pansizePrice,650,325)

    love.graphics.draw(button, 650, 250)
    love.graphics.print("BIGGER PLATE", 650, 255)
    love.graphics.print("$"..plateSizePrice, 650, 275)

    love.graphics.draw(button, 650, 200)
    love.graphics.print("FASTER WORK", 650, 205)
    love.graphics.print("$"..workratePrice, 650, 225)

    love.graphics.draw(button, 650, 150)
    love.graphics.print("BETTER EGGS", 650, 155)
    love.graphics.print("$"..eggvalPrice, 650, 175)

    love.graphics.draw(button, 550, 450)
    love.graphics.print("BIGGER LUNGS", 550, 455)
    love.graphics.print("$"..stamMaxPrice, 550, 475)

    love.graphics.draw(button, 550, 400)
    love.graphics.print("FASTER LEGS", 550, 405)
    love.graphics.print("$"..speedPrice, 550, 425)

    love.graphics.draw(button, 550, 350)
    love.graphics.print("BUY BRICKS", 550, 355)
    love.graphics.print("$"..brickPrice, 550, 375)
  end

  if col5 == true and man.bricks > 0 then
    love.graphics.draw(button, 550, 450)
    love.graphics.print("("..autobricks..") AUTO-BRICK", 550, 455)
    love.graphics.print(autobrickPrice.." bricks", 550, 475)

    love.graphics.draw(button, 550, 400)
    love.graphics.print("SILO STORAGE", 550, 405)
    love.graphics.print(siloPrice.." bricks", 550, 425)

    love.graphics.draw(button, 550, 350)
    love.graphics.print("NUCLEAR EGG GEN", 550, 355)
    love.graphics.print(nuclearPrice.." bricks, silo", 550, 375)

    love.graphics.draw(button, 450, 450)
    love.graphics.print("ASCEND", 450, 455)
    love.graphics.print("$1M", 450, 475)


    if nuclearbuy == true then
      love.graphics.draw(button, 550, 300)
      love.graphics.print("MOB KILLER", 550, 305)
      love.graphics.print(evkillPrice.." bricks", 550, 325)
    end
  end
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

return Play
