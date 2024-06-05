# Colemak-Friendly Keybindings for Zed Editor

This project provides a Ruby script to transform the JSON configuration file for the Zed editor's keybindings to be Colemak keyboard layout-friendly. It reads the existing keybindings, applies specified key swaps, and outputs the modified keybindings.

## Key Swaps

The following key swaps are applied:
- `j` -> `n`
- `k` -> `e`
- `l` -> `i`
- `n` -> `k`
- `i` -> `u`
- `u` -> `l`
- `e` -> `f`
- `f` -> `t`
- `t` -> `j`

These swaps are applied even when used with `shift-` or `ctrl-` prefixes.

## Keymap Input File

The keymap input file is the `vim.json` file found at:
[https://github.com/zed-industries/zed/blob/main/assets/keymaps/vim.json](https://github.com/zed-industries/zed/blob/main/assets/keymaps/vim.json)

## Inspiration

The key swaps are inspired by the excellent [wbolster/emacs-evil-colemak-basics](https://github.com/wbolster/emacs-evil-colemak-basics).

## Getting Started

### Prerequisites

- Ruby (version 2.0 or higher)
- A JSON configuration file for the Zed editor's keybindings (`vim.json`)

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/colemak-friendly-keybindings.git
   cd colemak-friendly-keybindings
   ```
   
2. **Ensure you have Ruby installed:**

    ```sh
    ruby -v
    ```

If you don't have Ruby installed, you can download it from ruby-lang.org.

## Usage

1. **Place your vim.json file in the project directory:**

Ensure your vim.json file is in the same directory as the script.

2. **Run the script:**


``` sh
ruby colemak_keybindings.rb
```

3. **Output:**

The script will generate a new file named colemak_keybindings.json in the same directory with the modified keybindings.

## Contributing

Feel free to contribute to this project by opening issues or submitting pull requests. Any improvements or bug fixes are welcome.

## License

This project is licensed under the MIT License.
