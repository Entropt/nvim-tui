# Minimal Neovim Config 
A keyboard-driven, minimal-UI Neovim configuration built for speed and large codebase reviews. It mimics a lean workflow by ditching traditional file trees, heavy UI elements, and redundant plugins in favor of native lists, Harpoon, Telescope, and Neovim's built-in features.

## Philosophy & Zero-Bloat Guarantee
This configuration has been rigorously audited to remove *all* redundant default Neovim settings and unnecessary plugins. 
* **Native Snippets**: We stripped out bulky snippet plugins (`LuaSnip`, `friendly-snippets`) and rely entirely on Neovim v0.10+'s native `vim.snippet` engine.
* **Native Defaults**: We don't force settings like `incsearch`, `termguicolors`, or `backup=false` because modern Neovim handles these out of the box. What you see in `set.lua` is strictly what departs from the default behavior.

## Prerequisites
Before installing, ensure you have the following dependencies on your system:
- **Neovim** (v0.10.0 or higher) - *Required for the native `vim.snippet` engine and built-in defaults.*
- **Git**
- **C Compiler** (e.g., `gcc` or `clang` for Treesitter)
- **Make** (Required for compiling Telescope's `fzf-native` fast sorter)
- **ripgrep** (`rg`) (Required for Telescope's blazing-fast text searching)

## Installation
1. Backup your existing Neovim configuration (if you have one):
```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```
2. Clone this repository into your Neovim config directory:
```bash
git clone https://github.com/Entropt/nvim-tui ~/.config/nvim
```
3. Start Neovim:
```bash
nvim
```
- Note: On first launch, `lazy.nvim` will automatically bootstrap itself and install all the plugins cleanly and quietly.
4. Crucial Setup Step: Once the plugins finish downloading, ensure your Treesitter parsers are compiled and up to date to prevent buffer errors:
```      
:TSUpdate
```

### Core Workflow & Keybindings

My `<leader>` key is mapped to Space.

#### File Navigation (Anti-File-Tree)
- `<leader>pv` : Open the native file explorer (netrw) with relative line numbers.
- `<leader>pf` : Fuzzy find project files (Telescope with top-prompt and FZF native sorting).
- `<C-p>` : Fuzzy find Git-tracked files (Telescope).

#### The Harpoon Workflow
Used for instantly jumping between your 4-5 active development files without searching.
- `<leader>a` : Append current file to Harpoon list.
- `<C-e>` : View the Harpoon quick menu.
- `<C-h>`, `<C-t>`, `<C-n>`, `<C-s>` : Instantly jump to Harpoon file 1, 2, 3, or 4.

#### Global Search & Code Review (Quickfix List)
Designed for auditing large codebases using native Vim quickfix lists instead of heavy UI sidebars.
- `<leader>ps` : Search for text/strings across the entire project (Grep).
- In Telescope: Press `<C-q>` to send all search results directly to your Quickfix list.
- `<C-j>` / `<C-k>` : Jump to the Next/Previous item in the Quickfix list (cursor stays centered).

#### Autocompletion (VSCode-like Dropdowns)
Powered entirely by `nvim-cmp` and the blazing-fast native Neovim v0.10+ `vim.snippet` module (No LuaSnip bloat).
When typing, a minimal text dropdown will appear for variables, snippets, and LSP suggestions:
- `<C-n>` : Select Next item in the dropdown.
- `<C-p>` : Select Previous item in the dropdown.
- `<C-Space>` : Force open the completion menu if closed.

#### LSP, Languages & Reading Source Code
Out of the box, this setup auto-installs servers for C/C++ (`clangd`), Python, TypeScript, Rust, Go, and Lua. 
- `gd` : Go to definition.
- `<C-o>` : Jump back to where you were before gd.
- `K` : Hover documentation (pure text). Double-tap K to jump your cursor inside the hover window to scroll through source code, press q to exit.
- `<leader>vws` : Search for a workspace symbol / function name globally.
- `<leader>vd` : View diagnostic/error information.

**How to add new languages (No config needed):**
1. Type `:Mason` to open the package manager.
2. Press `/` to search for your language (e.g., `java` or `html`).
3. Press `i` to install the language server. Neovim will automatically hook it up to your autocompletion engine!

#### Movement
- `<C-d>` / `<C-u>` : Jump down/up half a page (cursor stays perfectly centered).
- `J` / `K` (in Visual mode) : Move highlighted blocks of code up and down.
- `<leader>p` (in Visual mode) : Paste over highlighted text without losing your current paste buffer.
