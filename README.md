# Aqua Emacs

[Eason Huang](https://eason0210.github.io/)'s Emacs, include [configs](https://github.com/Eason0210/Aquaemacs/tree/master/site-lisp/config) and [extensions](https://github.com/Eason0210/Aquaemacs/tree/master/site-lisp/extensions).

## Download Source Code
1. Download Aquaemacs source code:
```
git clone https://github.com/Eason0210/Aquaemacs.git
```

2. Fetch all submodules in Aquaemacs:
```
git submodule update --init --recursive

git submodule foreach git reset --hard

git submodule foreach git checkout master
```

## Install On Mac

1. Download emacs git code
```
$ git clone --depth 1 git://git.savannah.gnu.org/emacs.git
```

2. Install compile dependencies
```
$ brew install autoconf automake texinfo gnutls pkg-config libxml2 --debug --verbose
```

3. Compile emacs git
```
$ cd ./emacs && ./autogen.sh

$ export LDFLAGS="-L/usr/local/opt/libxml2/lib"
$ export CPPFLAGS="-I/usr/local/opt/libxml2/include"
$ export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

$ ./configure && make && make install
```

4. Install in launcher:

    open -R nextstep/Emacs.app

    and dragging Emacs to the Applications folder.

5. Add config in ~/.emacs
```Elisp
(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/Aquaemacs/site-lisp/")

(require 'init)
```

## Install On Arch Linux
1. Install emacs git version:
```
sudo pacman -S emacs-native-comp-git
```

2. Install dependency for [EAF](https://github.com/manateelazycat/emacs-application-framework):
```
sudo pacman -S python-pyqt5 python-pyqt5-sip python-pyqtwebengine python-xlib python-qrcode python-feedparser python-dbus python-pyinotify python-markdown
yay -S python-pymupdf python-grip
```
3. Build my config symlink to emacs directory:
```
sudo ln -s /home/username/Aquaemacs/site-lisp /usr/share/emacs/Aqua
```

4. Copy site-start.el in emacs directory to start my config:
```
sudo cp /home/username/Aquaemacs/site-start.el /usr/share/emacs/site-lisp/
```

5. Start emacs:
```
emacs
```

## Thanks Lazycat

This config is forked from [AndyStewart](http://www.emacswiki.org/emacs/AndyStewart)'s [Lazycat Emacs](https://github.com/manateelazycat/lazycat-emacs), only for personal use.if you like it, please go to support him.

## License

Aqua Emacs is licensed under [GPLv3](LICENSE).
