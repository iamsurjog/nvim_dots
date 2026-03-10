# Neovim Configuration

My neovim config

## Features

- **Plugin Management**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast plugin loading
- **LSP Support**: nvim-lspconfig with automatic server installation via mason.nvim
  - Lua, Python, TypeScript, HTML, CSS, ESLint, TailwindCSS, Markdown, C/C++, QML
- **Completions**: [Blink.cmp](https://github.com/saghen/blink.cmp) with Super Tab keybindings
- **Fuzzy Finding**: [Snacks Picker](https://github.com/snacks.lua/snacks.nvim) for files and live grep
- **File Navigation**: 
  - [Harpoon](https://github.com/ThePrimeagen/harpoon) for quick file marking
  - [Oil](https://github.com/stevearc/oil.nvim) for file browser
  - [Snipe](https://github.com/leath-dub/snipe.nvim) for buffer/tab switching
- **UI Enhancements**:
  - [Snacks](https://github.com//snacks.lua/snacks.nvim) for dashboard, notifications, terminal
  - [Noice](https://github.com/folke/noice.nvim) for improved UI/messages
  - [Staline](https://github.com/tamton-aquib/staline.nvim) statusline
  - [Rose Pine](https://github.com/rose-pine/neovim) colorscheme
- **Git Integration**: [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) for git decorations
- **Diagnostics**: [Trouble](https://github.com/folke/trouble.nvim) for LSP diagnostics view
- **Code Actions**: [Tiny Code Action](https://github.com/wojciech-kulik/tiny-code-action.nvim)
- **Formatting**: [Conform](https://github.com/stevearc/conform.nvim) with auto-format on save
- **Linting**: [nvim-lint](https://github.com/mfussenegger/nvim-lint) for async linting
- **Treesitter**: [Nvim Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting
- **Folding**: [UFO](https://github.com/kevinhwang91/nvim-ufo) for better folding
- **Comments**: [TS Comments](https://github.com/folke/todo-comments.nvim) and [Comment](https://github.com/numToStr/Comment.nvim)
- **Search**: [Flash](https://github.com/folke/flash.nvim) for enhanced search
- **Utilities**:
  - [Undotree](https://github.com/mbbill/undotree) for undo history
  - [Todo Comments](https://github.com/folke/todo-comments.nvim) for task tracking
  - [Markview](https://github.com/OXY2DEV/markview.nvim) for Markdown preview

## Requirements

- Neovim 0.10+
- Git
- Node.js (for TypeScript/HTML/CSS formatters)
- Python (for pylint, black)
- GCC/Clang (for Treesitter compilation)

## Installation

1. Backup existing config:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/nvim-config ~/.config/nvim
   ```

3. Open Neovim and let Lazy.nvim install plugins:
   ```bash
   nvim
   ```

4. Install LSP servers (optional - auto-installed on first use):
   ```bash
   :Mason
   ```

## Keybindings

some of the basic keybindings

| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `-` | Open parent directory (Oil) |
| `<Leader>ff` | Find files |
| `<Leader>fg` | Live grep |
| `<Leader><Leader>` | Recent files |
| `<Leader>h` | Remove search highlight |
| `<C-s>` | Save file |
| `<C-F1>` | Open dashboard |
| `<C-\>` | Toggle hardtime |
| `<F2>` | Rename (LSP) |
| `<F3>` | Format code (Conform) |
| `<F4>` | Code actions (LSP) |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Find references |
| `K` | Hover documentation |
| `gs` | Signature help |

## Configuration

### Editor Options

- Line numbers enabled
- Relative line numbers enabled
- Expand tabs (4 spaces)
- Undo files enabled
- Swap files disabled
- Light background

### LSP Servers

Install additional language servers via Mason:
```vim
:Mason
```

### Formatters

Formatters are not automatically applied on save. Manual format with `<F3>`.

## Plugins

See `lua/plugins/` directory for individual plugin configurations.

## Plugin List

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [blink.cmp](https://github.com/saghen/blink.cmp) - Completion engine
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP client
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP server installer
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Mason + LSP config bridge
- [conform.nvim](https://github.com/stevearc/conform.nvim) - Formatter
- [nvim-lint](https://github.com/mfussenegger/nvim-lint) - Linter
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git decorations
- [trouble.nvim](https://github.com/folke/trouble.nvim) - Diagnostics view
- [snacks.nvim](https://github.com/snacks.lua/snacks.nvim) - Dashboard, notifications, terminal
- [noice.nvim](https://github.com/folke/noice.nvim) - Improved UI/messages
- [staline.nvim](https://github.com/tamton-aquib/staline.nvim) - Statusline
- [rose-pine](https://github.com/rose-pine/neovim) - Colorscheme
- [harpoon](https://github.com/ThePrimeagen/harpoon) - Quick file marking
- [oil.nvim](https://github.com/stevearc/oil.nvim) - File browser
- [snipe.nvim](https://github.com/leath-dub/snipe.nvim) - Buffer/tab switching
- [flash.nvim](https://github.com/folke/flash.nvim) - Enhanced search
- [tiny-code-action.nvim](https://github.com/wojciech-kulik/tiny-code-action.nvim) - Code actions
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - Better folding
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Commenting
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - Task tracking
- [ts-comments.nvim](https://github.com/folke/ts-comments.nvim) - Treesitter-powered comments
- [undotree](https://github.com/mbbill/undotree) - Undo history
- [markview.nvim](https://github.com/OXY2DEV/markview.nvim) - Markdown preview
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Keybinding helper
- [mini.nvim](https://github.com/echasnovski/mini.nvim) - Mini plugins collection
- [otter.nvim](https://github.com/jmbuhr/otter.nvim) - Language server for AI
- [diagnostics.nvim](https://github:///Homebrew/neovim/blob/master/contrib/diagnostics.nvim) - Diagnostics
- [live-server.nvim](https://github.com/iamcco/live-server.nvim) - Live server
- [cook.nvim](https://github.com/usernamehw/cook.nvim) - TODO plugin
- [colorschemes.lua](https://github.com/rose-pine/neovim) - Theme configuration
