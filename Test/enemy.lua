Enemy = {}

function Enemy:new(x, y)
  local enemy = {
    x = x,
    y = y,
    hp = 100,
    img = love.graphics.newImage('evilEggs.png'),
    exists = true,
  }
  setmetatable(enemy, self)
  self.__index = self
  return enemy
end

function Enemy:update(dt)
  if self.y < 350 then
    self.y = self.y + 1
  else
    self.x = self.x - 1
  end
  if self.x <= 100 then
    if siloStorage > 0 then
      siloStorage = siloStorage - 1
    end
    self.exists = false
  end
end

function Enemy:draw()
  if self.exists == true then
    love.graphics.draw(self.img, self.x, self.y)
  end
end

return Enemy
