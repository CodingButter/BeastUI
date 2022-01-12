
local React = require "modules/React"
local StartButton = require "src/components/TaskBar/StartButton"
local BeastOs = require "src/components/TaskBar/BeastOs"
local StartMenu = require "src/components/TaskBar/StartMenu"
e = React.createElement

TaskBar = function(props)
    local WIDTH, HEIGHT = term.getSize()
    local menu,updateMenu = React.useState(false)
    local function toggleMenu()
        local newVal = true
        if menu then newVal = false else newVal = true end
        updateMenu(newVal)
    end
    local element =  e("div",{
        id = "taskbar",
        style = {
            height = 1,
            width = WIDTH,
            top = HEIGHT - 1,
            backgroundColor = colors.red,
            textColor = colors.black
        },
        children = (function()
            local chtbl = {}
            if menu then chtbl[#chtbl+1] = StartMenu({toggleMenu = toggleMenu}) end
            chtbl[#chtbl+1] = BeastOs({width=WIDTH})
            chtbl[#chtbl+1] = StartButton({
                toggleMenu = toggleMenu,
            })
            return chtbl
        end)()
    })
   
    return element
end

return TaskBar
