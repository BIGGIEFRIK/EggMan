local achieve = {}

function achieve:new()
  local a = {
    eggon = love.graphics.newImage("achEggOn.png"),
    massprod = love.graphics.newImage("achMassProd.png"),
    workethic = love.graphics.newImage("achWorkEthic.png"),
    shortcut = love.graphics.newImage("achShortcut.png.png"),
    winded = love.graphics.newImage("achWinded.png"),
    gradea = love.graphics.newImage("achGradeA.png"),
    thousand = love.graphics.newImage("achThousand.png"),
    marathoner = love.graphics.newImage("achMarathoner.png"),
    listopen = love.graphics.newImage("achGot.png"),
    list = love.graphics.newImage("achList.png"),
    million = love.graphics.newImage("achMillion.png"),
    aaa = love.graphics.newImage("achAAA.png"),
    brickionaire = love.graphics.newImage("achBricionaire.png"),
    brickfrick = love.graphics.newImage("achBrick.png"),
    dontcrack = love.graphics.newImage("achDontCrack.png"),
    eggoff = love.graphics.newImage("achEggOff.png")
  }
  setmetatable(a, self)
  self.__index = self
  return a
end

function achieve:load()
  ach1 = 0
  ach2 = 0
  ach3 = 0
  ach4 = 0
  ach5 = 0
  ach6 = 0
  ach7 = 0
  ach8 = 0
  ach9 = 0
  ach10 = 0
  ach11 = 0
  ach12 = 0
  ach13 = 0
  ach14 = 0
  time = love.timer.getTime()
  timer = love.timer.getTime()
  timer1 = love.timer.getTime()
  timer2 = love.timer.getTime()
  timer3 = love.timer.getTime()
  timer4 = love.timer.getTime()
  timer5 = love.timer.getTime()
  timer6 = love.timer.getTime()
  timer7 = love.timer.getTime()
  timer8 = love.timer.getTime()
  timer9 = love.timer.getTime()
  timer10 = love.timer.getTime()
  timer11 = love.timer.getTime()
  timer12 = love.timer.getTime()
  timer13 = love.timer.getTime()
  ach = 0
  open = false
end

function achieve:update(dt)
  ach = ach1+ach2+ach3+ach4+ach5+ach6+ach7+ach8+ach9+ach10+ach11+ach12+ach13+ach14
end

