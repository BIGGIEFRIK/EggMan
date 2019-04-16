local achieve = {}

function achieve:new()
  local a = {
    eggon = love.graphics.newImage("achEggOn.png"),
    timer = love.timer.getTime(),
    eggscookedheld = 30
  }
  setmetatable(a, self)
  self.__index = self
  return a
end

function achieve:load()
end

function achieve:update(dt)

end

function achieve:draw()
  if self.eggscookedheld >= 25 then
    love.graphics.draw(self.eggon, 200, 200)
  end
end

return achieve
