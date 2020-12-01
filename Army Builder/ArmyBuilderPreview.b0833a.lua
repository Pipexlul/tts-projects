local SelectedPreview = nil

function SetPreviewCard(params)
    SelectedPreview = params[1]

    RebuildUI()
end

function ClearCardPreview()
    SelectedPreview = nil

    RebuildUI()
end

function SetUiAssets(params) self.UI.setCustomAssets(params[1]) end

function RebuildUI()
    local menuToDisplay = {{}}

    if SelectedPreview ~= nil then
        menuToDisplay[1] = {
            tag = "Panel",
            attributes = {
                width = "600",
                height = "600",
                position = "0 0 -100",
                padding = "10 10 10 10"
            },
            children = {
                [1] = {
                    tag = "Image",
                    attributes = {
                        image = SelectedPreview,
                        preserveAspect = "true"
                    }
                }
            }
        }
    end

    self.UI.setXmlTable(menuToDisplay)
end