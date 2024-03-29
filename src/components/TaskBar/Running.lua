local Element = require "modules.Element"
local React = require "modules.React"
local utils = require "modules.Utils"
local WindowManagerContext = require "src.context.WindowManagerContext"
local Button = require "src.components.Button"

local Running = function(props)
    local windows, windowsDispatch = table.unpack(React.useContext(WindowManagerContext))
    local iconWidth = 8
    return Element.createElement("div", {
        style = {
            left = 8,
            height = 1
        },
        children = utils.table.map(windows, function(window, i, k)
            local windowState, windowDispatch = table.unpack(window)
            return Button({
                text = windowState.title:sub(1, iconWidth - 2),
                style = {
                    top = 0,
                    width = iconWidth,
                    height = 1,
                    left = 2 + ((i - 1) * (iconWidth + 1)),
                    display = windowState.open and "block" or "none",
                    backgroundColor = (function()
                        if windowState.maximized == false then
                            return colors.gray
                        end
                        return colors.lightGray
                    end)()
                },
                onClick = function(event)
                    if windowState.maximized then
                        windowDispatch({
                            type = "minimize"
                        })
                        windowsDispatch({
                            type = "setInactive",
                            payload = windowState.windowId
                        })
                    else
                        windowDispatch({
                            type = "maximize"
                        })
                        windowsDispatch({
                            type = "setActive",
                            payload = windowState.windowId
                        })
                    end
                end
            })
        end)
    })
end

return Running
