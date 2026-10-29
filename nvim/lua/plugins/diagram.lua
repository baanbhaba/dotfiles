return {
    {
        "3rd/image.nvim",
        build = false,
        opts = {
            backend = "kitty",
            processor = "magick_cli",
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = true,
                    download_remote_images = true,
                    only_render_image_at_cursor = false,
                    filetypes = { "markdown", "vimwiki" },
                },
            },
            max_width = 120,
            max_height = 30,
            max_width_window_percentage = math.huge,
            max_height_window_percentage = 50,
            window_overlap_clear_enabled = false,
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
            editor_only_render_when_focused = false,
            tmux_show_only_in_active_window = false,
            hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
        },
    },
    {
        "3rd/diagram.nvim",
        dependencies = {
            "3rd/image.nvim",
        },
        config = function()
            local diagram = require("diagram")
            local integrations = require("diagram.integrations")

            diagram.setup({
                integrations = {
                    integrations.markdown,
                    integrations.neorg,
                },
                events = {
                    render_buffer = { "InsertLeave", "BufWinEnter", "BufReadPost", "TextChanged" },
                    clear_buffer = { "InsertEnter", "BufLeave" },
                },
                renderer_options = {
                    mermaid = {
                        background = "transparent",
                        theme = "dark",
                        scale = 1,
                    },
                },
            })

            -- Ensure diagrams are rendered when a markdown file is loaded or focused
            vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
                pattern = "markdown",
                callback = function(ev)
                    vim.defer_fn(function()
                        if vim.api.nvim_buf_is_valid(ev.buf) and vim.bo[ev.buf].filetype == "markdown" then
                            pcall(diagram.render)
                        end
                    end, 150)
                end,
            })

            -- User commands for manual control and diagnostics
            vim.api.nvim_create_user_command("DiagramRender", function()
                diagram.render()
            end, { desc = "Render diagrams in current buffer" })

            vim.api.nvim_create_user_command("DiagramClear", function()
                diagram.clear()
            end, { desc = "Clear diagrams in current buffer" })

            vim.api.nvim_create_user_command("DiagramHover", function()
                diagram.show_diagram_hover()
            end, { desc = "Show diagram in floating window / new tab" })

            -- Keymaps: <leader>dr (render), <leader>dc (clear), <leader>dh (hover)
            vim.keymap.set("n", "<leader>dr", "<cmd>DiagramRender<CR>", { desc = "Render diagram" })
            vim.keymap.set("n", "<leader>dc", "<cmd>DiagramClear<CR>", { desc = "Clear diagram" })
            vim.keymap.set("n", "<leader>dh", function()
                diagram.show_diagram_hover()
            end, { desc = "Diagram hover preview" })
        end,
    },
}
