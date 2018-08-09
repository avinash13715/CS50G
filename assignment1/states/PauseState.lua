
PauseState = Class{__includes = BaseState}

local pausebutton = love.graphics.newImage('pause.png')

function PauseState:init()
    love.audio.pause(sounds['music'])
    sounds['pause']:play()
end

function PauseState:enter(params)
    self.score = params.score

    -- set the correct trophy
    if self.score < 5 then
        trophy = TROPHY_BRONZE
    elseif self.score < 10 then
        trophy = TROPHY_SILVER
    else
        trophy = TROPHY_GOLD
    end
end

function PauseState:render()
    love.graphics.draw(pausebutton, VIRTUAL_WIDTH/2 - pausebutton:getWidth()/2, VIRTUAL_HEIGHT/2 - pausebutton:getHeight()/2)
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play')
    end
end

function PauseState:exit()
    sounds['pause']:play()
    love.audio.resume(sounds['music'])
end