function achieve:draw()

  if mouseY > 300 and mouseY < 332 and mouseX > 750 and mouseX < 782 and love.mouse.isDown(1) and open == false and love.timer.getTime() - time > 0.2 then
    open = true
    time = love.timer.getTime()
  end
  if mouseY > 300 and mouseY < 332 and mouseX > 750 and mouseX < 782 and love.mouse.isDown(1) and open == true and love.timer.getTime() - time > 0.2 then
    open = false
    time = love.timer.getTime()
  end
  if open == true then
    love.graphics.draw(self.list, 250, 150)
    love.graphics.print("ACHIEVEMENTS MET:", 345, 145)
    if ach1 == 1 then
      love.graphics.print("• held 25 cooked eggs",290,160)
    end
    if ach2 == 1 then
      love.graphics.print("• expanded storage",290,175)
    end
    if ach3 == 1 then
      love.graphics.print("• work faster",290,190)
    end
    if ach4 == 1 then
      love.graphics.print("• found a shortcut",290,205)
    end
    if ach5 == 1 then
      love.graphics.print("• got winded",290,220)
    end
    if ach6 == 1 then
      love.graphics.print("• make good eggs",290,235)
    end
    if ach7 == 1 then
      love.graphics.print("• became a thousandaire",290,250)
    end
    if ach8 == 1 then
      love.graphics.print("• got more stamina",290,265)
    end
    if ach9 == 1 then
      love.graphics.print("• became a millionaire",290,280)
    end
    if ach10 == 1 then
      love.graphics.print("• bought 100 bricks",290,295)
    end
    if ach11 == 1 then
      love.graphics.print("• built 10 autobricks",290,310)
    end
    if ach12 == 1 then
      love.graphics.print("• built a silo",290,325)
    end
    if ach13 == 1 then
      love.graphics.print("• built a nuclear egg generator",290,340)
    end
    if ach14 == 1 then
      love.graphics.print("• buy a mob killer",290,355)
    end
  end
  love.graphics.draw(self.listopen, 750, 300)
  love.graphics.print("ACHIEVEMENTS: "..ach.."/14",0,220)
  if man.eggscookedheld >= 25 and ach1 == 0 then
    ach1 = 1
    timer = love.timer.getTime()
  end
  if ach1 == 1 and love.timer.getTime() < timer + 5 then
    love.graphics.draw(self.eggon, 600, 10)
  end

  if BPA >= 25 and BN >= 25 and BPL >= 25 and ach2 == 0 then
    ach2 = 1
    timer1 = love.timer.getTime()
  end
  if ach2 == 1 and love.timer.getTime() < timer1 + 5 then
    love.graphics.draw(self.massprod,600,10)
  end

  if WR >= 45 and ach3 == 0 then
    ach3 = 1
    timer2 = love.timer.getTime()
  end
  if ach3 == 1 and love.timer.getTime() < timer2 + 5 then
    love.graphics.draw(self.workethic,600,10)
  end

  if man.tp >= 1 and ach4 == 0 then
    ach4 = 1
    timer3 = love.timer.getTime()
  end
  if ach4 == 1 and love.timer.getTime() < timer3 + 5 then
    love.graphics.draw(self.shortcut,600,10)
  end

  if ach5 == 0 and man.stamina == 0 then
    ach5 = 1
    timer4 = love.timer.getTime()
  end
  if ach5 == 1 and love.timer.getTime() < timer4 + 5 then
    love.graphics.draw(self.winded, 600, 10)
  end

  if ach6 == 0 and BE >= 25 then
    ach6 = 1
    timer5 = love.timer.getTime()
  end
  if ach6 == 1 and love.timer.getTime() < timer5 + 5 then
    love.graphics.draw(self.gradea, 600, 10)
  end

  if ach7 == 0 and man.money>=1000 then
    ach7 = 1
    timer6 = love.timer.getTime()
  end
  if ach7 == 1 and love.timer.getTime() < timer6 + 5 then
    love.graphics.draw(self.thousand, 600, 10)
  end

  if ach8 == 0 and man.staminamax>=325 then
    ach8 = 1
    timer7 = love.timer.getTime()
  end
  if ach8 == 1 and love.timer.getTime() < timer7 + 5 then
    love.graphics.draw(self.marathoner,600,10)
  end

  if ach9 == 0 and man.money>=1000000 then
    ach9 = 1
    timer8 = love.timer.getTime()
  end
  if ach9 == 1 and love.timer.getTime() < timer8 + 5 then
    love.graphics.draw(self.million,600,10)
  end

  if ach10 == 0 and man.bricks >= 100 then
    ach10 = 1
    timer9 = love.timer.getTime()
  end
  if ach10 == 1 and love.timer.getTime() < timer9 + 5 then
    love.graphics.draw(self.brickionaire, 600, 10)
  end

  if ach11 == 0 and autobricks >= 10 then
    ach11 = 1
    timer10 = love.timer.getTime()
  end
  if ach11 == 1 and love.timer.getTime() < timer10 + 5 then
    love.graphics.draw(self.brickfrick, 600, 10)
  end

  if ach12 == 0 and silobuy == true then
    ach12 = 1
    timer11 = love.timer.getTime()
  end
  if ach12 == 1 and love.timer.getTime() < timer11 + 5 then
    love.graphics.draw(self.dontcrack, 600, 10)
  end

  if ach13 == 0 and nuclearbuy == true then
    ach13 = 1
    timer12 = love.timer.getTime()
  end
  if ach13 == 1 and love.timer.getTime() < timer12 + 5 then
    love.graphics.draw(self.aaa,600,10)
  end

  if ach14 == 0 and evilkiller>1 then
    ach14 = 1
    timer13 = love.timer.getTime()
  end
  if ach14 == 1 and love.timer.getTime() < timer13 + 5 then
    love.graphics.draw(self.eggoff,600,10)
  end

end



return achieve
