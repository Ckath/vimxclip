# vimxclip
clipboard support without the need for +clipboard through xclip, kinda
- copy text to your system clipboard by yanking into the x register
- automatically synced with system clipboard on focus(if FocusGained works, which it probably won't)
- only depends on xclip, no need for +clipboard in your vim

made solely because I did not feel like installing more packages to get a vim with +clipboard support on Arch Linux

## workarounds
since the focus event probably isn't working and your system clipboard won't be synced to your x register automatically, you might want to make a paste command along the lines of this:

`nnoremap <leader>p :call GetClip()<CR>"xp`

this sets the x register to whatever is in your system clipboard(xclip -o -selection clipboard) before pasting into vim. you can of course also map `:call GetClip()<CR>` to a separate key combo and later paste it through whatever other binds you have, or the default `"xp`.

## notes
- only ever tested in vim
- I personally don't use gvim
- non of the terminal emulators I have tested have had working FocusGained, your mileage may vary
