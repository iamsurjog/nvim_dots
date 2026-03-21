return {
    "07CalC/cook.nvim",
    lazy = false,
    cmd = "Cook",
    config = function()
        require("cook").setup({
            runners = {
                py = "python3 {file}",
                c = "gcc {file} -o {exe} -Wall && {exe}",
                cpp = "g++ {file} -o {exe} -std=c++17 && {exe}",
                rust = "rustc {file} -o {exe} && {exe}",
                -- go = "go build -o {exe} {file} && {exe}",
                go = "go run .",
                sh = "bash {file}",
                java = "javac {file} && java -cp {dir} {name}",
                l = "flex {file} && gcc lex.yy.c && ./a.out"
                -- l = "echo \'gcc %s -o %s && ./%s\'",
            }
        })
        vim.keymap.set('n', '<F8>', ':Cook<CR>')
    end,
}
