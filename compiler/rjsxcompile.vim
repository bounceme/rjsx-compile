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
      \ .'(rjsx-mode)(js2-reparse t)(js2-display-error-list)'
      \ .'(princ(with-current-buffer \\\"*js-lint*\\\"(buffer-substring-no-properties(point-min)(point-max))))(terpri))\"']),' ')

CompilerSet errorformat=line\ %l:\ %m

function s:QfMakePath()
   let qflist = getqflist()[1:]
   for i in qflist
      let i.filename = expand('%:p')
   endfor
   call setqflist(qflist)
endfunction

function s:LocMakePath()
   let loclist = getloclist(1)[1:]
   for i in loclist
      let i.filename = expand('%:p')
   endfor
   call setloclist(1,loclist)
endfunction

augroup rjsx
  au!
  au QuickfixCmdPost make call s:QfMakePath()
  au QuickfixCmdPost lmake call s:LocMakePath()
augroup END
