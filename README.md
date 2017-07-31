# .files

Nothing fancy in there... Just the dotfiles I'm using as well as some information/scripts about my installation. In case it helps anyone I'm really glad you found some information here :)

## Making it yours?

In case you'd like to use that repository for setting up your environment, you can simply fork it. No problem for me.

**Do not forget to change values in the `me` file though, since they contain information related to me :)**

I know I could just retain that `me` file for myself, but at least it can be used as kind of an example on how I use it.

Also you can create a `local` folder in this dotfiles repository, and have a `gitconfig_user` file with those lines:

```
[user]
name = <Your Name Here>
email = <Your Mail Here>
```

While installing, it'll create your `~/.gitconfig` without synchronizing your personal information on your repository.

## Howto?

I'm relying on [dotbot](https://github.com/anishathalye/dotbot), a simple and really good tool allowing to easily provision and update my dotfiles, as well as running a couple shell commands to provision some basic stuff on my workstation.

Usage is really simple: clone the repository, then `./install.sh`.

Of course in case you'd like to take stuff from my dotfiles, be sure to modify the files accordingly to your computer ;)

In order to update dotbot, simply run `git submodule update --remote dotbot`.

## Environment

I'm running [Manjaro](https://manjaro.github.io/). Here are a few things I installed on it (alphabetical order):

`sudo pacman -S ansible atom cherrytree corkscrew cowsay docker docker-compose dropbox filezilla firefox fish git gvim htop keepass lolcat numix-manjaro-themes numix-reborn-icon-themes numix-themes pgadmin3 ranger terminator thefuck thunderbird tmux tree vim workrave xclip yaourt zsh`

But also from AUR:

`yaourt -S flux franz nerd-fonts-complete ruby-jekyll ruby-jekyll-gist ruby-jekyll-paginate ruby-jekyll-sitemap ruby-jekyll-watch signal terminix`

Of course there are already a lot of things included in Manjaro out of the box. But do not hesitate to mention me anything that you might think would be worth a try :)

## Bonuses?

I'm also using a couple additional tools:

- [SDKMan](http://sdkman.io/install.html) for managing stuff like Maven, Gradle, Kotlin, Java, Groovy, etc. binaries.
- [Oh My ZSH!](http://ohmyz.sh/) for all the goodies it includes :)
- [Powerlevel9k](https://github.com/bhilburn/powerlevel9k) for a fancy looking prompt!
- [Awesome Terminal Fonts](https://github.com/gabrielelana/awesome-terminal-fonts) cause I like fancy stuff a lot.
- [Sublime Text](http://www.sublimetext.com/3) which I use more than Atom I believe... (but I'm like changing editors all the time...)
- [IntelliJ IDEA](https://www.jetbrains.com/idea/) for Java, Kotlin, and all those JVM related stuff.
- [Vim Bundles by spf13](http://vim.spf13.com/) cause they just contain all the things I want in vim.
- [MaterialTheme](http://equinsuocha.io/material-theme/) which looks awesome :)
- [Oh My Fish!](https://github.com/oh-my-fish/oh-my-fish) because I'm trying [Fish Shell](http://fishshell.com/)

## Oh My Fish?

Yep. Just run: `curl -L https://get.oh-my.fish | fish`.

Then, I'm installing:

- `omf install budspencer`
- `omf install ansible`
- `omf install sublime`
- `omf install thefuck`
- `omf install archlinux`

Or simply run `omf install` if you have the dotfiles installed, it'll install automatically of the bundles from the omf directory.

## Sublime Text 3 Installation

1. Download it from here: [Sublime Text 3](http://www.sublimetext.com/3)
2. Extract the archive content in `~/opt`: `tar jxf sublime_text_3_....tar.bz2 -C ~/opt/sublime_text_3`
3. Install Package Control for Sublime Text 3 from here: [Package Control](https://packagecontrol.io/installation)
4. Packages I install from Package Control:

- `AceJump`
- `Ansible`
- `Ansible Vault`
- `Color Highlighter`
- `ColorPicker`
- `fish-shell`
- `Git`
- `Git Config`
- `JavaScript Ultimate`
- `MarkdownEditing`
- `Material Theme`
- `Material Theme - AppBar`
- `Origami`
- `Pretty YAML`
- `Shell Exec`

## KeePass plugins

I'm using those [KeePass plugins](http://keepass.info/plugins.html):

- `KeeAgent`
- `KeeOTP`
- `KeePassRPC`

## IDEA Plugins

Here's a quick list of all the IDEA plugins I'm using:

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

All my IDEA settings are automatically managed through [https://github.com/aneveux/idea-settings](https://github.com/aneveux/idea-settings).

## Thank you!

I really wanted to thank all those really nice projects/people for the great help/inspiration:

- [GitHub does dotfiles](https://dotfiles.github.io/)
- [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)
- [dotbot](https://github.com/anishathalye/dotbot)
- [Jean-Marc Desprez](https://github.com/jmdesprez)

As well as all the really nice tools I already mentionned before :)
