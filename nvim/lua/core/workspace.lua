local M = {}

local vault = "/run/media/" .. vim.env.USER .. "/External/6. Common/workspaces"


local function get_root()

    local dirs = {}
    local notes = 0

    local handle = vim.loop.fs_scandir(vault)

    if handle then
        while true do
            local name, type = vim.loop.fs_scandir_next(handle)

            if not name then
                break
            end

            if not name:match("^%.") and name ~= ".Trash-1000" then

                if type == "directory" then
                    table.insert(dirs, name)

                elseif name:match("%.md$") then
                    notes = notes + 1
                end
            end
        end
    end

    table.sort(dirs)

    return dirs, notes
end



function M.open()

    vim.cmd("enew")

    local buf = vim.api.nvim_get_current_buf()

    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].modifiable = true


    local dirs, notes = get_root()


    local lines = {

        "",
        "",
        "              ◈ WORKSPACES ◈",
        "",
        "        Your personal knowledge system",
        "",
        "",
        "  ┌──────────── STATUS ────────────┐",
        "",
        "      Notes      : " .. notes,
        "      Projects   : " .. #dirs,
        "",
        "  └────────────────────────────────┘",
        "",
        "",
        "   PROJECTS",
        "  ─────────────────",
    }


    for _, dir in ipairs(dirs) do
        table.insert(
            lines,
            "      " .. dir .. "/"
        )
    end


    table.insert(lines,"")
    table.insert(lines,"")
    table.insert(lines,"   COMMANDS")
    table.insert(lines,"  ─────────────────")
    table.insert(lines,"     <CR> open project")
    table.insert(lines,"     e    explorer")
    table.insert(lines,"     s    search")
    table.insert(lines,"     n    new note")


    vim.api.nvim_buf_set_lines(
        buf,
        0,
        -1,
        false,
        lines
    )


    vim.bo[buf].modifiable = false



    vim.keymap.set(
        "n",
        "<CR>",
        function()

            local line = vim.api.nvim_get_current_line()

            local folder = line:match(" (.+)/")

            if folder then

                require("neo-tree.command").execute({
                    action = "show",
                    source = "filesystem",
                    position = "left",
                    dir = vault .. "/" .. folder,
                })

            end

        end,
        {
            buffer = buf,
            silent = true,
        }
    )


    vim.keymap.set(
        "n",
        "e",
        "<cmd>Neotree toggle<CR>",
        {
            buffer = buf,
            silent = true,
        }
    )


    vim.keymap.set(
        "n",
        "s",
        "<cmd>Telescope live_grep<CR>",
        {
            buffer = buf,
            silent = true,
        }
    )


    vim.keymap.set(
        "n",
        "t",
        function()
            require("core.todo").new()
        end,
        {
            buffer = buf,
            silent = true,
        }
    )


    vim.keymap.set(
        "n",
        "n",
        function()

            vim.ui.input(
                {
                    prompt = "Note name: ",
                },
                function(input)

                    if not input or input == "" then
                        return
                    end

                    local filename = input:gsub("%s+", "-") .. ".md"

                    local path = vault .. "/quick/" .. filename

                    local file = io.open(path, "w")

                    if file then

                        file:write(
                            "# " .. input .. "\n\n" ..
                            "Created: " ..
                            os.date("%Y-%m-%d") ..
                            "\n\n"
                        )

                        file:close()

                    end

                    vim.cmd("edit " .. path)

                end
            )

        end,
        {
            buffer = buf,
            silent = true,
        }
    )

end


return M
