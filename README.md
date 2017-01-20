# rjsx-compile

### Requirements:

emacs >= 24 with [rjsx-mode](https://github.com/felipeochoa/rjsx-mode) installed from melpa
- easiest way to install: `emacs --quick --batch --eval "(progn(require 'package) (package-initialize) (add-to-list 'package-archives '(\"melpa\" . \"http://melpa.milkbox.net/packages/\") t) (setq url-http-attempt-keepalives nil) (package-refresh-contents) (package-install 'rjsx-mode))"`

sed

### Usage:

edit a js/jsx file and run `:compiler rjsxcompile` then `:make`. Use `:copen` to view and navigate the errors

also read `:h compiler`
