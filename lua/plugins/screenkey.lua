return {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*", -- or branch = "main", to use the latest commit
    config = function()
        require("screenkey").setup({
            filter = function(keys)
                local screenkey = require("screenkey")
                for i, k in ipairs(keys) do
                    if k.key == "%" then
                        keys[i].key = "%%"
                    end
                end
                return keys
            end
        })
    end
}
