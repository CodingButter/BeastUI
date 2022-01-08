-- require("/disk/modules/CC")
-- require("/disk/modules/React")
-- require("/disk/modules/Element")
-- require("/disk/src/context/UserContext")

StartButton = function(props)
    local name = React.useContext(UserContext)
    local setUser = React.setContext(UserContext)
    return  Element.createElement("button",{
        id = "startBtn",
        style = {
            width = 7,
            height = 1,
            left = 1,
            backgroundColor = cc.colors.lightGray
        },
        onClick = function(self,event)
            setUser("james")
        end,
    },name)
end
