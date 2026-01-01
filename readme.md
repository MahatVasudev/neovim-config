# My Neovim Config

Currently using Tokyonight Theme, but i have made it look more Persona 3 esque
But you can dynamically choose between themes, by changing theme name in lua/vim-options.lua in vim.g.current_theme

```lua
vim.g.current_them = "tokyonight" -- can be cyberdream, tokyonight, catppuccin, gruvbox, aurora, kanagawa
```


# Themes
- Cyberdream made it look kinda cyberpunk style
- Tokyonight is Persona 3 esquq
- Catppuccin is Person 5 minimal style
- Others are not changed, when changed will be written

**CYBERDREAM**
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/cab0e444-7464-45ef-ae3d-84325d8775c1" />

**TOKOYONIGHT**
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4e280cd1-90eb-438a-9aab-964af2549f2b" />

**CATPPUCCIN**
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/21287db9-b2aa-4479-8dd3-b974ee7623ac" />

---

# Additional Features

**Strict Mode**
Also added **strict mode** which does not allow mouse and arrow keys for navigation (i need it badly)
can be turned off tho, again in lua/vim-options.lua, by turning `vim.g.strict_mode = false`

**Session Save**
<p>
Now sessions are saved, even when you exit the editor, making you able to pick it back up from where you left...
you can also delete the session by `<leader>sd`, which removes every buffers and lands you back to the main page, 
also you need to do `<leader>se` if you want to be able to save the buffer again, as it will stop saving until you exit...

working on a unified command which lets me delete the session and allows auto saving but is not working correctly yet... will be done in the future
</p>

**Buffer Tab Size**
<p>
you can now reshape the buffer tab in the session

`Alt-Up` for vertical size increase <br>
`Alt-Down` vertical size decrease <br>
`Alt-Left` horizontal size decrease <br>
`Alt-Right` horizontal size increase <br>

also `<leader>sm` allows you to maximize the current buffer you are working on
</p>

**TODO-Functionality Increased**
<p>
Added more TODOs for better description of code
ALSO added the ability to search every todo comments written in a directory, which will help you navigate tasks pending more nicely
  
this can be done by `<leader>ft`
also you can search every todo comment in a current buffer by `<leader>fT`...

</p>

**More Notify Functionality**
<p>
We can now remove the notification that is currently shown by `<leader>nd`
The history function is not working currectly yet, so will be fixed in the next push
</p>
  
**A stylish cursor**
<br>
<p>
Just added it, it looks cool so...
</p>
