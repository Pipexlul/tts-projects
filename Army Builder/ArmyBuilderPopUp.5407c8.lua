local DisplayPopup = false

local CardTitle = "Joe Mama V2"

local CurrentUnits = 1
local MaxUnits = 3

local MainGUID = "6beb0e"

function ActivatePopup(params)
    local cardName = params[1]
    local maxUnits = params[2]

    CardTitle = cardName
    MaxUnits = maxUnits

    DisplayPopup = true
    RebuildUI()
end

function SelectUnitAmount(player, amountStr, id)
    local amount = tonumber(amountStr)

    local mainObj = getObjectFromGUID(MainGUID)
    mainObj.call("ResultFromPopup", {amount})

    DisplayPopup = false
    RebuildUI()
end

function RebuildUI()
    local menuColors = {
        MainBackground = "rgb(0.3,0.3,0.3)",
        ArmyBackground = {
            -- In case Mellow wants different colors LMAO
            Rebel = "rgb(0.3,0.3,0.3)",
            Imperial = "rgb(0.3,0.3,0.3)",
            Mercenary = "rgb(0.3,0.3,0.3)"
        }
    }

    local menuToDisplay = {{}}

    if DisplayPopup then
        menuToDisplay[1] = {
            tag = "Defaults",
            children = {
                [1] = {
                    tag = "Text",
                    attributes = {
                        class = "ButtonText",
                        color = "White",
                        fontStyle = "Bold",
                        fontSize = "18",
                        outline = "Black",
                        outlineSize = "1 -1"
                    }
                },
                [2] = {
                    tag = "Button",
                    attributes = {
                        class = "StandardButton",
                        colors = "rgba(0.7,0.7,0.7,0.7)|White|rgba(0.85,0.85,0.85,0.85)|rgba(0.5,0.5,0.5,0.5)"
                    },
                    children = {}
                }
            }
        }

        menuToDisplay[2] = {
            tag = "Panel",
            attributes = {
                position = "0 0 -100",
                color = menuColors.MainBackground,
                width = "400",
                height = "250",
                padding = "10 10 10 10"                
            },
            children = {
                [1] = {
                    tag = "VerticalLayout",
                    attributes = {
                        spacing = "5",
                        childForceExpandHeight = "true"
                    },
                    children = {
                        [1] = {
                            tag = "Text",
                            value = CardTitle,
                            attributes = {
                                class = "ButtonText",
                                fontSize = 24
                            }
                        },
                        [2] = {
                            tag = "Text",
                            value = "How many figures?",
                            attributes = {
                                class = "ButtonText"
                            }
                        },
                        [3] = {
                            tag = "HorizontalLayout",
                            attributes = {
                                spacing = "5"
                            },
                            children = {}
                        }
                    }
                }
            }
        }

        local buttonElements = menuToDisplay[2].children[1].children[3].children -- xd

        for i = 1, MaxUnits do
            table.insert(buttonElements, {
                tag = "Button",
                attributes = {
                    class = "StandardButton",
                    onClick = "SelectUnitAmount" .. "(" .. tostring(i) .. ")"
                },
                children = {
                    [1] = {
                        tag = "Text",
                        value = tostring(i), -- .. " " .. (i == 1 and "unit" or "units"),
                        attributes = {
                            class = "ButtonText",
                            fontSize = "20"
                        }
                    }
                }
            })
        end
    end

    self.UI.setXmlTable(menuToDisplay)
end

function onLoad()
    RebuildUI()
end