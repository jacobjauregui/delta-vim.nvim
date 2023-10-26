<!--
Author: jacobjauregui
Project: DelatVim
Version: v1.0.0
-->


██████╗░███████╗██╗░░████████╗░█████╗
██╔══██╗██╔════╝██║░░╚══██╔══╝██╔══██╗
██║░░██║█████╗░░██║░░░░░██║░░░███████║
██║░░██║██╔══╝░░██║░░░░░██║░░░██╔══██║
██████╔╝███████╗███████╗██║░░░██║░░██║
╚═════╝░╚══════╝╚══════╝╚═╝░░░╚═╝░░╚═╝              
██╗░░░██╗██╗███╗░░░███╗         
██║░░░██║██║████╗░████║         
╚██╗░██╔╝██║██╔████╔██║         
░╚████╔╝░██║██║╚██╔╝██║         
░░╚██╔╝░░██║██║░╚═╝░██║         
░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝         


![screenshot](./lua/delta/screenshots/DeltaVim_screenshot.png "DeltaVim screenshot")

## What about?

Inspiate by other similar projects for Vim and Neovim, such as NvChad, LunarVim,
LazyVim or AstroVim. DeltaVim include some of the most popular [plugins](1#plugins-list "Plugins list")
to improve your experience when using Neovim.

It's already configurated to run and work easily, but you can customize the default 
settings or add your own ones if you know some of Lua language.

**Note!.** *screenshot was taked while usign the follow assets (but this plugin
can to work whit another different e.g  OS: Windows, OS: Arch-Linux Terminal: 
Wezterm, etc... Except for Neovim, it must be v9.0 or higher. see [pre-requisites](#1pre-requisites "Pre-requisites before to install") ):*

* OS: Kali Linux (Debian)

* Terminal: Alacritty

* Neovim: v0.9.4, LuaJIT: 2.1.1692716794

* Fonts: NerdFonts
   - MesloLG 12px (Regular and Regular-Bold)
   - Victor Mono 12px (Italic and Italic-Bold)

---


### Pre-Requisites

- [Neovim 0.9+](https://github.com/neovim/neovim/releases "Neovim releases")
Is very important that nvim version be 0.9 or higher because some plugins may not
work correctly on lower versions. 

**Note!** If you've alrady installed Neovim with some custom settings, please make sure to
create a backup of the following directories: ***~/.config/nvim***
and ***~/.local/share/nvim***. Then delete them.

One way to do the above without deleting your files is:

```
    mv ~/.config/nvim ~/.nvim_bak
```
```
    mv ~/.local/share/nvim ~/.nvim_bak/
```

Then, you'll need to replace the old binary (***/bin/nvim***) with the new (***nvim.appimage***)
```
    sudo rm /bin/nvim && mv ~/Downloads/nvim.appimage /bin/nvim && chmod u+x /bin/nvim
```



- [NerdFonts](https://www.nerdfonts.com/font-downloads "NerdFonts"). It's recommended to
install and configure the "VictorMono Nerd Font" and "MesloLG Nerd Font" fonts
on your Terminal to icons displays correctly on the Tabline, Statusline, Directory browser (Nvim-Tree), etc.


---

## Install

Using **Linux** or **MacOS**
```sh
    git clone https://github.com/jacobjauregui/delta-vim ~/.config/nvim --depth 1 && nvim
```
* Using **Windows**
```sh
    git clone https://github.com/jacobjauregui/delta-vim $HOME\AppData\Local\nvim --depth 1 && nvim
```

---
...

***Need to fix***

<details>
    <summary style="color:lightgrey; font-size:1.2rem">Path tree</summary>
Once you've cloned the repo, you'll  automatically have a file structure of your config for neovim like the one below.

<html>
    <body>
        <div>
            <details style="border-color:#ff0000;padding-left:30px;border-width:1px; border-left-style:solid;"><summary style="color:#ff0000; font-size:1.35rem;">~/.config/nvim/</summary>
                <span style="border-color:#ffa900;padding-left:30px; border-width:1px; border-left-style:solid; color:#ffa900; font-size:1.1rem;">init.lua</span>
                <details style="border-color:#ffa900; padding-left:30px; border-width:1px; border-left-style:solid;"><summary style="color:#ffa900;font-size:1.2rem;">lua/</summary>
                    <details style="border-color:#ffff00;padding-left:30px; border-width:1px; border-left-style:solid;"><summary style="color:#ffff00; font-size:1.2rem;">delta/</summary>
                       <span style="color:#00ff00;padding-left:30px;border-left-style:solid; border-width:1px;font-size:1.1rem;">init.lua</span>
                       <br><span style="color:#00ff00;padding-left:30px;border-left-style:solid; border-width:1px;font-size:1.1rem;">globals.lua</span>
                       <br><span style="color:#00ff00;padding-left:30px;border-left-style:solid; border-width:1px;font-size:1.1rem;">utils.lua</span>
                    </details>
                    <details style="border-color:#ffff00;padding-left:30px;border-width:1px; border-left-style:solid;"><summary style="color:#ffff00; font-size:1.2rem;">config/</summary>
                        <span style="border-color:#00ff00;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ff00; font-size:1.1rem;">options.lua</span>
                        <br><span style="border-color:#00ff00;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ff00; font-size:1.1rem;">keymap.lua</span>
                        <br><span style="border-color:#00ff00;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ff00; font-size:1.1rem;">lazy.lua</span>
                        <details style="border-color:#00ff00; padding-left:30px; border-width:1px; border-left-style:solid;"><summary style="color:#00ff00; font-size:1.2rem;">gui/</summary>
                            <span style="border-color:#00ffff;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ffff; font-size:1.1rem;">gui_config.lua</span>
                            <br><span style="border-color:#00ffff;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ffff; font-size:1.1rem;">highlights.lua</span>
                            <br><span style="border-color:#00ffff;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ffff; font-size:1.1rem;">themes.lua</span>
                        </details>
                        <details style="border-color:#00ff00; padding-left:30px; border-width:1px; border-left-style:solid;"><summary style="color:#00ff00; font-size:1.2rem;">plugins/</summary>
                            <span style="border-color:#00ffff;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ffff; font-size:1.1rem;">cmp.lua</span>
                            <br><span style="border-color:#00ffff;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ffff; font-size:1.1rem;">ibl.lua</span>
                            <br><span style="border-color:#00ffff;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ffff; font-size:1.1rem;">lspconfig.lua</span>
                            <br><span style="border-color:#00ffff;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ffff; font-size:1.1rem;">lualine.lua</span>
                            <br><span style="border-color:#00ffff;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ffff; font-size:1.1rem;">luasnip.lua</span>
                            <br><span style="border-color:#00ffff;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ffff; font-size:1.1rem;">mason.lua</span>
                            <br><span style="border-color:#00ffff;padding-left:30px;border-width:1px; border-left-style:solid; color:#00ffff; font-size:1.1rem;">nvim-tree.lua</span>
                        </details>
                    </details>
                    <details style="border-color:#ffff00;padding-left:30px; border-width:1px; border-left-style:solid;"><summary style="color:#ffff00; font-size:1.2rem;">plugins/</summary>
                        <span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">cmp.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">colorizer.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">comment.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">copilot.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">devicons.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">fugitive.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">gitsigns.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">ibl.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">lsp.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">lualine.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">luasnip.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">mason.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">nvim-autopairs.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">nvim-tree.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">plenary.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">telescope.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">tree-sitter.lua</span>
                        <br><span style="color:#00ff00;padding-left:30px; border-width:1px; border-left-style:solid;font-size:1.1rem;">whichkey.lua</span>
                    </details>
                </details>
            </details>
        </div>
    </body>
</html>

<!--
Now, you can to run DeltaVim with the next command
```sh
deltavim
```
or
```
dvim
```
-->
