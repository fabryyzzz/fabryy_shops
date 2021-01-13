Config = {}
Config.Negozi = {
    ['ventiquattrosette'] = {
        ["pos"] = vector3(-39.18, -1253.28, 29.27), -- the position of your shop
        ["job"] = {['use'] = false, ['grade'] = 0, ['jobname'] = 'unicorn', ["society"] = true, ["job2"] = false}, --  use the shop? If "true", you set the minimum grade and the name of the job that have the access to the shop. Use the society money? Use job2?
        ["items"] = {
            ["bread"] = {['item'] = "bread", ["price"] = 50, ["label"] = "Pane - 50$"}
        },
        ["blip"] = {["use"] = false, ["sprite"] = 12, ["colour"] = 2, ["size"] = 1.0, ["label"] = "24/7"},
        ["marker"] = {["type"] = 29, ["rgba"] = {["r"] = 255, ["g"] = 255, ["b"] =  255, ["a"] =  150}, ["size"] = {["x"] = 1.2, ["y"] =  1.2, ["z"] = 1.2}}
    },
}