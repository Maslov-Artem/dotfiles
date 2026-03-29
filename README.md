# Dotfiles

Personal dotfiles managed with GNU Stow.

## Description

This repository contains configuration files deployed via symlinks using Stow.

## Prerequisites

- GNU Stow  
- Git  

## Structure

This repo should be put in your home directory (~/) and all dotfiles should have exact same structure as they would be in home directory

Example:
dotfiles/.config/nvim/init.lua → ~/.config/nvim/init.lua

## Usage
```sh
git clone https://github.com/Maslov-Artem/dotfiles.git
cd dotfiles
stow .
```

