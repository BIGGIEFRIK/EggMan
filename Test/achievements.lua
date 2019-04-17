local achieve = {}

function achieve:new()
  local a = {
    eggon = love.graphics.newImage("achEggOn.png")
  }
  setmetatable(a, self)
  self.__index = self
  return a
end

function achieve:load()
  ach1 = false
  timer = love.timer.getTime()
end

function achieve:update(dt)
end

function achieve:draw()
  if man.eggscookedheld >= 25 and ach1 == false then
    ach1 = true
    timer = love.timer.getTime()
  end
  if ach1 == true and love.timer.getTime() < timer + 5 then
    love.graphics.draw(self.eggon, 600, 10)
  end
end

return achieve
