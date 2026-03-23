# Minimal Neovim Config 
A keyboard-driven, minimal-UI Neovim configuration built for speed and large codebase reviews. It mimics minimal workflow by ditching traditional file trees and heavy UI elements in favor of native lists, Harpoon, and Telescope.

## Prerequisites
Before installing, ensure you have the following dependencies on your system:
- **Neovim** (v0.9.0 or higher)
- **Git**
- **C Compiler** (e.g., `gcc` or `clang` for Treesitter)
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
- Note: On first launch, lazy.nvim will automatically bootstrap itself and install all the plugins. The UI is configured to be minimal text.
4. Crucial Setup Step: Once the plugins finish downloading, ensure your Treesitter parsers are compiled and up to date to prevent buffer errors:
```      
:TSUpdate
```

### Core Workflow & Keybindings

My `<leader>` key is mapped to Space.

File Navigation (Anti-File-Tree)
- `<leader>pv` : Open the native file explorer (netrw) with relative line numbers.
- `<leader>pf` : Fuzzy find project files (Telescope).
- `<C-p>` : Fuzzy find Git-tracked files (Telescope).

The Harpoon Workflow

Used for instantly jumping between your 4-5 active development files without searching.
- `<leader>a` : Append current file to Harpoon list.
- `<C-e>` : View the Harpoon quick menu.
- `<C-h>`, `<C-t>`, `<C-n>`, `<C-s>` : Instantly jump to Harpoon file 1, 2, 3, or 4.

Global Search & Code Review (Quickfix List)

Designed for auditing large codebases using native Vim quickfix lists instead of heavy UI sidebars.
- `<leader>ps` : Search for text/strings across the entire project (Grep).
- In Telescope: Press `<C-q>` to send all search results directly to your Quickfix list.
- `<C-j>` / `<C-k>` : Jump to the Next/Previous item in the Quickfix list (cursor stays centered).

LSP & Reading Source Code
- `gd` : Go to definition.
- `<C-o>` : Jump back to where you were before gd.
- `K` : Hover documentation (pure text). Double-tap K to jump your cursor inside the hover window to scroll through source code, press q to exit.
- `<leader>vws` : Search for a workspace symbol / function name globally.
- `<leader>vd` : View diagnostic/error information.

Movement
- `<C-d>` / `<C-u>` : Jump down/up half a page (cursor stays perfectly centered).
- `J` / `K` (in Visual mode) : Move highlighted blocks of code up and down.
- `<leader>p` (in Visual mode) : Paste over highlighted text without losing your current paste buffer.
