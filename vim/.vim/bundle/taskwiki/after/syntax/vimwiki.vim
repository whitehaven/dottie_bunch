" Disable taskwiki if taskwiki_disable variable set
if exists("g:taskwiki_disable")
  finish
endif

" Detect if conceal feature is available
let s:conceal = exists("+conceallevel") ? ' conceal': ''

syntax match TaskWikiTask /\s*\* \[.\]\s.*$/
       \ contains=VimwikiListTodo,
                \ VimwikiTag,
                \ VimwikiEmoticons,
                \ VimwikiTodo,
                \ VimwikiBoldT,
                \ VimwikiItalicT,
                \ VimwikiBoldItalicT,
                \ VimwikiItalicBoldT,
                \ VimwikiDelTextT,
                \ VimwikiSuperScriptT,
                \ VimwikiSubScriptT,
                \ VimwikiCodeT,
                \ VimwikiEqInT,
                \ VimwikiLink,
                \ VimwikiNoExistsLink,
                \ VimwikiNoExistsLinkT,
                \ VimwikiWikiLink,
                \ VimwikiWikiLinkT,
                \ @Spell

" Conceal the UUID
execute 'syn match TaskWikiTaskUuid containedin=TaskWikiTask /\v#([A-Z]:)?[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/'.s:conceal
execute 'syn match TaskWikiTaskUuid containedin=TaskWikiTask /\v#([A-Z]:)?[0-9a-fA-F]{8}$/'.s:conceal
highlight link TaskWikiTaskUuid Comment

" Conceal header definitions
for s:i in range(1,6)
  execute 'syn match TaskWikiHeaderDef containedin=VimwikiHeader'.s:i.' contained /|[^=]*/'.s:conceal
endfor

" Define active and deleted task regions
" Will be colored dynamically by Meta().source_tw_colors()
syntax match TaskWikiTaskActive containedin=TaskWikiTask contained /\s*\*\s\[S\]\s[^#]*/
syntax match TaskWikiTaskCompleted containedin=TaskWikiTask contained /\s*\*\s\[X\]\s[^#]*/
syntax match TaskWikiTaskDeleted containedin=TaskWikiTask contained /\s*\*\s*\[D\]\s[^#]*/
syntax match TaskWikiTaskRecurring containedin=TaskWikiTask contained /\s*\*\s\[R\]\s[^#]*/
syntax match TaskWikiTaskWaiting containedin=TaskWikiTask contained /\s*\*\s\[W\]\s[^#]*/
syntax match TaskWikiTaskPriority containedin=TaskWikiTask contained /\( !\| !!\| !!!\)\( \)\@=/

" Set concealed parts as really concealed in normal mode, and with cursor over
" (unless disabled by user)
setlocal conceallevel=3
if !exists('g:taskwiki_disable_concealcursor')
  setlocal concealcursor=nc
endif

" Configure custom FoldText function
" Altered version of the VimwikiFoldText
setlocal foldmethod=syntax
setlocal viewoptions=folds

function! TaskwikiFoldText()
  let line = getline(v:foldstart)
  let main_text = substitute(line, '^\s*', repeat(' ',indent(v:foldstart)), '')
  let short_text = substitute(main_text, '|[^=]* =', '=', '')
  let short_text = substitute(short_text, '@[^=]* =', '=', '')
  let short_text = substitute(short_text, ' @[A-Za-z0-9]\+', '', '')
  let fold_len = v:foldend - v:foldstart + 1
  let len_text = ' ['.fold_len.'] '
  return short_text.len_text.repeat(' ', 500)
endfunction

setlocal foldtext=TaskwikiFoldText()
