# rjsx-compile

A es6+ / jsx / rhino compatible "linter"

Reports detailed error messages from https://github.com/mozilla/rhino/blob/0ce17ecd3cb466d25f8d68b8f061ad23c77e8712/src/org/mozilla/javascript/resources/Messages.properties as well as ones specific to jsx.

### Requirements:

emacs >= 24 with [rjsx-mode](https://github.com/felipeochoa/rjsx-mode) installed from melpa
- easiest way to install: <pre>emacs --quick --batch --eval="(progn(require 'package) (package-initialize) (add-to-list 'package-archives '(\"melpa\" . \"http://melpa.milkbox.net/packages/\") t) (setq url-http-attempt-keepalives nil) (package-refresh-contents) (package-install 'rjsx-mode))"</pre>

### Usage:

edit a js/jsx file and run `:compiler rjsxcompile` then `:make`. Use `:copen` to view and navigate the errors

also read `:h compiler`
