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
    marathoner = love.graphics.newImage("achMarathoner.png")
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
  timer = love.timer.getTime()
  timer1 = love.timer.getTime()
  timer2 = love.timer.getTime()
  timer3 = love.timer.getTime()
  timer4 = love.timer.getTime()
  timer5 = love.timer.getTime()
  timer6 = love.timer.getTime()
  timer7 = love.timer.getTime()
  ach = 0
end

function achieve:update(dt)
  ach = ach1+ach2+ach3+ach4+ach5+ach6+ach7+ach8
end

function achieve:draw()
  love.graphics.print("ACHIEVEMENTS: "..ach.."/8",0,180)
  if man.eggscookedheld >= 25 and ach1 == 0 then
    ach1 = 1
    timer = love.timer.getTime()
  end
  if ach1 == 1 and love.timer.getTime() < timer + 5 then
    love.graphics.draw(self.eggon, 600, 10)
  end

  if BPA >= 5 and BN >= 5 and BPL >= 5 and ach2 == 0 then
    ach2 = 1
    timer1 = love.timer.getTime()
  end
  if ach2 == 1 and love.timer.getTime() < timer1 + 5 then
    love.graphics.draw(self.massprod,600,10)
  end

  if WR >= 5 and ach3 == 0 then
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

end



return achieve
