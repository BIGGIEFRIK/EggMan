local Play = require 'play'
local achieve = require 'achievements'

function love.load()
  play = Play:new()
  achieve = achieve:new()
  play:load()
  achieve:load()
end


function love.update(dt)
  play:update(dt)
  achieve:update(dt)
end


function love.draw()
  play:draw()
  achieve:draw()
end
