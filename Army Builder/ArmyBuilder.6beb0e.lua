--[[
function TableToString(val, name, skipnewlines, depth)
    skipnewlines = skipnewlines or false
    depth = depth or 0

    local tmp = string.rep("\t", depth)

    if type(name) == "number" then name = "[" .. tostring(name) .. "]" end
    if name then tmp = tmp .. name .. " = " end

    if type(val) == "table" then
        tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

        for k, v in pairs(val) do
            tmp = tmp .. TableToString(v, k, skipnewlines, depth + 1) .. "," ..
            (not skipnewlines and "\n" or "")
        end
        
        tmp = tmp .. string.rep("\t", depth) .. "}"
    elseif type(val) == "number" or type(val) == "boolean" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    else
        tmp = tmp .. "\"[inserializeable datatype:" .. type(val) .. "]\""
    end
    
    return tmp
end
--]] local Traits = {
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

local Card_Database = {
    Command = {
        BackUrl = "http://cloud-3.steamusercontent.com/ugc/1669110423225693997/881A954287E4882C06142AC5BCF54C394BFC6AD4/",
        Cards = {
            [0] = {name = "", url = "", cardCost = 0, traits = 0, cardLimit = 0},
            [1] = {
                name = "A Powerful Influence",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110423225726270/59619F63B1450135463E8821C1200D1DB2AFEAE1/",
                cardCost = 2,
                traits = Traits.ForceUser,
                cardLimit = 1
            },
            [2] = {
                name = "Adrenaline",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110423225731421/200773E4859945B0766787E0E9BEDA1136731913/",
                cardCost = 2,
                traits = Traits.Wookiee,
                cardLimit = 1
            },
            [3] = {
                name = "Advance Warning",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110423225735711/A8BFE318FD5191EFE3E02B8087782E71BA04257E/",
                cardCost = 0,
                traits = Traits.Leader,
                cardLimit = 1
            }
        }
    },
    Rebel = {
        BackUrl = "http://cloud-3.steamusercontent.com/ugc/1669110151888417210/7192E14A9C5611D88D105DA431F5024912BB7C08/",
        Deployment = {
            [0] = {
                name = "",
                url = "",
                cardCost = 0,
                isGroup = false,
                traits = 0,
                figurineData = {},
                cardLimit = 1,
                unitLimit = 1
            },
            [1] = {
                name = "Ahsoka Tano",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151887796322/934D13E287E7AC373B1E2FEA754DAAA7EAD1EC06/",
                cardCost = 8,
                isGroup = false,
                traits = bit32.bor(Traits.ForceUser, Traits.Leader, Traits.Spy,
                                   Traits.Unique),
                figurineData = {},
                cardLimit = 1,
                unitLimit = 1
            },
            [2] = {
                name = "Alliance Ranger Elite",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151887873645/05F91C8A629668A32E58C8C6504F2D6DED3F4FC8/",
                cardCost = 4,
                isGroup = true,
                traits = bit32.bor(Traits.Trooper, Traits.Hunter),
                figurineData = {},
                cardLimit = 2,
                unitLimit = 3
            },
            [3] = {
                name = "Alliance Ranger",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889629485/560C63B58926BD113531FCBE2F3E282366AD7C9B/",
                cardCost = 3,
                isGroup = true,
                traits = bit32.bor(Traits.Trooper, Traits.Hunter),
                figurineData = {},
                cardLimit = 2,
                unitLimit = 3
            }
        },
        Upgrades = {
            [0] = {name = "", url = "", cardCost = 0},
            [1] = {
                name = "Balance of the Force",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151887891395/80A70C283B4FA51A6FA704B1E9BF974A93A9D672/",
                cardCost = 1
            },
            [2] = {
                name = "Combat Suit",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151887905167/80613D1EE02F6D861B7DA3174E4EA257033B57B8/",
                cardCost = 1
            },
            [3] = {
                name = "Fury of Kashyyyk",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889635662/9AC9AA88C428F60A98218FCF79B2C3F1F056256F/",
                cardCost = 2
            }
        }
    },
    Imperial = {
        BackUrl = "http://cloud-3.steamusercontent.com/ugc/1669110151889645177/B09498ECCAB28AF4B654FC00C2B60FE414F0BD7E/",
        Deployment = {
            [0] = {
                name = "",
                url = "",
                cardCost = 0,
                isGroup = false,
                traits = 0,
                figurineData = {}
            },
            [1] = {
                name = "0-0-0",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889651017/24F8EC95462DDDEFED14C9072E39C29AFC095D87/",
                cardCost = 4,
                isGroup = false,
                traits = Traits.Droid,
                figurineData = {}
            },
            [2] = {
                name = "Agent Blaise",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889659240/90B382EF1B6B33C63932975B2FCC24BD8DCC4A0E/",
                cardCost = 6,
                isGroup = false,
                traits = bit32.bor(Traits.Spy, Traits.Leader),
                figurineData = {}
            },
            [3] = {
                name = "AT-DP",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889666620/7C71FA2E3494895C5A21A68E839AF313FCE911F5/",
                cardCost = 9,
                isGroup = false,
                traits = bit32.bor(Traits.Vehicle, Traits.HeavyWeapon),
                figurineData = {}
            }
        },
        Upgrades = {
            [0] = {name = "", url = "", cardCost = 0},
            [1] = {
                name = "Advanced Com Systems",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889673876/7EF71E1011D144B842C0330E47EDBD1E16822B9A/",
                cardCost = 1
            },
            [2] = {
                name = "Cross Training",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889675354/3102394CD1FD37713A56A641A04C88DA0C20D15C/",
                cardCost = 1
            },
            [3] = {
                name = "Driven By Hatred",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889676352/6A27F56E230C02625F9F3DBC9D97DA3299451E1A/",
                cardCost = -5
            }
        }
    },
    Mercenary = {
        BackUrl = "http://cloud-3.steamusercontent.com/ugc/1669110151889684657/B8CC378C1E68971F9B4FD286F063905487C56078/",
        Deployment = {
            [0] = {
                name = "",
                url = "",
                cardCost = 0,
                isGroup = false,
                traits = 0,
                figurineData = {}
            },
            [1] = {
                name = "Bantha Rider",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889695996/D10799B9DD288A3C1F9849EAF70E237F5E2BCB8E/",
                cardCost = 9,
                isGroup = false,
                traits = bit32.bor(Traits.Creature, Traits.Brawler),
                figurineData = {}
            },
            [2] = {
                name = "Boba Fett",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889698483/F1E0C4A396890F53A8A35EA77B1713C8D05EB98F/",
                cardCost = 13,
                isGroup = false,
                traits = Traits.Hunter,
                figurineData = {}
            },
            [3] = {
                name = "Bossk",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889699723/E63A48B7DFB90134072C5314957C5078641CC054/",
                cardCost = 8,
                isGroup = false,
                traits = bit32.bor(Traits.Hunter, Traits.Brawler),
                figurineData = {}
            }
        },
        Upgrades = {
            [0] = {name = "", url = "", cardCost = 0},
            [1] = {
                name = "Beast Tamer",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889705381/75B089F4AE8521B24CE2BEA8E406C366A0084C8C/",
                cardCost = 1
            },
            [2] = {
                name = "Black Market",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889706786/A6B397EE08EB17AAB8541E51F5880C505BA761E2/",
                cardCost = 1
            },
            [3] = {
                name = "Devious Scheme",
                url = "http://cloud-3.steamusercontent.com/ugc/1669110151889707804/8865E29BD0370DA641A523D53253DC3E4DD7CD1B/",
                cardCost = 1
            }
        }
    }
}

local PreviewerGUID = "b0833a"
local FilterGUID = "0d7bc9"
local PopupGUID = "5407c8"

local MenuModes = {
    Main = 1,
    RebelBuild = 2,
    ImpBuild = 3,
    MercBuild = 4,
    CommandBuild = 5
}
local CurrentMenuMode = MenuModes.Main

local ArmyEnum = {Rebel = 1, Imperial = 2, Mercenary = 3, Command = 4}
local CardModeEnum = {Deployment = 1, Upgrades = 2, Command = 3}

local SelectedDeploymentCards = {}
local SelectedUpgradeCards = {}
local SelectedCommandCards = {}

local SelectedDeploymentGroupData = {}

local CurrentFilterValue = 0

local LastArmyMenu = 0

local IsInPopUpMode = false

-- local SelectedPreview = nil

function ResultFromPopup(params)
    local result = params[1]

    local cardToModify = SelectedDeploymentCards[#SelectedDeploymentCards]
    cardToModify.unitAmount = result

    RebuildUI()

    IsInPopUpMode = false
end

function SetCurrentFilterValue(params)
    CurrentFilterValue = params[1]

    RebuildUI()
end

function ShowHideFilter(player, value, id)
    local filterObj = getObjectFromGUID(FilterGUID)
    filterObj.call("ToggleShowMenu")
end

function ResetSelectedCards()
    SelectedDeploymentCards = {}
    SelectedUpgradeCards = {}
    SelectedCommandCards = {}

    SelectedDeploymentGroupData = {}
end

function SetMenuMode(player, menu_mode, id)
    if IsInPopUpMode then return end

    CurrentMenuMode = tonumber(menu_mode)

    if CurrentMenuMode == MenuModes.Main then
        ResetSelectedCards()
        ClearCardPreview()
        ForceResetFilters()
    end

    RebuildUI()
end

function EnablePopup(cardName, maxUnits)
    IsInPopUpMode = true

    local popupObj = getObjectFromGUID(PopupGUID)
    popupObj.call("ActivatePopup", {cardName, maxUnits})
end

function AddCard(army, mode, cardId)
    if IsInPopUpMode then return end

    cardId = tonumber(cardId)

    local cardDB = nil

    if army == ArmyEnum.Rebel then
        cardDB = Card_Database.Rebel
    elseif army == ArmyEnum.Imperial then
        cardDB = Card_Database.Imperial
    elseif army == ArmyEnum.Mercenary then
        cardDB = Card_Database.Mercenary
    elseif army == ArmyEnum.Command then
        cardDB = Card_Database.Command
    end

    if cardDB == nil then return end

    local selectedContainer = nil

    if mode == CardModeEnum.Deployment then
        cardDB = cardDB.Deployment
        selectedContainer = SelectedDeploymentCards
    elseif mode == CardModeEnum.Upgrades then
        cardDB = cardDB.Upgrades
        selectedContainer = SelectedUpgradeCards
    elseif mode == CardModeEnum.Command then
        cardDB = cardDB.Cards
        selectedContainer = SelectedCommandCards
    end

    if selectedContainer == nil then return end

    for i, v in ipairs(selectedContainer) do
        if v.cardNum == cardId then
            local groupDataIndex = nil

            if mode == CardModeEnum.Upgrades then
                return
            elseif mode == CardModeEnum.Deployment then
                if v.isGroup then
                    for j, v2 in ipairs(SelectedDeploymentGroupData) do
                        if v2.cardNum == v.cardNum then
                            groupDataIndex = j
                            if v2.amount + 1 > v.cardLimit then
                                return
                            end
                        end
                    end
                else
                    if v.amount + 1 > v.cardLimit then return end
                end
            elseif mode == CardModeEnum.Command then
                if v.amount + 1 > v.cardLimit then return end
            end

            if v.isGroup then
                local groupData = SelectedDeploymentGroupData[groupDataIndex]
                groupData.amount = groupData.amount + 1
            else
                v.amount = v.amount + 1
            end

            RebuildUI()

            if not v.isGroup then return end
        end
    end

    local function ExistsInGroupData(cardId)
        for i, v in ipairs(SelectedDeploymentGroupData) do
            if v.cardNum == cardId then return true end
        end

        return false
    end

    local function GetGroupDataIndex(cardId)
        for i, v in ipairs(SelectedDeploymentGroupData) do
            if v.cardNum == cardId then return i end
        end

        return nil
    end

    if cardDB[tonumber(cardId)].isGroup then
        if not ExistsInGroupData(cardId) then
            table.insert(SelectedDeploymentGroupData,
                         {cardNum = cardId, amount = 1})
        end
    end

    table.insert(selectedContainer, {
        cardNum = cardId,
        amount = 1,
        unitAmount = 1,
        name = cardDB[tonumber(cardId)].name,
        cost = cardDB[tonumber(cardId)].cardCost,
        isGroup = (mode == CardModeEnum.Deployment and
            cardDB[tonumber(cardId)].isGroup or false),
        cardLimit = (mode ~= CardModeEnum.Upgrades and
            cardDB[tonumber(cardId)].cardLimit or 1),
        unitLimit = (mode == CardModeEnum.Deployment and
            cardDB[tonumber(cardId)].unitLimit or 1)
    })

    local addedCard = selectedContainer[#selectedContainer]
    if addedCard.isGroup then
        EnablePopup(addedCard.name, addedCard.unitLimit)
    end

    RebuildUI()
end

function AddCardRebelDeploy(player, cardId, id)
    AddCard(ArmyEnum.Rebel, CardModeEnum.Deployment, cardId)
end

function AddCardRebelUpgrade(player, cardId, id)
    AddCard(ArmyEnum.Rebel, CardModeEnum.Upgrades, cardId)
end

function AddCardImpDeploy(player, cardId, id)
    AddCard(ArmyEnum.Imperial, CardModeEnum.Deployment, cardId)
end

function AddCardImpUpgrade(player, cardId, id)
    AddCard(ArmyEnum.Imperial, CardModeEnum.Upgrades, cardId)
end

function AddCardMercDeploy(player, cardId, id)
    AddCard(ArmyEnum.Mercenary, CardModeEnum.Deployment, cardId)
end

function AddCardMercUpgrade(player, cardId, id)
    AddCard(ArmyEnum.Mercenary, CardModeEnum.Upgrades, cardId)
end

function AddCardCmd(player, cardId, id)
    AddCard(ArmyEnum.Command, CardModeEnum.Command, cardId)
end

function RemoveCard(mode, cardData)
    if IsInPopUpMode then return end

    local dashPos = string.find(cardData, "-", 1, true)
    local cardId = tonumber(string.sub(cardData, 1, dashPos - 1))
    local indexInTable = tonumber(string.sub(cardData, dashPos + 1))

    local selectedContainer = nil

    if mode == CardModeEnum.Deployment then
        selectedContainer = SelectedDeploymentCards
    elseif mode == CardModeEnum.Upgrades then
        selectedContainer = SelectedUpgradeCards
    elseif mode == CardModeEnum.Command then
        selectedContainer = SelectedCommandCards
    end

    if selectedContainer == nil then return end

    for i, v in ipairs(selectedContainer) do
        if v.cardNum == cardId then
            if mode == CardModeEnum.Upgrades or mode == CardModeEnum.Command then
                v.amount = v.amount - 1

                if v.amount <= 0 then
                    table.remove(selectedContainer, i)
                end

                RebuildUI()
                return
            else
                if v.isGroup then
                    for j, v2 in ipairs(SelectedDeploymentGroupData) do
                        if v2.cardNum == v.cardNum then
                            v2.amount = v2.amount - 1

                            if v2.amount <= 0 then
                                table.remove(SelectedDeploymentGroupData, j)
                            end

                            table.remove(selectedContainer, indexInTable)

                            RebuildUI()
                            return
                        end
                    end
                else
                    v.amount = v.amount - 1

                    if v.amount <= 0 then
                        table.remove(selectedContainer, i)
                    end

                    RebuildUI()
                    return
                end
            end
        end
    end
end

function RemoveCardDeploy(player, cardId, id)
    RemoveCard(CardModeEnum.Deployment, cardId)
end

function RemoveCardUpgrade(player, cardId, id)
    RemoveCard(CardModeEnum.Upgrades, cardId)
end

function RemoveCardCmd(player, cardId, id)
    RemoveCard(CardModeEnum.Command, cardId)
end

function UpdateAssets(assets, army)
    if army == ArmyEnum.Command then -- Handling the special case of command cards
        local cmdCards = Card_Database.Command.Cards

        for i, v in ipairs(cmdCards) do
            table.insert(assets, {name = v.name, url = v.url})
        end
    else -- Normal army cards
        local armyCards = nil

        if army == ArmyEnum.Rebel then
            armyCards = Card_Database.Rebel
        elseif army == ArmyEnum.Imperial then
            armyCards = Card_Database.Imperial
        elseif army == ArmyEnum.Mercenary then
            armyCards = Card_Database.Mercenary
        end

        for i, v in ipairs(armyCards.Deployment) do
            table.insert(assets, {name = v.name, url = v.url})
        end

        for i, v in ipairs(armyCards.Upgrades) do
            table.insert(assets, {name = v.name, url = v.url})
        end
    end

    local previewer = getObjectFromGUID(PreviewerGUID)
    previewer.call("SetUiAssets", {assets})
end

function SetCardPreview(army, mode, cardIndex)
    local cardDB = nil

    if army == ArmyEnum.Rebel then
        cardDB = Card_Database.Rebel
    elseif army == ArmyEnum.Imperial then
        cardDB = Card_Database.Imperial
    elseif army == ArmyEnum.Mercenary then
        cardDB = Card_Database.Mercenary
    elseif army == ArmyEnum.Command then
        cardDB = Card_Database.Command
    end

    if cardDB == nil then return end

    if mode == CardModeEnum.Deployment then
        cardDB = cardDB.Deployment
    elseif mode == CardModeEnum.Upgrades then
        cardDB = cardDB.Upgrades
    elseif mode == CardModeEnum.Command then
        cardDB = cardDB.Cards
    end

    local selectedPreview = cardDB[tonumber(cardIndex)].name

    local previewer = getObjectFromGUID(PreviewerGUID)
    previewer.call("SetPreviewCard", {selectedPreview})
end

function SetCardPreviewRebelDeploy(player, cardValue, id)
    SetCardPreview(ArmyEnum.Rebel, CardModeEnum.Deployment, cardValue)
end

function SetCardPreviewImpDeploy(player, cardValue, id)
    SetCardPreview(ArmyEnum.Imperial, CardModeEnum.Deployment, cardValue)
end

function SetCardPreviewMercDeploy(player, cardValue, id)
    SetCardPreview(ArmyEnum.Mercenary, CardModeEnum.Deployment, cardValue)
end

function SetCardPreviewRebelUpgrade(player, cardValue, id)
    SetCardPreview(ArmyEnum.Rebel, CardModeEnum.Upgrades, cardValue)
end

function SetCardPreviewImpUpgrade(player, cardValue, id)
    SetCardPreview(ArmyEnum.Imperial, CardModeEnum.Upgrades, cardValue)
end

function SetCardPreviewMercUpgrade(player, cardValue, id)
    SetCardPreview(ArmyEnum.Mercenary, CardModeEnum.Upgrades, cardValue)
end

function SetCardPreviewCmd(player, cardValue, id)
    SetCardPreview(ArmyEnum.Command, CardModeEnum.Command, cardValue)
end

function ClearCardPreview(player, value, id)
    local previewer = getObjectFromGUID(PreviewerGUID)

    previewer.call("ClearCardPreview")
end

function ForceResetFilters()
    local filterObj = getObjectFromGUID(FilterGUID)
    filterObj.call("ResetAllFilters")
    filterObj.call("ToggleShowMenu", {true})
end

function ToggleCmdCards(player, value, id)
    if IsInPopUpMode then return end

    if CurrentMenuMode ~= MenuModes.CommandBuild then
        CurrentMenuMode = MenuModes.CommandBuild
    else
        CurrentMenuMode = LastArmyMenu
    end

    RebuildUI()
end

function RebuildUI()
    local assets = {
        [1] = {
            name = "Rebel_Logo",
            url = "http://cloud-3.steamusercontent.com/ugc/1484450935820107474/9153AE81FAC0E9171EC6C754AC334A41C6D90FAC/"
        },
        [2] = {
            name = "Empire_Logo",
            url = "http://cloud-3.steamusercontent.com/ugc/1484450935820110357/6F4668FC2ED4C7F642D2A93E677C671C7CC4FA41/"
        },
        [3] = {
            name = "Mercenary_Logo",
            url = "http://cloud-3.steamusercontent.com/ugc/1484450935820110780/7E7AB1CA12F177EBF12089241A9D3778A89B8D95/"
        }
    }

    local menuColors = {
        MainBackground = "rgb(0.3,0.3,0.3)",
        ArmyBackground = {
            -- In case Mellow wants different colors LMAO
            Rebel = "rgb(0.3,0.3,0.3)",
            Imperial = "rgb(0.3,0.3,0.3)",
            Mercenary = "rgb(0.3,0.3,0.3)"
        }
    }

    local menuSize = {w = "1100", h = "700"} -- Original 1200x800

    local menuToDisplay = {
        {
            tag = "Defaults",
            attributes = {},
            children = {
                [1] = {
                    tag = "Text",
                    attributes = {
                        class = "Title",
                        alignment = "UpperCenter",
                        color = "White",
                        fontStyle = "Bold",
                        fontSize = "50",
                        outline = "Black",
                        outlineSize = "2 -2"
                    },
                    children = {}
                },
                [2] = {
                    tag = "Button",
                    attributes = {
                        class = "ArmyLogo",
                        colors = "rgb(0.7,0.7,0.7)|White|rgb(0.85,0.85,0.85)|rgba(0.5,0.5,0.5,0.5)",
                        preferredHeight = "350",
                        preferredWidth = "350",
                        flexibleHeight = "0",
                        flexibleWidth = "0"
                    },
                    children = {}
                },
                [3] = {
                    tag = "Text",
                    attributes = {
                        class = "ButtonText",
                        color = "White",
                        fontStyle = "Bold",
                        fontSize = "18",
                        outline = "Black",
                        outlineSize = "1 -1"
                    },
                    children = {}
                },
                [4] = {
                    tag = "Button",
                    attributes = {
                        class = "StandardButton",
                        colors = "rgba(0.7,0.7,0.7,0.7)|White|rgba(0.85,0.85,0.85,0.85)|rgba(0.5,0.5,0.5,0.5)"
                    },
                    children = {}
                },
                [5] = {
                    tag = "VerticalLayout",
                    attributes = {
                        class = "ArmyLogoLayout",
                        color = menuColors.MainBackground,
                        padding = "10 10 10 10",
                        childForceExpandHeight = "false",
                        childForceExpandWidth = "false",
                        childAlignment = "MiddleCenter"
                    }
                }
            }
        }
    }

    if CurrentMenuMode == MenuModes.Main then
        LastArmyMenu = 0

        menuToDisplay[2] = {
            tag = "Panel",
            attributes = {
                id = "MainMenu",
                color = menuColors.MainBackground,
                width = menuSize.w,
                height = menuSize.h,
                position = "0 0 -100"
            },
            children = {
                [1] = {
                    tag = "VerticalLayout",
                    attributes = {
                        id = "Menu_ArmySelect",
                        spacing = "10",
                        childForceExpandHeight = "false",
                        childAlignment = "MiddleCenter"
                    },
                    children = {
                        [1] = {
                            tag = "VerticalLayout",
                            attributes = {
                                color = menuColors.MainBackground,
                                preferredHeight = "150",
                                flexibleHeight = "0"
                            },
                            children = {
                                [1] = {
                                    tag = "Text",
                                    value = "Choose your Faction",
                                    attributes = {
                                        class = "Title",
                                        alignment = "LowerCenter"
                                    },
                                    children = {}
                                }
                            }
                        },
                        [2] = {
                            tag = "HorizontalLayout",
                            attributes = {
                                spacing = "10",
                                preferredHeight = "500",
                                flexibleHeight = "1"
                            },
                            children = {
                                [1] = {
                                    tag = "VerticalLayout",
                                    attributes = {class = "ArmyLogoLayout"},
                                    children = {
                                        [1] = {
                                            tag = "Panel",
                                            attributes = {
                                                color = "clear",
                                                flexibleWidth = "1",
                                                flexibleHeight = "0",
                                                preferredHeight = "85"
                                            },
                                            children = {}
                                        },
                                        [2] = {
                                            tag = "Button",
                                            attributes = {
                                                class = "ArmyLogo",
                                                image = "Rebel_Logo",
                                                onClick = "SetMenuMode" .. "(" ..
                                                    tostring(
                                                        MenuModes.RebelBuild) ..
                                                    ")"
                                            },
                                            children = {}
                                        },
                                        [3] = {
                                            tag = "Panel",
                                            attributes = {
                                                color = "clear",
                                                flexibleWidth = "1",
                                                flexibleHeight = "1"
                                            },
                                            children = {}
                                        }
                                    }
                                },
                                [2] = {
                                    tag = "VerticalLayout",
                                    attributes = {class = "ArmyLogoLayout"},
                                    children = {
                                        [1] = {
                                            tag = "Panel",
                                            attributes = {
                                                color = "clear",
                                                flexibleWidth = "1",
                                                flexibleHeight = "0",
                                                preferredHeight = "85"
                                            },
                                            children = {}
                                        },
                                        [2] = {
                                            tag = "Button",
                                            attributes = {
                                                class = "ArmyLogo",
                                                image = "Empire_Logo",
                                                onClick = "SetMenuMode" .. "(" ..
                                                    tostring(MenuModes.ImpBuild) ..
                                                    ")"
                                            },
                                            children = {}
                                        },
                                        [3] = {
                                            tag = "Panel",
                                            attributes = {
                                                color = "clear",
                                                flexibleWidth = "1",
                                                flexibleHeight = "1"
                                            },
                                            children = {}
                                        }
                                    }
                                },
                                [3] = {
                                    tag = "VerticalLayout",
                                    attributes = {class = "ArmyLogoLayout"},
                                    children = {
                                        [1] = {
                                            tag = "Panel",
                                            attributes = {
                                                color = "clear",
                                                flexibleWidth = "1",
                                                flexibleHeight = "0",
                                                preferredHeight = "85"
                                            },
                                            children = {}
                                        },
                                        [2] = {
                                            tag = "Button",
                                            attributes = {
                                                class = "ArmyLogo",
                                                image = "Mercenary_Logo",
                                                onClick = "SetMenuMode" .. "(" ..
                                                    tostring(MenuModes.MercBuild) ..
                                                    ")"
                                            },
                                            children = {}
                                        },
                                        [3] = {
                                            tag = "Panel",
                                            attributes = {
                                                color = "clear",
                                                flexibleWidth = "1",
                                                flexibleHeight = "1"
                                            },
                                            children = {}
                                        }
                                    }
                                }
                            }
                        }
                        --[[
                        [3] = {
                            tag = "Panel",
                            attributes = {
                                color = "clear",
                                preferredHeight = "600"
                            },
                            children = {}
                        }
                        --]]
                    }
                }
            }
        }
    elseif CurrentMenuMode == MenuModes.RebelBuild or CurrentMenuMode ==
        MenuModes.ImpBuild or CurrentMenuMode == MenuModes.MercBuild or
        CurrentMenuMode == MenuModes.CommandBuild then

        local armyTitle = "Joe Mama"
        local armyColor = "White"
        local armyCardsRef = nil
        local addCardFunction = "AddCard"
        local removeCardFunction = "RemoveCard"
        local cardPreviewFunction = "SetCardPreview"

        local Command_ArmyCardsText = "Command Cards"

        if CurrentMenuMode ~= MenuModes.CommandBuild then
            LastArmyMenu = CurrentMenuMode
        end

        if CurrentMenuMode == MenuModes.RebelBuild then
            armyTitle = "Rebel Army"
            armyColor = menuColors.ArmyBackground.Rebel
            armyCardsRef = Card_Database.Rebel
            addCardFunction = addCardFunction .. "Rebel"
            -- removeCardFunction = removeCardFunction .. "Rebel"
            cardPreviewFunction = cardPreviewFunction .. "Rebel"
            UpdateAssets(assets, ArmyEnum.Rebel)
        elseif CurrentMenuMode == MenuModes.ImpBuild then
            armyTitle = "Imperial Army"
            armyColor = menuColors.ArmyBackground.Imperial
            armyCardsRef = Card_Database.Imperial
            addCardFunction = addCardFunction .. "Imp"
            -- removeCardFunction = removeCardFunction .. "Imp"
            cardPreviewFunction = cardPreviewFunction .. "Imp"
            UpdateAssets(assets, ArmyEnum.Imperial)
        elseif CurrentMenuMode == MenuModes.MercBuild then
            armyTitle = "Mercenary Army"
            armyColor = menuColors.ArmyBackground.Mercenary
            armyCardsRef = Card_Database.Mercenary
            addCardFunction = addCardFunction .. "Merc"
            -- removeCardFunction = removeCardFunction .. "Merc"
            cardPreviewFunction = cardPreviewFunction .. "Merc"
            UpdateAssets(assets, ArmyEnum.Mercenary)
        elseif CurrentMenuMode == MenuModes.CommandBuild then
            armyTitle = "Command Cards"
            armyColor = menuColors.MainBackground
            armyCardsRef = Card_Database.Command
            -- addCardFunction = addCardFunction .. "Cmd"
            cardPreviewFunction = cardPreviewFunction .. "Cmd"
            UpdateAssets(assets, ArmyEnum.Command)

            Command_ArmyCardsText = "Army Cards"
        end

        menuToDisplay[2] = {
            tag = "Panel",
            attributes = {
                color = menuColors.MainBackground,
                width = menuSize.w,
                height = menuSize.h,
                position = "0 0 -100",
                padding = "10 10 10 10"
            },
            children = {
                [1] = {
                    tag = "HorizontalLayout",
                    attributes = {},
                    children = {
                        [1] = {
                            tag = "VerticalLayout",
                            attributes = {
                                spacing = "20",
                                padding = "10 10 10 10",
                                preferredWidth = menuSize.w / 2,
                                childForceExpandHeight = "false"
                            },
                            children = {
                                [1] = {
                                    tag = "Panel",
                                    attributes = {
                                        color = armyColor,
                                        padding = "10 10 10 10",
                                        flexibleHeight = "0",
                                        preferredHeight = "50"
                                    },
                                    children = {
                                        [1] = {
                                            tag = "Text",
                                            value = armyTitle,
                                            attributes = {
                                                class = "Title",
                                                alignment = "LowerCenter",
                                                fontSize = "26"
                                            },
                                            children = {}
                                        }
                                    }
                                },
                                [2] = {
                                    tag = "VerticalScrollView",
                                    attributes = {
                                        verticalScrollbarVisibility = "Permanent",
                                        preferredHeight = "400",
                                        flexibleHeight = "1",
                                        color = armyColor
                                    },
                                    children = {
                                        [1] = {
                                            tag = "VerticalLayout",
                                            attributes = {
                                                childForceExpandHeight = "false",
                                                spacing = "5",
                                                padding = "10 10 10 10"
                                            },
                                            children = {}
                                        }
                                    }
                                },
                                [3] = {
                                    tag = "HorizontalLayout",
                                    attributes = {
                                        spacing = "10",
                                        flexibleHeight = "0",
                                        preferredHeight = "50"
                                    },
                                    children = {
                                        [1] = {
                                            tag = "Button",
                                            attributes = {
                                                class = "StandardButton",
                                                onClick = "ToggleCmdCards"
                                            },
                                            children = {
                                                [1] = {
                                                    tag = "Text",
                                                    value = Command_ArmyCardsText,
                                                    attributes = {
                                                        class = "ButtonText"
                                                    },
                                                    children = {}
                                                }
                                            }
                                        },
                                        [2] = {
                                            tag = "Button",
                                            attributes = {
                                                class = "StandardButton",
                                                onClick = "SpawnArmy"
                                            },
                                            children = {
                                                [1] = {
                                                    tag = "Text",
                                                    value = "Spawn Army",
                                                    attributes = {
                                                        class = "ButtonText"
                                                    },
                                                    children = {}
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        [2] = {
                            tag = "VerticalLayout",
                            attributes = {
                                padding = "10 10 10 10",
                                spacing = "20",
                                preferredWidth = menuSize.w / 2,
                                childForceExpandHeight = "false"
                            },
                            children = {
                                [1] = {
                                    tag = "VerticalLayout",
                                    attributes = {
                                        flexibleHeight = "0",
                                        preferredHeight = "50"
                                    },
                                    children = {
                                        [1] = {
                                            tag = "HorizontalLayout",
                                            attributes = {
                                                flexibleHeight = "0",
                                                preferredHeight = "50"
                                            },
                                            children = {
                                                [1] = {
                                                    tag = "Text",
                                                    value = "99",
                                                    attributes = {
                                                        class = "ButtonText",
                                                        fontSize = "32",
                                                        tooltip = "Total card points",
                                                        tooltipPosition = "Above"
                                                    }
                                                },
                                                [2] = {
                                                    tag = "Button",
                                                    attributes = {
                                                        class = "StandardButton",
                                                        onClick = "ShowHideFilter",
                                                        preferredWidth = "250"
                                                    },
                                                    children = {
                                                        [1] = {
                                                            tag = "Text",
                                                            value = "Filters",
                                                            attributes = {
                                                                class = "ButtonText"
                                                            }
                                                        }
                                                    }
                                                },
                                                [3] = {
                                                    tag = "Button",
                                                    attributes = {
                                                        class = "StandardButton",
                                                        onClick = "SetMenuMode" ..
                                                            "(" ..
                                                            tostring(
                                                                MenuModes.Main) ..
                                                            ")"
                                                    },
                                                    children = {
                                                        [1] = {
                                                            tag = "Text",
                                                            value = "Back",
                                                            attributes = {
                                                                class = "ButtonText"
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                },
                                [2] = {
                                    tag = "VerticalScrollView",
                                    attributes = {
                                        verticalScrollbarVisibility = "Permanent",
                                        color = armyColor,
                                        flexibleHeight = "1"
                                    },
                                    children = {
                                        [1] = {
                                            tag = "VerticalLayout",
                                            attributes = {
                                                childForceExpandHeight = "false",
                                                spacing = "5",
                                                padding = "10 10 10 10"
                                            },
                                            children = {}
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        if armyCardsRef ~= nil then
            local scrollElements = menuToDisplay[2].children[1].children[1]
                                       .children[2].children[1].children -- Hardcoded uglyness

            local selectedElements = menuToDisplay[2].children[1].children[2]
                                         .children[2].children[1].children -- More hardcoded uglyness

            local cardCostElement = menuToDisplay[2].children[1].children[2]
                                        .children[1].children[1].children[1]
            local cardCost = 0

            local addCardDeploy = addCardFunction .. "Deploy"
            local addCardUpgrade = addCardFunction .. "Upgrade"
            local addCardCmd = addCardFunction .. "Cmd"

            local removeCardDeploy = removeCardFunction .. "Deploy"
            local removeCardUpgrade = removeCardFunction .. "Upgrade"
            local removeCardCmd = removeCardFunction .. "Cmd"

            local cardPreviewDeploy = cardPreviewFunction .. "Deploy"
            local cardPreviewUpgrade = cardPreviewFunction .. "Upgrade"

            if armyCardsRef.Deployment ~= nil then
                table.insert(scrollElements, {
                    tag = "Text",
                    value = "[Deployment Cards]",
                    attributes = {
                        class = "ButtonText",
                        alignment = "MiddleLeft"
                    }
                })

                for i, v in ipairs(armyCardsRef.Deployment) do
                    if CurrentFilterValue == 0 or
                        bit32.btest(CurrentFilterValue, v.traits) then
                        table.insert(scrollElements, {
                            tag = "HorizontalLayout",
                            attributes = {
                                spacing = "10",
                                preferredHeight = "40",
                                flexibleHeight = "0"
                            },
                            children = {
                                [1] = {
                                    tag = "Panel",
                                    attributes = {
                                        -- onMouseEnter = cardPreviewDeploy .. "(" .. tostring(i) .. ")",
                                        onMouseDown = cardPreviewDeploy .. "(" ..
                                            tostring(i) .. ")",
                                        onMouseUp = "ClearCardPreview",
                                        color = "clear", -- menuColors.MainBackground,
                                        padding = "5 5 5 5",
                                        preferredWidth = "300"
                                    },
                                    children = {
                                        [1] = {
                                            tag = "Text",
                                            value = "- " .. v.name,
                                            attributes = {
                                                class = "ButtonText",
                                                alignment = "MiddleLeft"
                                            }
                                        }
                                    }
                                },
                                [2] = {
                                    tag = "Panel",
                                    attributes = {
                                        color = "clear", -- menuColors.MainBackground,
                                        padding = "5 5 5 5"
                                    },
                                    children = {
                                        [1] = {
                                            tag = "Button",
                                            attributes = {
                                                class = "StandardButton",
                                                onClick = addCardDeploy .. "(" ..
                                                    tostring(i) .. ")"
                                            },
                                            children = {
                                                [1] = {
                                                    tag = "Text",
                                                    value = "+",
                                                    attributes = {
                                                        class = "ButtonText"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                --[[
                            [3] = {
                                tag = "Panel",
                                attributes = {
                                    color = "clear", -- menuColors.MainBackground,
                                    padding = "5 5 5 5"
                                },
                                children = {
                                    [1] = {
                                        tag = "Button",
                                        attributes = {
                                            class = "StandardButton",
                                            onClick = removeCardDeploy .. "(" ..
                                                tostring(i) .. ")"
                                        },
                                        children = {
                                            [1] = {
                                                tag = "Text",
                                                value = "-",
                                                attributes = {class = "ButtonText"}
                                            }
                                        }
                                    }
                                }
                            }
                            --]]
                            }
                        })
                    end
                end

                table.insert(scrollElements, {
                    tag = "Text",
                    attributes = {
                        class = "ButtonText",
                        alignment = "MiddleLeft"
                    }
                })
            end

            if armyCardsRef.Upgrades ~= nil then
                table.insert(scrollElements, {
                    tag = "Text",
                    value = "[Skirmish Upgrades]",
                    attributes = {
                        class = "ButtonText",
                        alignment = "MiddleLeft"
                    }
                })

                for i, v in ipairs(armyCardsRef.Upgrades) do
                    table.insert(scrollElements, {
                        tag = "HorizontalLayout",
                        attributes = {
                            spacing = "10",
                            preferredHeight = "40",
                            flexibleHeight = "0"
                        },
                        children = {
                            [1] = {
                                tag = "Panel",
                                attributes = {
                                    -- onMouseEnter = cardPreviewUpgrade .. "(" .. tostring(i) .. ")",
                                    onMouseDown = cardPreviewUpgrade .. "(" ..
                                        tostring(i) .. ")",
                                    onMouseUp = "ClearCardPreview",
                                    color = "clear", -- menuColors.MainBackground,
                                    padding = "5 5 5 5",
                                    preferredWidth = "300"
                                },
                                children = {
                                    [1] = {
                                        tag = "Text",
                                        value = "- " .. v.name,
                                        attributes = {
                                            class = "ButtonText",
                                            alignment = "MiddleLeft"
                                        }
                                    }
                                }
                            },
                            [2] = {
                                tag = "Panel",
                                attributes = {
                                    color = "clear", -- menuColors.MainBackground,
                                    padding = "5 5 5 5"
                                },
                                children = {
                                    [1] = {
                                        tag = "Button",
                                        attributes = {
                                            class = "StandardButton",
                                            onClick = addCardUpgrade .. "(" ..
                                                tostring(i) .. ")"
                                        },
                                        children = {
                                            [1] = {
                                                tag = "Text",
                                                value = "+",
                                                attributes = {
                                                    class = "ButtonText"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            --[[
                        [3] = {
                            tag = "Panel",
                            attributes = {
                                color = "clear", -- menuColors.MainBackground,
                                padding = "5 5 5 5"
                            },
                            children = {
                                [1] = {
                                    tag = "Button",
                                    attributes = {
                                        class = "StandardButton",
                                        onClick = removeCardUpgrade .. "(" ..
                                            tostring(i) .. ")"
                                    },
                                    children = {
                                        [1] = {
                                            tag = "Text",
                                            value = "-",
                                            attributes = {class = "ButtonText"}
                                        }
                                    }
                                }
                            }
                        }
                        --]]
                        }
                    })
                end
            end

            if armyCardsRef.Cards ~= nil then -- Command cards
                table.insert(scrollElements, {
                    tag = "Text",
                    value = "[Cards]",
                    attributes = {
                        class = "ButtonText",
                        alignment = "MiddleLeft"
                    }
                })

                for i, v in ipairs(armyCardsRef.Cards) do
                    if CurrentFilterValue == 0 or
                        bit32.btest(CurrentFilterValue, v.traits) then
                        table.insert(scrollElements, {
                            tag = "HorizontalLayout",
                            attributes = {
                                spacing = "10",
                                preferredHeight = "40",
                                flexibleHeight = "0"
                            },
                            children = {
                                [1] = {
                                    tag = "Panel",
                                    attributes = {
                                        -- onMouseEnter = cardPreviewUpgrade .. "(" .. tostring(i) .. ")",
                                        onMouseDown = cardPreviewFunction .. "(" ..
                                            tostring(i) .. ")",
                                        onMouseUp = "ClearCardPreview",
                                        color = "clear", -- menuColors.MainBackground,
                                        padding = "5 5 5 5",
                                        preferredWidth = "300"
                                    },
                                    children = {
                                        [1] = {
                                            tag = "Text",
                                            value = "- " .. v.name,
                                            attributes = {
                                                class = "ButtonText",
                                                alignment = "MiddleLeft"
                                            }
                                        }
                                    }
                                },
                                [2] = {
                                    tag = "Panel",
                                    attributes = {
                                        color = "clear", -- menuColors.MainBackground,
                                        padding = "5 5 5 5"
                                    },
                                    children = {
                                        [1] = {
                                            tag = "Button",
                                            attributes = {
                                                class = "StandardButton",
                                                onClick = addCardCmd .. "(" ..
                                                    tostring(i) .. ")"
                                            },
                                            children = {
                                                [1] = {
                                                    tag = "Text",
                                                    value = "+",
                                                    attributes = {
                                                        class = "ButtonText"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        })
                    end
                end
            end

            if #SelectedDeploymentCards > 0 then
                table.insert(selectedElements, {
                    tag = "Text",
                    value = "[Selected Deployment Cards]",
                    attributes = {
                        class = "ButtonText",
                        alignment = "MiddleLeft"
                    }
                })

                for i, v in ipairs(SelectedDeploymentCards) do
                    table.insert(selectedElements, {
                        tag = "HorizontalLayout",
                        attributes = {
                            preferredHeight = "30",
                            flexibleHeight = "0"
                        },
                        children = {
                            [1] = {
                                tag = "Text",
                                value = v.name .. " x" .. tostring(v.amount) ..
                                    (v.isGroup and
                                        ("/" .. "Units: " .. v.unitAmount) or ""),
                                attributes = {
                                    class = "ButtonText",
                                    alignment = "MiddleLeft",
                                    preferredWidth = "300",
                                    flexibleHeight = "0"
                                }
                            },
                            [2] = {
                                tag = "Panel",
                                attributes = {
                                    color = "clear", -- menuColors.MainBackground,
                                    padding = "5 5 5 5",
                                    flexibleHeight = "1"
                                },
                                children = {
                                    [1] = {
                                        tag = "Button",
                                        attributes = {
                                            class = "StandardButton",
                                            onClick = removeCardDeploy .. "(" ..
                                                tostring(v.cardNum) .. "-" ..
                                                tostring(i) .. ")"
                                        },
                                        children = {
                                            [1] = {
                                                tag = "Text",
                                                value = "-",
                                                attributes = {
                                                    class = "ButtonText"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    })

                    cardCost = cardCost + (v.amount * v.cost * v.unitAmount)
                end

                table.insert(selectedElements, {
                    tag = "Text",
                    value = "",
                    attributes = {class = "ButtonText"}
                })
            end

            if #SelectedUpgradeCards > 0 then
                table.insert(selectedElements, {
                    tag = "Text",
                    value = "[Selected Upgrade Cards]",
                    attributes = {
                        class = "ButtonText",
                        alignment = "MiddleLeft"
                    }
                })

                for i, v in ipairs(SelectedUpgradeCards) do
                    table.insert(selectedElements, {
                        tag = "HorizontalLayout",
                        attributes = {
                            preferredHeight = "30",
                            flexibleHeight = "0"
                        },
                        children = {
                            [1] = {
                                tag = "Text",
                                value = v.name .. " x" .. tostring(v.amount),
                                attributes = {
                                    class = "ButtonText",
                                    alignment = "MiddleLeft",
                                    preferredWidth = "300",
                                    flexibleHeight = "0"
                                }
                            },
                            [2] = {
                                tag = "Panel",
                                attributes = {
                                    color = "clear", -- menuColors.MainBackground,
                                    padding = "5 5 5 5",
                                    flexibleHeight = "1"
                                },
                                children = {
                                    [1] = {
                                        tag = "Button",
                                        attributes = {
                                            class = "StandardButton",
                                            onClick = removeCardUpgrade .. "(" ..
                                                tostring(v.cardNum) .. "-" ..
                                                tostring(i) .. ")"
                                        },
                                        children = {
                                            [1] = {
                                                tag = "Text",
                                                value = "-",
                                                attributes = {
                                                    class = "ButtonText"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    })

                    cardCost = cardCost + (v.amount * v.cost)
                end

                table.insert(selectedElements, {
                    tag = "Text",
                    value = "",
                    attributes = {class = "ButtonText"}
                })
            end

            if #SelectedCommandCards > 0 then
                table.insert(selectedElements, {
                    tag = "Text",
                    value = "[Selected Command Cards]",
                    attributes = {
                        class = "ButtonText",
                        alignment = "MiddleLeft"
                    }
                })

                for i, v in ipairs(SelectedCommandCards) do
                    table.insert(selectedElements, {
                        tag = "HorizontalLayout",
                        attributes = {
                            preferredHeight = "30",
                            flexibleHeight = "0"
                        },
                        children = {
                            [1] = {
                                tag = "Text",
                                value = v.name .. " x" .. tostring(v.amount),
                                attributes = {
                                    class = "ButtonText",
                                    alignment = "MiddleLeft",
                                    preferredWidth = "300",
                                    flexibleHeight = "0"
                                }
                            },
                            [2] = {
                                tag = "Panel",
                                attributes = {
                                    color = "clear", -- menuColors.MainBackground,
                                    padding = "5 5 5 5",
                                    flexibleHeight = "1"
                                },
                                children = {
                                    [1] = {
                                        tag = "Button",
                                        attributes = {
                                            class = "StandardButton",
                                            onClick = removeCardCmd .. "(" ..
                                                tostring(v.cardNum) .. "-" ..
                                                tostring(i) .. ")"
                                        },
                                        children = {
                                            [1] = {
                                                tag = "Text",
                                                value = "-",
                                                attributes = {
                                                    class = "ButtonText"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    })

                    cardCost = cardCost + (v.amount * v.cost)
                end
            end

            cardCostElement.value = tostring(cardCost)
            if tonumber(cardCostElement.value) > 40 then
                cardCostElement.attributes["color"] = "Red"
            end
        end
    end

    -- self.UI.setCustomAssets(assets)
    self.UI.setXmlTable(menuToDisplay)
end

function onLoad(save_state)
    print("---------------")

    RebuildUI()
end
