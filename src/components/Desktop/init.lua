local utils = require "modules.Utils"
local Element = require "modules.Element"
local TaskBar = require "src.components.TaskBar"
local Window = require "src.components.Window"

local Desktop = function(props)
    local WIDTH, HEIGHT = term.getSize()
    return Element.createElement("div", {
        style = {
            id = "desktop",
            width = WIDTH,
            height = HEIGHT,
            backgroundColor = colors.green
        },
        children = {Element.createElement("div", {
            id = "window_container",
            children = utils.table.map(props.children, function(v, i)
                return Window({
                    windowId = v.windowId or i,
                    children = v.application,
                    title = v.title
                })
            end)
        }), TaskBar()}
    })
end

return Desktop
