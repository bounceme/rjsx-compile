if exists('current_compiler')
  finish
endif
let current_compiler = 'rjsxcompile'

if exists(":CompilerSet") != 2
  command! -nargs=* CompilerSet setlocal <args>
endif

exe 'CompilerSet makeprg=' . escape(join(['emacs','%','--quick','--batch','--eval='
      \ .'\"(progn(package-initialize)(require ''rjsx-mode)'
      \ .'(setq js2-include-node-externs t js2-include-rhino-externs t js2-include-browser-externs t js2-strict-missing-semi-warning nil)'
      \ .'(rjsx-mode)(js2-reparse)(js2-display-error-list)'
      \ .'(princ(with-current-buffer \\\"*js-lint*\\\"'
      \ .'(replace-regexp-in-string \\\"^\\\" \\\"% \\\" (buffer-substring-no-properties(point-min)(point-max)))))(terpri))\"']),' ')

CompilerSet errorformat=%f\ line\ %l:\ %m
