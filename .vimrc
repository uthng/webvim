"
" WebVim Configuration entry point
"
" author: Bertrand Chevrier <chevrier.bertrand@gmail.com>
" source: https://github.com/krampstudio/dotvim
" year  : 2015
"

" You won't find any configuration here directly,
" please look at files under the config folder for global config
" and under plugins for plugins configuration


filetype plugin on

let g:vimDir = $HOME.'/.vim'

let g:hardcoreMode = 0

let s:pluginDir  = g:vimDir.'/plugins/plugged'
let s:pluginDef  = g:vimDir.'/plugins/def.vim'
let s:pluginConf = g:vimDir.'/plugins/config.vim'

let s:configSetting = g:vimDir.'/config/setting.vim'
let s:configMapping = g:vimDir.'/config/mapping.vim'
let s:configAbbrev  = g:vimDir.'/config/abbrev.vim'
let s:configAutocmd  = g:vimDir.'/config/autocmd.vim'

let s:userConfig  = g:vimDir.'/local.vim'

if !isdirectory(s:pluginDir)

    " Welcome message when plugins are not yet installed

    echom " "
    echom "Welcome to WebVim"
    echom " > the vim IDE for web dev <"
    echom " "
    echom "Checking dependencies :"
    if (!executable('node') && !executable('nodejs')) || !executable('npm')
        echom " [ERR] node.js and npm are required, please install them before continuing."
    	echom " "
    else

        echom "  - nodejs   : ok"
        echom "  - npm      : ok"
        echom "  - eslint   : " . (executable('eslint')   ? "ok" : "no (optional)")
        echom "  - jsonlint : " . (executable('jsonlint') ? "ok" : "no (optional)")
        echom "  - csslint  : " . (executable('csslint')  ? "ok" : "no (optional)")
        echom " done."

        echom " "
        echom "We are going to install the plugins : "
        echom " 1. take a coffee"
        echom " 2. reload vim"
        echom " 3. Envoy WebVim"
        echom " "
        echom "Please note if you want to have the arrows keys and <esc>, disable the 'hardcoreMode' in the vimrc"
        echom " "

        exec ":source ".s:pluginDef

	"Install plugins on first run
	autocmd VimEnter * PlugInstall
    endif

else

    " Loads the global config, mapping and settings
    exec ":source ".s:configSetting
    exec ":source ".s:configMapping
    exec ":source ".s:configAbbrev
    exec ":source ".s:configAutocmd

    " Loads plugins def and config
    exec ":source ".s:pluginDef
    exec ":source ".s:pluginConf


    " user configuration
    if filereadable(s:userConfig)
       exec ":source ".s:userConfig
    endif

endif

let g:go_metalinter_autosave = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:UltiSnipsListSnippets = "<c-tab>"
"let g:UltiSnipsJumpForwardTrigger = "<c-j>"
"let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" NERDTREE
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowStatus = 1

" vim-go
" Disable warning about old version vim
let g:go_version_warning = 0

" Add for clipboard on Macos
set clipboard+=unnamed

" -------------------------------------------------------------------------------------------------
" FZF settings
" -------------------------------------------------------------------------------------------------
"FZF Bang commands
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

"function! RipgrepFzf(query, fullscreen)
  "let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  "let initial_command = printf(command_fmt, shellescape(a:query))
  "let reload_command = printf(command_fmt, '{q}')
  "let spec = {'options': ['--query', a:query, '--bind', 'change:reload:'.reload_command]}
  "call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
"endfunction

"command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


" -------------------------------------------------------------------------------------------------
" vim-go settings
" -------------------------------------------------------------------------------------------------
" Disable these options for vim-go
"let g:go_highlight_structs = 1
"let g:go_highlight_interfaces = 1
"let g:go_highlight_operators = 1

"let g:go_metalinter_enabled = ['deadcode', 'errcheck', 'gosimple', 'govet', 'staticcheck', 'typecheck', 'unused', 'varcheck']
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['govet', 'golint', 'errcheck', 'gofmt']
"let g:go_metalinter_autosave_enabled = ['deadcode', 'errcheck', 'gosimple', 'govet', 'staticcheck', 'typecheck', 'unused', 'varcheck']

let g:go_def_mapping_enabled = 0

" -------------------------------------------------------------------------------------------------
" vim-go settings
" -------------------------------------------------------------------------------------------------
let g:lsc_auto_map = v:true

" -------------------------------------------------------------------------------------------------
" dart-vim- settings
" -------------------------------------------------------------------------------------------------
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
