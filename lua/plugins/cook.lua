return{
    "07CalC/cook.nvim",
    cmd = "Cook",
    config = function()
        require("cook").setup({
            runners = {
                py = "python3 %s",
                c = "gcc %s -o %s && %s",
                cpp = "g++ %s -o %s && ./%s",
                rs = "cargo run",
                js = "bun %s",
                ts = "bun %s",
                go = "go run %s",
                sh = "bash %s",
                java = "java_run.sh %s",
                l = "flex %s && gcc lex.yy.c && ./a.out"
                -- l = "echo \'gcc %s -o %s && ./%s\'",
            }
        })
        vim.keymap.set('n', '<F8>', ':Cook<CR>')
    end,
}

