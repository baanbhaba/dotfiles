local M = {}

local vault = "/run/media/" .. vim.env.USER .. "/External/6. Common/workspaces"


function M.new()

    vim.ui.input({
        prompt = "TODO: ",
    }, function(task)

        if not task or task == "" then
            return
        end


        local todo_dir = vault .. "/todo"

        vim.fn.mkdir(todo_dir, "p")


        local today = os.date("%Y-%m-%d")

        local file = todo_dir .. "/" .. today .. ".md"


        local f = io.open(file, "a")


        if f then

            f:write(
                "- [ ] " ..
                task ..
                " 📅 " ..
                today ..
                "\n"
            )

            f:close()

        end


        vim.cmd("edit " .. file)

    end)

end


return M
