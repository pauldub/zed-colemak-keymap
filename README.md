# Colemak-Friendly Keybindings for Zed Editor

This project provides a Ruby script to transform the Zed editor's keybindings to be Colemak keyboard layout-friendly. It automatically downloads the official Vim keymap from the Zed repository for your specific Zed version, applies Colemak-friendly key swaps, and optionally merges user-defined keybindings.

## Features

- **Version-specific downloads**: Automatically fetches the Vim keymap for your installed Zed version
- **Colemak key remapping**: Transforms Vim-style navigation keys to match Colemak finger positions
- **User customization**: Merges your personal keybindings from `user.json` with the generated keymap
- **Preserves complex bindings**: Handles multi-key sequences and modifier keys correctly

## Key Swaps

The following key swaps are applied to make Vim-style navigation intuitive for Colemak users:

| QWERTY Key | Colemak Key | Description |
|------------|-------------|-------------|
| `j` | `n` | Down |
| `k` | `e` | Up |
| `l` | `i` | Right |
| `n` | `k` | Search next |
| `i` | `u` | Insert |
| `u` | `l` | Undo |
| `e` | `f` | End of word |
| `f` | `t` | Find character |
| `t` | `j` | Till character |

These swaps are applied even when used with modifier keys like `shift-` or `ctrl-`.

## Installation

### Prerequisites

- Ruby (version 2.0 or higher)
- Zed editor installed and in your PATH

### Setup

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/zed-colemak-keymap.git
   cd zed-colemak-keymap
   ```
   
2. **Verify your Ruby installation:**
   ```sh
   ruby -v
   ```

## Usage

1. **Run the script:**
   ```sh
   ruby colemak_keybinding.rb
   ```

2. **Custom keybindings (optional):**
   
   Create a `user.json` file in the project directory with additional keybindings. These will be merged with the Colemak-transformed keybindings.

   Example `user.json` format:
   ```json
   [
     {
       "context": "Editor",
       "bindings": {
         "ctrl-s": "editor::Save"
       }
     }
   ]
   ```

3. **Apply the generated keymap in Zed:**
   
   - Copy `colemak_keybindings.json` to your Zed configuration directory
   - Set this file as your keymap in Zed's settings

## Inspiration

The key swaps are inspired by the excellent [wbolster/emacs-evil-colemak-basics](https://github.com/wbolster/emacs-evil-colemak-basics) project, which applies similar transformations for Emacs.

## Contributing

Contributions are welcome! Feel free to:
- Report bugs or request features by opening issues
- Submit pull requests for improvements or fixes
- Share your custom keybindings

## License

This project is licensed under the MIT License.
