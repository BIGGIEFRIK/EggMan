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
    self.y = self.y + nuclearpower/evilkiller
  else
    self.x = self.x - nuclearpower/evilkiller
  end
  if self.x <= 100 then
    if siloStorage > nuclearpower then
      siloStorage = siloStorage - nuclearpower
    else
      siloStorage = 0
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
