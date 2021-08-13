# Key bindings

1. [Text ediging](#text-editing)
2. [Navigation](#navigation)
3. [Split mode](#split-mode)
4. [Searching](#searching)

## Text editing

- `dd` - Delete line and add it to a buffer
- `d$` - Delete from cursor until the end of line
- `d^` - Delete from cursor until the start of the line
- `df[SYMBOL]` - Delete from cursor until the next occurence of [SYMBOL] (inclusive)
- `dF[SYMBOL]` - Delete from the cursor until the previouse occurence of [SYMBOL] (inclusive)
- `dt[SYMBOL]` - Delete from cursor until the next occurence of [SYMBOL] (exclusive)
- `dT[SYMBOL]` - Delete from the cursor until the previouse occurence of [SYMBOL] (exclusive)
- `ci"` - Change text between double quotes and enter `INSERT` mode
- `yy` - Copy line and add it to a buffer
- `p` - Paste from buffer
- `<leader>rn` = Rename symbol

## Navigation

- `%` - Go to matching symbol
- `gg` - Go to the start of file
- `G` - go to the end of file
- `H` - go to the top of the screen
- `M` - go the middle of screen
- `L` - got the the bottom of the screen
- `{` - go to prev paragraph
- `}` - go to next paragraph

## Split mode

TODO

## Searching

- `[SPACE]f` - Fuzzy search file names
- `[SPACE]w` - Fuzzy search for text in current buffer
- `[SPACE]g` - Fusszy search for text in the workspace
