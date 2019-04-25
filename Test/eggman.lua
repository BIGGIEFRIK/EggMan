Eggman = {}

function Eggman:new()
  local human = {
    px,
    py,
    speed,
    multspeed,
    stamina,
    staminamax,
    workrate,
    eggscookedheld
  }
  setmetatable(human, self)
  self.__index = self
  return Eggman
end

function Eggman:load()
  self.px = 400
  self.py = 300
  self.speed = 1
  self.stamina = 100
  self.multspeed = 1
  self.money = 10000000000
  self.workrate = 1
  self.eggscookedheld = 25
  self.tp = 0
  self.img = love.graphics.newImage("eggman.png")
  self.staminamax = 100
end

function Eggman:update(dt)
  if love.keyboard.isDown('w') then
    self.py = self.py - self.speed
  end

  if love.keyboard.isDown('s') then
    self.py = self.py + self.speed
  end

  if love.keyboard.isDown('a') then
    self.px = self.px - self.speed
  end

  if love.keyboard.isDown('d') then
    self.px = self.px + self.speed
  end

  if love.keyboard.isDown('p') and self.stamina > 0 then
    self.speed = 4 * self.multspeed
    self.stamina = self.stamina - 1
  else
    self.speed = 2 * self.multspeed
  end

  if self.px > 795 then
    self.px = -5
    self.tp=self.tp+1
  end

  if self.px < -5 then
    self.px = 795
    self.tp=self.tp+1
  end

  if self.py > 590 then
    self.py = -10
    self.tp=self.tp+1
  end

  if self.py < -10 then
    self.py = 590
    self.tp=self.tp+1
  end
end

function Eggman:draw()

end

return Eggman
