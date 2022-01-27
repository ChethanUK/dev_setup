# MacOS Dev Setup

## Step 1: Install the CLI tools for Xcode. Open your terminal and run the command:

```bash
xcode-select --install
```

If you get an error, reset with `xcode-select -r` and try install again

## Step 2: Install Homebrew

Source: https://brew.sh

https://github.com/nicolashery/mac-dev-setup#install-1

Disable analytics:
https://www.cyberciti.biz/faq/how-to-install-homebrew-on-macos-package-manager/


By default Homebrew collects information and send analytics to developers. If you want you can disable analytics as follows:

```bash
brew analytics off
## add to your shell startup ##
export HOMEBREW_NO_ANALYTICS=1
```

Once executed the following information is no longer collected:

- Homebrew user agent
- Google Analytics
- Homebrew analytics tracking ID and user ID

Display the current state of Homebrew’s analytics:

`brew analytics`

## Step 3: Homebrew casks

```bash
brew search --casks code
brew install --casks visual-studio-code
```

## Step 4: Install git

```bash
brew install git
```

```bash
git config --global user.name "ChethanUK"
git config --global user.email "chethanuk@outlook.com"
```

```bash
cd ~
curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.gitconfig
curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.gitignore

git config --global core.excludesfile ~/.gitignore
```

Install hub: git wrapper - https://github.com/github/hub#installation
Tab completions: https://github.com/github/hub/tree/master/etc#installation-instructions

A collection of .gitignore templates:


- Install GitHub CLI: https://github.com/cli/cli#installation

Extra links: https://github.com/github/training-kit

Setup alias: https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/


```bash
https://docs.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key

brew install gpg2

gpg --full-generate-key

gpg --list-secret-keys --keyid-format LONG
gpg --armor --export 1D140A2F50A70ED9

```

## Step 5: Visual Code


Go to Code > Preferences > Settings. In the very top-right of the interface you should see an icon
with brackets that appeared { } (on hover, it should say "Open Settings (JSON)").

Click on it, and paste the following:

```json
{
    "editor.tabSize": 2,
    "editor.rulers": [100],
    "files.autoSave": "afterDelay",
    "files.insertFinalNewline": true,
    "files.trimTrailingWhitespace": true,
    "workbench.editor.enablePreview": false
}
```

Open the Command Palette, from which you can run pretty much anything:

```bash
Shell Command: Install 'code' command in PATH
```

## Step 5: ZSH

Lets check if its installed already:

zsh --version
If not lets install it:

brew install zsh
After the install lets set it as our default shell:

chsh -s /bin/zsh

Once you are logged back in fire up Hyper and enter:

```bash
echo $SHELL
/bin/zsh
```

## Step 7: Ohmyzsh


Install via https://github.com/ohmyzsh/ohmyzsh#basic-installation

compaudit | xargs chmod g-w,o-w

Oh My Zsh is an open-source driven framework for your zsh config. It comes with a bunch of different plugins, themes, and helpers to make your terminal look awesome inside.

Install using:

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

To speed up terminal: https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load.html

