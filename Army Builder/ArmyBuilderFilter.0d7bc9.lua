local Traits = {
    Brawler = 1,
    Creature = 2,
    Droid = 4,
    ForceUser = 8,
    Guardian = 16,
    HeavyWeapon = 32,
    Hunter = 64,
    Imperial = 128,
    Leader = 256,
    Merc = 512,
    Rebel = 1024,
    Smuggler = 2048,
    Spy = 4096,
    Trooper = 8192,
    Unique = 16384,
    Vehicle = 32768,
    Wookiee = 65536,

    Any = 131071
}

local TraitStatus = {
    [1] = {name = "Brawler", isOn = false},
    [2] = {name = "Creature", isOn = false},
    [3] = {name = "Droid", isOn = false},
    [4] = {name = "ForceUser", isOn = false},
    [5] = {name = "Guardian", isOn = false},
    [6] = {name = "HeavyWeapon", isOn = false},
    [7] = {name = "Hunter", isOn = false},
    [8] = {name = "Imperial", isOn = false},
    [9] = {name = "Leader", isOn = false},
    [10] = {name = "Merc", isOn = false},
    [11] = {name = "Rebel", isOn = false},
    [12] = {name = "Smuggler", isOn = false},
    [13] = {name = "Spy", isOn = false},
    [14] = {name = "Trooper", isOn = false},
    [15] = {name = "Unique", isOn = false},
    [16] = {name = "Vehicle", isOn = false},
    [17] = {name = "Wookiee", isOn = false}
}

local MainGUID = "6beb0e"

local ShowMenu = false

function ToggleShowMenu(params)
    if params and params[1] then --Force off
        ShowMenu = false
    else
        ShowMenu = not ShowMenu
    end

    RebuildUI()
end

function ToggleTraitStatus(player, value, id)
    local index = tonumber(value)
    TraitStatus[index].isOn = not TraitStatus[index].isOn

    RebuildUI()

    local mainObj = getObjectFromGUID(MainGUID)
    mainObj.call("SetCurrentFilterValue", {GetCurrentFilterValue()})
end

function ResetAllFilters(player, value, id)
    for i, v in ipairs(TraitStatus) do v.isOn = false end

    RebuildUI()

    local mainObj = getObjectFromGUID(MainGUID)
    mainObj.call("SetCurrentFilterValue", {0})
end

function GetCurrentFilterValue()
    local value = 0
    for i, v in ipairs(TraitStatus) do
        if v.isOn then
            value = bit32.bor(value, Traits[v.name])
        end
    end

    return value
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

    local menuToDisplay = {
        {
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
    }

    if ShowMenu then
        menuToDisplay[2] = {
            tag = "Panel",
            attributes = {
                position = "0 0 -100",
                color = menuColors.MainBackground,
                width = "400",
                height = "400",
                padding = "10 10 10 10"
            },
            children = {
                [1] = {
                    tag = "VerticalLayout",
                    attributes = {spacing = "5"},
                    children = {}
                }
            }
        }

        local filtersElements = menuToDisplay[2].children[1].children

        local nTraits = #TraitStatus

        for i = 1, nTraits - 2, 2 do
            local traitInfo = TraitStatus[i]
            local traitInfoNext = TraitStatus[i + 1]

            table.insert(filtersElements, {
                tag = "HorizontalLayout",
                attributes = {spacing = "5"},
                children = {
                    [1] = {
                        tag = "HorizontalLayout",
                        attributes = {spacing = "2", preferredWidth = "200"},
                        children = {
                            [1] = {
                                tag = "Toggle",
                                attributes = {
                                    onValueChanged = "ToggleTraitStatus" .. "(" ..
                                        tostring(i) .. ")",
                                    isOn = TraitStatus[i].isOn
                                }
                            },
                            [2] = {
                                tag = "Text",
                                value = traitInfo.name,
                                attributes = {
                                    class = "ButtonText",
                                    preferredWidth = "150"
                                }
                            }
                        }
                    },
                    [2] = {
                        tag = "HorizontalLayout",
                        attributes = {spacing = "2", preferredWidth = "200"},
                        children = {
                            [1] = {
                                tag = "Toggle",
                                attributes = {
                                    onValueChanged = "ToggleTraitStatus" .. "(" ..
                                        tostring(i + 1) .. ")",
                                    isOn = TraitStatus[i + 1].isOn
                                }
                            },
                            [2] = {
                                tag = "Text",
                                value = traitInfoNext.name,
                                attributes = {
                                    class = "ButtonText",
                                    preferredWidth = "150"
                                }
                            }
                        }
                    }
                }
            })
        end

        table.insert(filtersElements, {
            tag = "HorizontalLayout",
            attributes = {spacing = "5"},
            children = {
                [1] = {
                    tag = "HorizontalLayout",
                    attributes = {spacing = "2", preferredWidth = "200"},
                    children = {
                        [1] = {
                            tag = "Toggle",
                            attributes = {
                                onValueChanged = "ToggleTraitStatus" .. "(" ..
                                    tostring(nTraits) .. ")",
                                isOn = TraitStatus[nTraits].isOn
                            }
                        },
                        [2] = {
                            tag = "Text",
                            value = TraitStatus[nTraits].name,
                            attributes = {
                                class = "ButtonText",
                                preferredWidth = "150"
                            }
                        }
                    }
                },
                [2] = {
                    tag = "HorizontalLayout",
                    attributes = {spacing = "2", preferredWidth = "200"},
                    children = {
                        [1] = {
                            tag = "Button",
                            attributes = {
                                class = "StandardButton",
                                onClick = "ResetAllFilters"
                            },
                            children = {
                                [1] = {
                                    tag = "Text",
                                    value = "Reset Filters",
                                    attributes = {class = "ButtonText"}
                                }
                            }
                        }
                    }
                }
            }
        })

    end

    self.UI.setXmlTable(menuToDisplay)
end

function onLoad(save_state) 
    --RebuildUI() 
end