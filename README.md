# <img alt="01 VCS" title="01 VCS" src="logotype.svg">

Git/Pijul, on steroids 🚀

01 VCS is a suite of improvements for current VCS' such as git; and can be considered itself as a (layer 2) VCS.

In my tests, I'm still using 01's git wrapper where even the bugs (such as escaping quotes) works as features/improvements, by just using the usual "git" command.

Its also slowly replacing git's perl functions into Rust!

Awesome commands:

- `01/z1/git ignore <file/folder>` (Adds a file/folder to the .gitignore file, and git will not track it.)
- `01/z1 blm` (Migrate from 'master' to 'main' branch in a repo ✊🏿)
- `01/z1 size` (Shows size of git repository. '-q' for quiet simpler output)

Awesome commands for our git wrapper:

- `git add -r <file/extension>` (Add files/extensions recursively! Only one file per once.)
- `git unstage` (Tell what files you want to unstage/not to include in the next commit.)
- `git init` (with 01, now it uses Rust)

# Installing

Open terminal on Gitty folder, and type following by pressing `[ENTER]`:

```sh
chmod +x install.sh && sh ./install.sh
```

Important note: some newer shells other than [Bash](https://github.com/mitnk/cicada), such as [Nushell](https://github.com/nushell/nushell/), don't support numbers as commands (such as "01"). For these cases, our installer asks to aditionally install the "z1" alternate/shortcut command 🧚‍♀️🪄

<img width="250px" alt="01 logo/icon" title="01 logo/icon" src="logo-icon.svg">

Layer2 for git, ready for the Web 3.0

01 is already a minimum viable product; but PRs and issues are welcome!

Alongside community contributions, the maintainer of this project will try to find time to keep updating 01, although she does already have a ton of projects to manage (con)currently.
