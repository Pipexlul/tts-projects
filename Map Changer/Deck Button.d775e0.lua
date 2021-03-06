local token_col = {
    Red = 1,
    Blue = 2,
    Green = 3,
    Yellow = 4
}

local terminal_col = {
    Grey = 1,
    Red = 2,
    Blue = 3,
    Green = 4,
    Yellow = 5
}

--Items are a WIP
local map_database = {
    [1] = {
        name = "Press R for random maps",
        cards = {}
    },
    [2] = {
        name = "Mos Eisley Outskirts",
        cards = {"Get to the Ship", "Smuggled Goods"},
        items = {
            always = {
                [1] = {
                    objName = "Door",
                    position = {0.07, 1.57, -10.69},
                    rotation = {0.00, 90.00, 0.00}
                },
                [2] = {
                    objName = "Terminal",
                    position = {3.80, 1.56, -12.30},
                    rotation = {0.00, 270.00, 0.00}
                },
                [3] = {
                    objName = "Terminal",
                    position = {-17.36, 1.56, 8.83},
                    rotation = {0.00, 270.00, 0.00}
                }
            },
            skirmishOne = {
                [1] = {
                    objName = "Token",
                    position = {-5.06, 1.67, 0.05},
                    rotation = {0.00, 180.00, 180.00},
                },
                [2] = {
                    objName = "Token",
                    position = {-5.08, 1.67, -1.69},
                    rotation = {0.00, 180.00, 180.00},
                },
                [3] = {
                    objName = "Token",
                    position = {-6.82, 1.67, 0.01},
                    rotation = {0.00, 180.00, 180.00},
                },
                [4] = {
                    objName = "Token",
                    position = {-6.78, 1.67, -1.71},
                    rotation = {0.00, 180.00, 180.00},
                }
            },
            skirmishTwo = {
                [1] = {
                    objName = "Token",
                    position = {0.25, 1.67, -12.22},
                    rotation = {0.00, 180.00, 180.00},
                },
                [2] = {
                    objName = "Token",
                    position = {-3.38, 1.67, -1.73},
                    rotation = {0.00, 180.00, 180.00},
                },
                [3] = {
                    objName = "Token",
                    position = {-17.37, 1.67, 12.38},
                    rotation = {0.00, 180.00, 180.00},
                }
            }
        }
    },
    [3] = {
        name = "Moisture Farm",
        cards = {"Close to Home", "Raiding Party"},
        items = {
            always = {
                [1] = {
                    objName = "Door",
                    position = {5.31, 1.57, -7.94},
                    rotation = {0.00, 180.02, 0.00}
                },
                [2] = {
                    objName = "Door",
                    position = {-1.56, 1.57, 0.98},
                    rotation = {0.00, 180.02, 0.00}
                },
                [3] = {
                    objName = "Terminal",
                    position = {2.04, 1.56, -2.62},
                    rotation = {0.00, 270.00, 0.00}
                },
                [4] = {
                    objName = "Terminal",
                    position = {-17.35, 1.56, -0.89},
                    rotation = {0.00, 270.00, 0.00}
                }
            },
            skirmishOne = {
                [1] = {
                    objName = "Token",
                    position = {3.70, 1.67, -2.62},
                    rotation = {0.00, 180.00, 180.00}
                },
                [2] = {
                    objName = "Token",
                    position = {-15.57, 1.67, 6.18},
                    rotation = {0.00, 180.00, 180.00}
                },
                [3] = {
                    objName = "Token",
                    position = {-12.06, 1.67, -0.89},
                    rotation = {0.00, 180.00, 180.00}
                },
                [4] = {
                    objName = "Token",
                    position = {-15.60, 1.67, -9.66},
                    rotation = {0.00, 180.00, 180.00}
                }
            },
            skirmishTwo = {
                [1] = {
                    objName = "Token",
                    position = {-6.82, 1.57, 2.67},
                    rotation = {0.00, 180.00, 180.00},
                },
                [2] = {
                    objName = "Token",
                    position = {-6.78, 1.57, -2.62},
                    rotation = {0.00, 180.00, 180.00},
                },
                [3] = {
                    objName = "Token",
                    position = {-13.84, 1.57, -0.82},
                    rotation = {0.00, 180.00, 180.00},
                }
            },
        }
    },
    [4] = {
        name = "Massassi Ruins",
        cards = {"Lost Knowledge", "Leave No Evidence"},
        items = {
            always = {
                [1] = {
                    objName = "Terminal",
                    position = {10.55, 1.56, 6.23},
                    rotation = {0.00, 270.00, 0.00}
                },
                [2] = {
                    objName = "Terminal",
                    position = {-17.49, 1.56, -11.31},
                    rotation = {0.00, 270.00, 0.00}
                },
                --Communications Beacon
                [3] = {
                    objName = "Token",
                    position = {0.04, 1.67, 8.05},
                    rotation = {0.00, 180.00, 180.00}
                }
            },
            skirmishOne = {
                [1] = {
                    objName = "Token",
                    position = {3.49, 1.67, -2.61},
                    rotation = {0.00, 180.00, 180.00}
                },
                [2] = {
                    objName = "Token",
                    position = {-5.20, 1.67, 0.88},
                    rotation = {0.00, 180.00, 180.00}
                },
                [3] = {
                    objName = "Token",
                    position = {-3.48, 1.67, -13.05},
                    rotation = {0.00, 180.00, 180.00}
                }
            },
            skirmishTwo = {
                [1] = {
                    objName = "Token",
                    position = {3.49, 1.57, -4.28},
                    rotation = {0.00, 180.00, 180.00}
                },
                [2] = {
                    objName = "Token",
                    position = {-5.18, 1.57, -4.23},
                    rotation = {0.00, 180.00, 180.00}
                },
                [3] = {
                    objName = "Token",
                    position = {-0.03, 1.57, -7.90},
                    rotation = {0.00, 180.00, 180.00}
                },
                [4] = {
                    objName = "Token",
                    position = {-0.07, 1.57, -13.05},
                    rotation = {0.00, 180.00, 180.00}
                },
                [5] = {
                    objName = "Token",
                    position = {-5.19, 1.57, -7.87},
                    rotation = {0.00, 180.00, 180.00}
                },
                [6] = {
                    objName = "Token",
                    position = {-5.19, 1.57, -13.07},
                    rotation = {0.00, 180.00, 180.00}
                }
            }
        }
    },
    [5] = {
        name = "Corellian Underground",
        cards = {"Local Trouble", "Sabacc Standoff"},
        items = {
            always = {
                [1] = {
                    objName = "Door",
                    position = {5.34, 1.57, 6.14},
                    rotation = {0.00, 180.00, 0.00}
                },
                [2] = {
                    objName = "Door",
                    position = {2.09, 1.57, 0.68},
                    rotation = {0.00, 90.00, 0.00}
                },
                [3] = {
                    objName = "Terminal",
                    position = {-12.07, 1.56, -0.97},
                    rotation = {0.00, 270.00, 0.00}
                },
                [4] = {
                    objName = "Terminal",
                    position = {-17.25, 1.56, 0.99},
                    rotation = {0.00, 270.00, 0.00}
                }
            },
            skirmishOne = {
                [1] = {
                    objName = "Token",
                    position = {2.07, 1.67, 6.13},
                    rotation = {0.00, 180.00, 180.00}
                },
                [2] = {
                    objName = "Token",
                    position = {2.16, 1.67, -0.82},
                    rotation = {0.00, 180.00, 180.00}
                },
                [3] = {
                    objName = "Token",
                    position = {-12.01, 1.67, 0.94},
                    rotation = {0.00, 180.00, 180.00}
                },
                [4] = {
                    objName = "Token",
                    position = {-13.81, 1.67, -0.82},
                    rotation = {0.00, 180.00, 180.00}
                }
            },
            skirmishTwo = {
                [1] = {
                    objName = "Token",
                    position = {5.64, 1.57, 2.60},
                    rotation = {0.00, 180.00, 180.00}
                }
            }
        }
    },
    [6] = {
        name = "Imperial Labour Camp",
        cards = {"Infiltration", "Prison Break"}
    },
    [7] = {
        name = "Geonosis Foundry",
        cards = {"Shadow War", "Weapons Project"}
    },
    [8] = {
        name = "Endor Wilderness",
        cards = {"Breakthrough", "Hazardous Materials"}
    },
    [9] = {
        name = "Imperial Research Lab",
        cards = {"Stolen Schematics", "Stranded"}
    },
    [10] = {
        name = "Kuat Space Station",
        cards = {"Data Heist", "Incoming Transmission"}
    },
    [11] = {
        name = "Ord Mantell Junkyard",
        cards = {"Mind of its Own", "Most Dangerous Game"}
    },
    [12] = {
        name = "Mos Eisley Cantina",
        cards = {"Battlefield Engineering", "Drinks and Dealings"}
    },
    [13] = {
        name = "Wasteland Outpost",
        cards = {"Ancient Knowledge", "Volatile Materials"}
    },
    [14] = {
        name = "Tython Meditation Field",
        cards = {"Balance of the Force", "Chosen of the Force"}
    },
    [15] = {
        name = "Imperial Space Station",
        cards = {"Data Run", "Targeting Computers"}
    },
    [16] = {
        name = "Training Ground",
        cards = {"Reprogrammed", "Deception Game"}
    },
    [17] = {
        name = "Development Facility",
        cards = {"Experimental Weapons", "The Art of Robotics"}
    },
    [18] = {
        name = "Sewers of Nar Shaddaa",
        cards = {"Something in the Air", "Unknown Treasures"}
    },
    [19] = {
        name = "Echo Base",
        cards = {"Rapid Adaptation", "Safe and Sound"}
    },
    [20] = {
        name = "Nelvaanian Warzone",
        cards = {"Constant Motion", "Fallout"}
    },
    [21] = {
        name = "Hoth Weather Shelter",
        cards = {"Payload", "Vital Supplies"}
    },
    [22] = {
        name = "Climate Research Camp",
        cards = {"Fire-Fight", "Holding Ground"}
    },
    [23] = {
        name = "Hoth Battle Station",
        cards = {"Bomb Drop", "Inside Job"}
    },
    [24] = {
        name = "Imperial Command Hub",
        cards = {"Uplink", "Delivery System"}
    },
    [25] = {
        name = "Coruscant Landfill",
        cards = {"Lair of the Dianoga", "One Man's Trash"}
    },
    [26] = {
        name = "Bespin Tibanna Facility",
        cards = {"Man in Carbonite"}
    },
    [27] = {
        name = "Lothal Safehouse",
        cards = {"Illicit Reserves", "'Priceless' Relics"}
    },
    [28] = {
        name = "ISB Headquarters",
        cards = {"Reconnaissance", "To Your Stations!"}
    },
    [29] = {
        name = "ISB Training Grounds",
        cards = {"Counter-Slice", "Infiltration Games"}
    },
    [30] = {
        name = "Wasskah Hunting Ground",
        cards = {"Scavengers", "Watch Your Step"}
    },
    [31] = {
        name = "Anchorhead Bar",
        cards = {"Gaining Favor", "Line of Fire"}
    },
    [32] = {
        name = "Kashyyyk Station",
        cards = {"Heavy Firepower", "True Data"}
    },
    [33] = {
        name = "Hangar Bay",
        cards = {"Fortifications", "The Hunted"}
    },
    [34] = {
        name = "The Pit of Carkoon",
        cards = {"Battle for the Khetanna", "Desert Dangers"}
    },
    [35] = {
        name = "The Dune Sea",
        cards = {"Power Surge", "Supply Raid"}
    },
    [36] = {
        name = "Nal Hutta Swamps",
        cards = {"Raining Freight", "Shielded"}
    },
    [37] = {
        name = "Endor Defense Station",
        cards = {"Claim the Ruins", "Renovation"}
    },
    [38] = {
        name = "Jabba's Palace",
        cards = {"New Ownership", "Spoils of Crime"}
    },
    [39] = {
        name = "Tarkin Initiative Labs",
        cards = {"Abandoned Research", "Rogue AI"}
    },
    [40] = {
        name = "Mos Eisley Back Alleys",
        cards = {"Concealed Treasures", "Stashed Away"}
    },
    [41] = {
        name = "Chopper Base, Atollion",
        cards = {"Krykna Infestation", "Powered Perimeter"}
    },
    [42] = {
        name = "30th Floor Plazza",
        cards = {"On Our Way", "Overwatch"}
    },
    [43] = {
        name = "Uscru Entertainment District",
        cards = {"Lost and Found", "Priority Message"}
    },
    [44] = {
        name = "Coruscant Back Alleys",
        cards = {"Propaganda War", "The Triple Cross"}
    },
    [45] = {
        name = "Coruscant Senate Office",
        cards = {"Battle at Dawn", "Priority Extraction"}
    },
    [46] = {
        name = "Lothal Wastes",
        cards = {"Blitz", "Fluctuations"}
    },
    [47] = {
        name = "Lothal Battlefront",
        cards = {"Power Play", "Rise Up"}
    },
    [48] = {
        name = "Devaron Garrison",
        cards = {"Arms Salvage", "Secure Munitions"}
    },
    [49] = {
        name = "Lothal Spaceport",
        cards = {"Market Sabotage", "Mortar Fire"}
    },
    [50] = {
        name = "Imperial Tower",
        cards = {"Intruder Alert", "Close Contact"}
    },
}

