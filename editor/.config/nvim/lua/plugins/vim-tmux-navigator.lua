local add, later = MiniDeps.add, MiniDeps.later

add { source = "christoomey/vim-tmux-navigator" }

later(function()
    local nmap = function(keymap, command, desc)
        if desc then
            desc = "Tmux: " .. desc
        end

        vim.keymap.set("n", keymap, command, { desc = desc })
    end

    nmap("<c-h>", "<cmd>TmuxNavigateLeft<cr>", "Navigate Left")
    nmap("<c-j>", "<cmd>TmuxNavigateDown<cr>", "Navigate Down")
    nmap("<c-k>", "<cmd>TmuxNavigateUp<cr>", "Navigate Up")
    nmap("<c-l>", "<cmd>TmuxNavigateRight<cr>", "Navigate Right")
    nmap("<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", "Navigate Previous")
end)
