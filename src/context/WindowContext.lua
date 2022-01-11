local React = require "modules/React"
local Applications = require "src/applications"
local windowContexts = {}

for k,v in pairs(Applications) do
    windowContexts[k] = React.createContext({windowId=i,opened=false,fullscreen=true,maximized=false,left=0,top=0,width=15,height=15})
end

return windowContexts

