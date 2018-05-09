# My Vim Configuration Files

Features:

1.  Molokai colors
2.  Detection of some Gofem files
3.  Macros for C++, Fortran, Go, Html, JS, JSON, TeX
4.  Some (old) useful plugins: Align, Imaps
5.  Added dictionary words
6.  Syntax highlighting for input, js, material, python, swig and tex files

## Fonts

Download nerd fonts:

```bash
cd ~/xpkg
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
bash install.sh
```

## Location on Windows

The .vim directory goes as:

```
C:\Users\username\vimfiles
```

And the vimrc file goes to:

```
C:\Users\username\_vimrc
```

Add the following path to the PATH environment variable:

```
C:\Program Files (x86)\Vim\vim80
```

## Exuberant Ctags on Windows

Download [ctags58.zip](http://prdownloads.sourceforge.net/ctags/ctags58.zip) from
http://ctags.sourceforge.net/

Extract ctags.exe into `C:\TDM-GCC-64\bin`

## Prettier

```bash
cd ~/.vim/bundle/vim-prettier
yarn install
```

## Creating JS+React+Eslint+Prettier App

```bash
yarn global add eslint-cli
cd ~/temp
npx create-react-app myapp
cd myapp
yarn add --dev eslint babel-eslint eslint-plugin-flowtype eslint-plugin-react eslint-plugin-jest prettier eslint-plugin-prettier eslint-config-prettier eslint-config-airbnb flow-bin
yarn eslint -- --init
yarn run flow init
```

.eslintrc.json

```json
{
  "extends": ["airbnb", "plugin:jest/recommended"],
  "parser": "babel-eslint",
  "plugins": ["prettier", "eslint-plugin-jest"],
  "env": {
    "jest/globals": true,
    "browser": true
  },
  "rules": {
    "indent": ["error", 2],
    "no-console": ["error", { "allow": ["warn", "error"] }],
    "max-len": ["error", { "code": 300 }],
    "react/no-find-dom-node": "off",
    "prettier/prettier": "error"
  }
}
```

## YouCompleteME

python install.py --go-completer --js-completer --tern-completer

* Go support: install [Go][go-install] and add it to your path. Navigate to
  `YouCompleteMe/third_party/ycmd/third_party/gocode` and run `go build`.

* JavaScript support: install [Node.js and npm][npm-install]. Then navigate
  to `YouCompleteMe/third_party/ycmd/third_party/tern_runtime` and run `npm install --production`
