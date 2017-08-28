![](https://img.shields.io/badge/ponies-%E2%9D%A4-ff69b4.svg) ![](https://img.shields.io/badge/%E2%94%AC%E2%94%80%E2%94%80%E2%94%AC%E2%97%A1%EF%BE%89(%C2%B0%20--%C2%B0%EF%BE%89)-4-brightgreen.svg) ![](https://img.shields.io/badge/Totally%20Spies%3F-%5Co%5C%20%5Co%2F%20%2Fo%2F-yellow.svgl)

# .files / environment bootstrap

Hi there! This whole repository contains all the resources I'm using in order to install and configure my development environment.

There's basically nothing too fancy, but I'm glad it helps in case you're searching to do something a bit similar. Otherwise, it'll help me at least ;)

## 1. Installing Operating System

I'm using [Manjaro](https://manjaro.org/), a [Linux](https://en.wikipedia.org/wiki/Linux) distribution based on [Arch](https://www.archlinux.org/).

It's fairly easy to install, and you'll get all the information from their [Download Page](https://manjaro.org/get-manjaro/).

## 2. Cloning dotfiles

In case you don't have `git` installed already, you can simply install it quickly from `pacman` through `sudo pacman -S git`, but it should be present by default I believe.

Then, the only thing you want to do is to clone that project in your `HOME` folder (basically `~/`, which means something like `/home/<your username>`).

You can do that with `git clone git@github.com:aneveux/dotfiles.git`

## 3. Installing software

From the dotfiles directory, you can execute the following script: `./install_software.sh` which will rely on `pacman` and `yaourt` in order to install all the software I'm using on my Linux installation (or most of it at least).

Among lots of others, it'll take care of installing [i3](https://i3wm.org/), the Window Manager I'm using. It'll also change the shell to [Fish Shell](http://fishshell.com/).

Do not hesitate to have a look at the script to see all the things which will be installed.

## 4. Customizing some configuration

There are a few things you can customize easily from this repository:

- Update the `me` file to match with your user id, it's used only for `zsh` though, which I'm not using that much.
- Create a `local` folder in the dotfiles repository, it's ignored by git, and will allow you to store some local configuration values.
- Create a `gitconfig_user` file in that `local` folder, in which you can store the `user` section of your `~/.gitconfig` file. It allows you to keep that local. (the `gitconfig` file will be generated later on).
- Create a `monitor_configuration` in the `local` folder, in which you can specify `xrandr` commands to be executed by `i3` while starting up to configure your monitors.

As an example, here's how the `gitconfig_user` could look:

```
[user]
    name = <Your Name Here>
    email = <Your Mail Here>
```

## 5. Provisionning dotfiles (and a bit more)

I'm relying on [dotbot](https://github.com/anishathalye/dotbot) for that. You can have a look at `install.conf.yaml` for more information on what's done.

It'll basically install some stuff (a few fonts, zsh, vim plugins, sdkman, etc.), and then create symlinks to all the dotfiles which are required to configure those tools.

The `gitconfig` file will be generated during that step as well.

In order to actually perform this step, simply run `./install.sh` from the dotfiles folder.

## 6. Configuring SSH (additional steps)

In order to load automatically my SSH keys in a running agent, and to share those with all the software I'm using, you'll need a small additional SSH configuration. Some files will be populated by dotbot, and then you'll need to execute:

```shell
$ systemctl --user enable ssh-agent.service
$ systemctl --user start ssh-agent.service
```

You can verify that it's working properly by executing:

```shell
$ systemctl --user status ssh-agent.service
```

Then, put that in your `~/.ssh/config` file as well: `AddKeysToAgent yes`.

All of this will allow to start an SSH agent while your environment is starting up, and then store the keys which are loaded in that agent when they're used for the first time.

## 7. Installing SDKs

I'm relying on [SDKMan](http://sdkman.io/) for installing all the SDKs I need. It'll be installed directly by dotbot, so now you only need to use it for installing what you need.

On my side, I'm using it for:

```shell
$ sdk install java
$ sdk install kotlin
$ sdk install groovy
$ sdk install maven
$ sdk install gradle
```

Note that it'll also take care of managing all the required environment variables such as `JAVA_HOME` and so on.

## 8. Installing omf plugins

I'm using [Oh My Fish!](https://github.com/oh-my-fish/oh-my-fish) for some fish themes and plugins. All the configuration is already in the dotfiles, but you'll need to:

- Install it: `curl -L https://get.oh-my.fish | fish`
- Install the plugins: `omf install`

## 9. Installing Sublime

My main text editor is Sublime (even if I'm using Atom or vim sometimes). Here are the steps to follow to install and configure it:

1. Download it from here: [Sublime Text 3](http://www.sublimetext.com/3)
2. Extract the archive content in `~/tools`: `tar jxf sublime_text_3_....tar.bz2 -C ~/tools/sublime_text_3`
3. Install Package Control for Sublime Text 3 from here: [Package Control](https://packagecontrol.io/installation)
4. Packages I install from Package Control:

- `A File Icon`
- `AceJump`
- `Ansible`
- `Ansible Vault`
- `Boxy Theme`
- `Boxy Theme Addon - Font Face`
- `Boxy Theme Addon - Unified Mode`
- `Color Highlighter`
- `ColorPicker`
- `fish-shell`
- `Git`
- `Git Config`
- `JavaScript Ultimate`
- `MarkdownEditing`
- `Origami`
- `Pretty YAML`
- `Shell Exec`

Then the whole configuration is made by the dotfiles.

## 10. Installing IntelliJ IDEA

I'm using [IntelliJ IDEA](https://www.jetbrains.com/idea/) as my IDE. Download it directly from the [JetBrains website](https://www.jetbrains.com/idea/download/#section=linux).

I'm not using the version available in AUR cause I like to update it as soon as possible and always use the latest version possible, which is delayed a bit by the AUR packaging.

Here's a list of all the IDEA plugins I'm installing:

- `AceJump`
- `BashSupport`
- `CheckMate`
- `Docker Integration`
- `Error-Prone compiler integration`
- `FindBugs-IDEA`
- `GitToolBox`
- `.ignore`
- `GitLab Projects`
- `Ansible Support`
- `Java8 Generators`
- `Kotlin`
- `Scala`
- `Lombok`
- `Markdown Support`
- `Maven Helper`
- `Presentation Assistant`
- `Upsource Integration`

All my configuration is available in a separate github repository though: [https://github.com/aneveux/idea-settings](https://github.com/aneveux/idea-settings). Which is used directly by IntelliJ settings manager in order to synchronize my configuration across all the installation I have.

# Updates

For updating the submodules, use this command: `git submodule update --remote dotbot`. You can replace dotbot by the name of the submodule you want to update.

If you modify the files which are already symlinked, you have nothing to do for updating your environment.

If you add more files, simply run again that `./install.sh` script and it'll set up the links for you.

# Resources

Here are links towards really interesting tools/resources I'm using:

- [Manjaro](https://manjaro.org/) - my favourite Linux distro,
- [Fish Shell](http://fishshell.com/) - friendliest shell I met,
- [Oh My Fish!](https://github.com/oh-my-fish/oh-my-fish) - like fish wasn't easy enough,
- [ZSH](http://www.zsh.org/) - my former shell... Keeping it for memories,
- [Oh My ZSH!](http://ohmyz.sh/) - making zsh easier,
- [Powerlevel9k](https://github.com/bhilburn/powerlevel9k) - prompt I was using in ZSH,
- [SDKMan](http://sdkman.io/install.html) - easiest way to manage SDKs,
- [Nerd Fonts](http://nerdfonts.com/) - biggest fancy fonts collection I found,
- [Vim Bundles by spf13](http://vim.spf13.com/) - simply all the things I want in vim,
- [IntelliJ IDEA](https://www.jetbrains.com/idea/) - my favourite IDE,
- [Sublime Text](http://www.sublimetext.com/3) - my favourite text editor,
- [Terminal Sexy](http://terminal.sexy/) - for generating color themes,
- [Idea Color Themes](http://color-themes.com/?view=index) - color themes for IntelliJ,
- [Boxy Theme](https://packagecontrol.io/packages/Boxy%20Theme) - favourite theme for sublime,
- [i3](https://i3wm.org/) - the Window Manager I was searching for,
- [Rofi](https://davedavenport.github.io/rofi/) - a powerful window switcher,

And more to come... Maybe.

# Thanks!

I really wanted to thank all those really nice projects/people for the great help/inspiration:

- [Jean-Marc Desprez](https://github.com/jmdesprez)
- [GitHub does dotfiles](https://dotfiles.github.io/)
- [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)
- [dotbot](https://github.com/anishathalye/dotbot)

As well as all the really nice tools I already mentionned before :)