Please view [Using Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh#using-oh-my-zsh) and get yourself acquainted.

Source: https://dev.to/v3frankie/setup-your-mac-for-development-2020-edition-1c8a

Iterm settings: https://coderwall.com/p/h6yfda/use-and-to-jump-forwards-backwards-words-in-iterm-2-on-os-x

## Step 8: ZSH Plugins

Confirm that zsh is your shell:

```bash
dscl . -read /Users/$USER UserShell
```

To use newer version of zsh follow: https://dev.to/0xdonut/awesome-terminal-upgrades-part-two-upgrade-and-use-a-newer-version-of-zsh-on-macos-4hfg

### Install Zinit

https://github.com/zdharma/zinit#option-1---automatic-installation-recommended

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
```

A quick intro to Zinit: below are all the available Zinit
ice-modifiers, grouped by their role by different colors):

id-as'' as'' from'' wait'' trigger-load'' load'' unload''
pick'' src'' multisrc'' pack'' param'' extract'' atclone''
atpull'' atload'' atinit'' make'' mv'' cp'' reset''
countdown'' compile'' nocompile'' nocd'' if'' has''
cloneopts'' depth'' proto'' on-update-of'' subscribe''
bpick'' cloneonly'' service'' notify'' wrap-track''
bindmap'' atdelete'' ver''

No-value (flag-only) ices:
svn git silent lucid light-mode is-snippet blockf nocompletions
run-atpull reset-prompt trackbinds aliases sh bash ksh csh

Plugins you Should Use

https://itnext.io/terminal-101-the-setup-guide-that-will-boost-your-workflow-12df2570052

More at Faster ZSH: https://htr3n.github.io/2018/07/faster-zsh/


List all plugins:

```bash
omz plugin list
```

Recommended plugins: https://opensource.com/article/20/8/iterm2-zsh



### OMZ Themes

```bash
# List all themes
omz theme list
```

https://github.com/Powerlevel9k/powerlevel9k/wiki/Show-Off-Your-Config#onizukkas-configuration


## Step 5: Python

https://github.com/nicolashery/mac-dev-setup#python
https://github.com/pyenv/pyenv#homebrew-on-macos

Install pyenv via Homebrew by running:

```bash
brew update
brew install pyenv
```

Follow point 2 and 3 from https://github.com/pyenv/pyenv#basic-github-checkout

Define environment variable PYENV_ROOT and Add pyenv init to your shell:
```bash
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc\necho 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
```

```bash
pyenv install 3.8.7
pyenv global 3.8.7
```

- pyenv-virtualenv is a pyenv plugin that provides features to manage virtualenvs:

Installing as a pyenv plugin

To enable auto-activation add to your profile:
  if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

- Usage

pyenv virtualenv 2.7.10 my-virtual-env-2.7.10

- Search a directory for virtual environments that use pyenv-managed versions of Python.

Follow via https://github.com/pyenv/pyenv-users#installation

- pyenv doctor: https://github.com/pyenv/pyenv-doctor#pyenv-doctor

https://github.com/pyenv/pyenv-virtualenv#installing-as-a-pyenv-plugin

```bash
brew upgrade pyenv
```

## Step: Install Google Cloud SDK's

```bash
brew search --cask google

brew install --cask google-chrome google-cloud-sdk
# brew install --cask google-drive
```
Add your profile:

```bash
# for bash users
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"

# for zsh users
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
```


## Step: Install K8s

- Kubectl
```bash
gcloud components install docker-credential-gcr beta kubectl
```

```bash
brew install kubectx
brew install kube-ps1
brew install derailed/popeye/popeye
brew install stern
brew install k9s
```

https://medium.com/free-code-camp/how-to-set-up-a-serious-kubernetes-terminal-dd07cab51cd4

- Helm

```bash
brew install helm
```

- Octant

```bash
brew install octant
```

- Terraform Manager

```bash
brew install tfenv
```

- 1password

```bash
brew search --cask 1password

brew install --cask 1password 1password-cli
```

- OpenVPN

```bash
brew install --cask openvpn-connect
```

## Step: Install SDK


Installing SDKMAN! on UNIX-like platforms is as easy as ever: https://sdkman.io/install

```bash
curl -s "https://get.sdkman.io" | bash

Next, open a new terminal or enter:

source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk version
```

### Install Java

```bash
sdk list java

sdk install java 11.0.10.hs-adpt
java -version
sdk install java 8.0.282.hs-adpt
java -version
```

### Install Flink

```bash
sdk install flink 1.12.2
```

### Install Spark

```bash
sdk install spark 3.0.2
sdk install spark 3.1.1
```

### Install IDE's

## IDE

```bash
brew search --cask toolbox

brew install --cask jetbrains-toolbox

brew search --cask pycharm
brew install --cask pycharm
brew search --cask idea
brew install --cask intellij-idea
brew install --cask goland
```

- Slack

```bash
brew install --cask slack
```





## SSH

https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/#ssh



Define environment variable PYENV_ROOT: https://github.com/pyenv/pyenv#basic-github-checkout



When finished, you should see instructions to add something to your profile.
Open your .bash_profile in the home directory (you can use code ~/.bash_profile),
and add the following line:

Install dependencies:

```bash
brew install openssl readline sqlite3 xz zlib
```

```bash
if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi
```

Save the file and reload it with:

source ~/.bash_profile



## Step 6:


https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/


## Step 7

Install Poetry

```bash
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
source $HOME/.poetry/env

poetry -h
poetry config virtualenvs.create true
poetry config virtualenvs.in-project true
```

## Extra

Download Magnet: https://magnet.crowdcafe.com
Chrome Dev Theme: https://github.com/taniarascia/new-moon-chrome-devtools





1. https://getantibody.github.io/update/

2. https://github.com/zdharma/zinit

https://zdharma.org/zinit/wiki/


https://github.com/getantibody/antibody

https://dev.to/0xdonut/awesome-terminal-upgrades-part-one-upgrade-and-use-a-newer-version-of-bash-on-macos-5boc

https://callstack.com/blog/supercharge-your-terminal-with-zsh/

https://dev.to/kamekuremaisuke/prepare-a-set-of-rust-tools-that-can-be-used-with-zsh-in-zinit-49ae
