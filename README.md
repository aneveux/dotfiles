**This repository is not used anymore. I am now using [aneveux/.dotfiles](https://github.com/aneveux/.dotfiles) to manage my dotfiles.**

<p align="center">
  <h3 align="center">🦕 Antoine`.`files </h3>

  <p align="center">
    Personal dotfiles repository, provisioned by <a href="https://www.ansible.com/">Ansible</a>.
  </p>
</p>

## About The Project

Hello World 👋

This repository is _yet another dotfiles repository_, containing all the things I'm using to bootstrap and configure my development environment.

There's nothing too crazy in it, except things making my life easier, and a bunch of stuff I installed at some point and forgot why. Quite a lot of things are inspired from various dotfiles projects I found here and there.

There were numerous versions of my dotfiles, using various tools and provisioning mechanisms. I tried lots of different things, from window managers to shells, and I'll probably keep trying new things once in a while.

If you'd like to setup your environment with that project, feel free to use it. I would highly recommand taking a bit of time to understand it and adapt it to your needs though, to avoid hurting your computer too much. Of course if you have questions about something in that project and would like to talk about it, feel free to message me 😀

Have fun!

### Using

After years of using [i3-gaps](https://github.com/Airblader/i3), I recently switched to Gnome to give it a try, and so far I'm liking it (with a fair amount of extensions to make it act like i3 though).

I'm using [zsh](https://www.zsh.org/), nowadays completed by [Prezto](https://github.com/sorin-ionescu/prezto) (after years of using [oh-my-zsh](https://ohmyz.sh/)).

Don't hesitate to let me know if you'd have any recommendation to make!

## Getting Started

All of my dotfiles are managed with [Ansible](https://www.ansible.com/), allowing me to provision multiple environments and customize what's being deployed if necessary.

Configuration can be done through a yml file overriding the default values of this repository.

The `install.sh` script provided at the root of this repository allows you to execute the ansible commands easily.

### Prerequisites

Ansible tasks will most of the time automatically install software requirements, but there are a few things you need to install beforehand, like `ansible` itself for example, or `git` to retrieve that repository.

When on Arch based distros, some tools will be installed from the [aur](https://aur.archlinux.org/). We'll need an Ansible module in order to ease the installation for us, so we'll use [Ansible AUR](https://github.com/kewlfft/ansible-aur). It can use lots of AUR clients. I'm using [yay](https://github.com/Jguer/yay) myself, which is easy to install.

If you want to follow the way I do, I simply install `yay`, then use `yay` in order to install ansible-aur with `yay -S ansible-aur-git`.

With `yay`, `ansible`, and `ansible-aur` installed, you're ready to use the playbooks to start bootstraping your environment.

### Installation

After checking that the repository contains what you want, you can:

1. Create a local configuration file at `local/local.yml` (this repository assumes your dotfiles are located at `~/dotfiles`)

The content of this local configuration file should look like:

```yml
---
usr:
  id: john_doe
  name: John Doe
  mail: john@doe.org
  gpg_key: ABCDEFXXXXX

sys:
  proxy:
    enabled: False
    host: none
    port: 0
    noproxy: none
```

2. Customize the configuration the way you like
3. Execute the `install.sh` script

The script will let you install everything, or select exactly what you'd like to provision tool by tool.

If you want to install everything, simply run `./install.sh all`, otherwise, you can simply write the tag of a component you'd like to install, like `./install.sh i3` for example.

## Usage

The `install.sh` script allows you to provision everything you need. Roles are supposed to be idempotent, so you can execute them multiple times and nothing will change if their content has already been applied.

If you were about to use that repository for yourself, I'd highly recommend you to fork the repository, and modify it accordingly with your preferences.

## Contact

Antoine Neveux - antoine `at` neveux `dot` me