--Do not modify this line, it's still a WIP
local bPlaceObjects = false

function MapChangerOnClick(player, value, id)
    local missionDeck = getObjectFromGUID("36a38e")
    local currentMap = FindMapDynamic()
    if (missionDeck ~= nil and currentMap ~= nil) then
        local allCards = missionDeck.getObjects()
        local cardName = allCards[missionDeck.getQuantity()].name
        --print(cardName)

        for i, v in ipairs(map_database) do
            for idx, cn in ipairs(v.cards) do
                if (cardName == cn) then
                    --print("Found map! " .. cardName .. " belongs to " .. v.name)
                    ChangeMapAndSpawnItems(currentMap, i, idx)
                    return
                end
            end
        end
    end
end

function FindMapDynamic()
    local allObjs = getAllObjects()

    for i, v in ipairs(map_database) do
        for idx, obj in ipairs(allObjs) do
            if (v.name == obj.getName()) then
                return obj
            end
        end
    end

    return nil
end

local current_spawned = {}

local door_string = "Door"
local token_string = "Token"
local terminal_string = "Terminal"
function ChangeMapAndSpawnItems(map_obj, state, skirmish)
    ClearObjects()

    if (map_obj.getStateId() ~= state) then
        map_obj.setState(state)
    end

    if (not bPlaceObjects) then return end

    local doors = getObjectFromGUID("e6f922")
    local tokens = getObjectFromGUID("d8d886")
    local terminals = getObjectFromGUID("f9e39b")

    if (doors == nil or tokens == nil or terminals == nil) then
        print("Not all spawners were found")
        return
    end

    local map_items = map_database[state].items
    local always = map_items.always
    local skirmishObjs = skirmish == 1 and map_items.skirmishOne or map_items.skirmishTwo

    for i, obj in ipairs(always) do
        SpawnMapObject(obj, doors, tokens, terminals)
    end

    for i, obj in ipairs(skirmishObjs) do
        SpawnMapObject(obj, doors, tokens, terminals)
    end
end

function ClearObjects()
    for k, objRef in pairs(current_spawned) do
        destroyObject(objRef)
        current_spawned[k] = nil
    end
end

function SpawnMapObject(obj, door_bag, token_bag, terminal_bag)
    local chosenBag = nil
    if (obj.objName == door_string) then
        chosenBag = door_bag
    elseif (obj.objName == token_string) then
        chosenBag = token_bag
    elseif (obj.objName == terminal_string) then
        chosenBag = terminal_bag
    end

    if (chosenBag ~= nil) then
        chosenBag.takeObject({
            position          = obj.position,
            rotation          = obj.rotation,
            smooth            = true,
            index             = 1,
            callback_function = function(objRef) table.insert(current_spawned, objRef) end
        })
    end
end

--[[
function onObjectSpawn(object)
    local objName = object.getName()
    for i, v in ipairs(map_database) do
        if (v.name == objName) then
            printToAll("New map loaded: " .. object.getName(), {1, 1, 1})
            ClearObjects()
            break
        end
    end
end
--]]