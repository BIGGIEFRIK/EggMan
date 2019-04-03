local Play = require 'play'

function love.load()
  play = Play:new()
  play:load()
end


function love.update(dt)
  play:update(dt)
end


function love.draw()
  play:draw()
end
