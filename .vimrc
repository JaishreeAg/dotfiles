filetype off

call plug#begin()

let minimal = "amnesia"
let hostname = substitute(system('hostname'), '\n', '', '')

" most hosts get all the plugins
if hostname != minimal
  " FZF replaces command-t
  Plug 'junegunn/fzf.vim'
  set rtp+=~/.fzf

  " Async make/lint stuff
  Plug 'neomake/neomake'

  "
  " Language-specific stuff
  "

  " Go stuff
  Plug 'fatih/vim-go'

  " Go refactoring
  Plug 'godoctor/godoctor.vim'

  " TOML syntax
  Plug 'cespare/vim-toml'

  " Surround. Nuff Sed.
  Plug 'tpope/vim-surround'

  " Caddyfile (webserver) syntax
  Plug 'joshglendenning/vim-caddyfile'

  " Rust stuff
  Plug 'rust-lang/rust.vim'
  Plug 'racer-rust/vim-racer'

  " rubby :(
  Plug 'vim-ruby/vim-ruby'

  "
  " END Language-specific stuff
  "
  "

  " Say no more
  Plug 'tpope/vim-fugitive'

  " Code completion
  if has("python3")
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " Go code completion
    Plug 'zchee/deoplete-go', { 'do': 'make' }

    " Python code completion
    Plug 'zchee/deoplete-jedi'
    Plug 'davidhalter/jedi-vim'
  endif

  " autopep8
  Plug 'tell-k/vim-autopep8'


  " Undo tree
  Plug 'sjl/gundo.vim'

  "
  " Snippets
  "
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " File browsing
  Plug 'tpope/vim-vinegar'
endif

" Mac-only stuff
if has("mac")
  Plug 'sectioneight/vim-kwm'
endif

" These go to all my machines

" Like powerline, but lighter
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'

" Theme
Plug 'nanotech/jellybeans.vim'
"# "Format code with one button press" - https://github.com/Chiel92/vim-autoformat

Plug 'scrooloose/nerdcommenter'


Plug 'airblade/vim-gitgutter'

if has('unix')
  Plug 'Matt-Deacalion/vim-systemd-syntax'
endif

call plug#end()

call pathogen#infect()

runtime! init/**.vim

silent! source ~/.vimrc.local
