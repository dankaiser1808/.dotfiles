# Daniel's Dotfiles

![terminal](docs/terminal.png)

## Important Notice

Feel free to use my dotfiles, but make sure to fork the repository and review any changes before running them on your system!

**Use at your own risk!**

---


## How It Works

I use GNU `stow` to manage my configuration files. Stow is a symlink manager that links my configurations to the home directory. Since all my configurations in $HOME are symlinks to my dotfiles repository, any changes will be mirrored to the actual files.


---

## Installation

Check out the `config.cfg` file. All customizations are defined in there. The variables are prefixed with the name of the script that uses them.

For example:
If you want to run the `git.sh` script inside `/scripts`, make sure to set the `GIT_*` variables to match your Git account and repositories.

Some scripts require specific packages and tools, which are installed by Homebrew.
   - All installed **packages** and **VS Code extensions** are tracked in the `./tools` directory:
     - `brew-formula.txt` → Homebrew formulas
     - `brew-cask.txt` → Homebrew casks
     - `vscode-extensions.txt` → VS Code extensions
   - These files are automatically updated via a pre-commit hook, to keep everything in sync with the installed packages and extensions.

To install everything in one go, just run:

```bash
   ./install.sh
```

This will execute all defined scripts.

If you don’t want to install everything, you can run each script manually:

```bash
./scripts/<name>.sh
```

Alternatively, edit `install.sh` and comment out the scripts you don’t want to run.
