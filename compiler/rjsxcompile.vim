if exists('current_compiler')
  finish
endif
let current_compiler = 'rjsxcompile'

if exists(":CompilerSet") != 2
  command! -nargs=* CompilerSet setlocal <args>
endif

exe 'CompilerSet makeprg=' . escape(join(['emacs','%','--quick','--batch','-l',fnamemodify(expand('<sfile>:p:h'),':p') . 'eload.el']),' ')

CompilerSet errorformat=%f\ line\ %l:\ %m,%-G%.%#
