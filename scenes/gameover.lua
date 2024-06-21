-- -----------------------------------------------------------------------------------
-- Import
-- -----------------------------------------------------------------------------------

local composer = require("composer")
local relayout = require("relayout")
local utilities = require("utilities")

-- -----------------------------------------------------------------------------------
-- Set variables
-- -----------------------------------------------------------------------------------

-- Layout
local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY

-- Scene
local scene = composer.newScene()

-- Groups
local grpMain

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
  print("scene:create - gameover")

  -- Create main group and insert to scene
  grpMain = display.newGroup()
  self.view:insert(grpMain)

  -- Insert objects to grpMain here

  local bg = display.newImageRect("background.png", _W, _H)
  bg.x = _CX
  bg.y = _CY
  grpMain:insert(bg)

  local isHighScore = utilities:setHighScore(utilities:getPreviousScore())

  local lblScore = display.newText("Score: " .. utilities:getPreviousScore(), _CX, _CY, "PressStart2P-Regular.ttf", 20)
  grpMain:insert(lblScore)

  local lblHighScore = display.newText("Highcore: " .. utilities:getHighscore(), _CX, _CY + 50, "PressStart2P-Regular.ttf", 16)
  grpMain:insert(lblHighScore)
  
  local backbtn = display.newText("go to menu ", _CX, _CY + 100, "PressStart2P-Regular.ttf", 16)
  grpMain:insert(backbtn)

  -- Add tap event listener to the back button
  backbtn:addEventListener("tap", function()
    print("check")
    composer.gotoScene("scenes.menu")
  end)

  if isHighScore == true then
    local lblNewHighscore = display.newText("New Highscore :D", _CX, _CY - 50, "PressStart2P-Regular.ttf", 20)
    grpMain:insert(lblNewHighscore)
  end
end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener("create", scene)

return scene
