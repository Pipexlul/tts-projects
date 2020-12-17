function onCollisionEnter(col_info)
    local obj = col_info.collision_object

    local data = obj.getCustomObject()

    print(obj.getName())
    for k, v in pairs(data) do
        if k == "mesh" or k == "diffuse" or k == "collider" then
            print(string.format("%s = \"%s\",", k, tostring(v)))
        end
    end
end