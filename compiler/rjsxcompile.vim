if exists('current_compiler')
  finish
endif
let current_compiler = 'rjsxcompile'

if exists(":CompilerSet") != 2
  command! -nargs=* CompilerSet setlocal <args>
endif

exe 'CompilerSet makeprg=' . escape(join(['emacs','%','--quick','--batch',
      \ '--eval=\"(progn(package-initialize)'
      \ ."(require 'rjsx-mode)"
      \ .'(setq js2-include-node-externs t js2-include-rhino-externs t js2-include-browser-externs t js2-strict-missing-semi-warning nil)'
      \ .'(rjsx-mode)(js2-reparse)(js2-display-error-list)'
      \ .'(princ(with-current-buffer \\\"*js-lint*\\\"(buffer-substring-no-properties(point-min)(point-max))))(terpri))\"']),' ')

CompilerSet errorformat=line\ %l:\ %m

function! s:QfMakePath()
  call setqflist(map(filter(getqflist(),'v:val.lnum'),'extend(v:val,{"filename": expand("%:p")})'))
endfunction

function! s:LocMakePath()
  call setloclist(1,map(filter(getloclist(1),'v:val.lnum'),'extend(v:val,{"filename": expand("%:p")})'))
endfunction

augroup rjsx
  au!
  au QuickfixCmdPost make,cgetfile let s:event = 'Qf'
  au QuickfixCmdPost lmake,lgetfile let s:event = 'Loc'
  au QuickfixCmdPost <buffer> if type(get(s:,'event')) | exe 'call s:' . s:event . 'MakePath()' | unlet s:event | endif
augroup END
