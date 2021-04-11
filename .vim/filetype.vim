if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au!
    au BufNewFile,BufRead		*.jsm                               setf javascript
    au BufNewFile,BufRead		*.json                              setf json
    au BufNewFile,BufRead		*.asm,*.ASM                         setf masm
    au BufNewFile,BufRead		*.asy                               setf asy
    au BufNewFile,BufRead		*/python/pyexe/*                    setf python
    au BufRead					*access[._]log*                     setf httplog
    au BufRead					*/.getmail/*rc                      setf getmailrc
    au BufRead					.msmtprc                            setf msmtp
    au BufNewFile,BufRead		.htaccess.*                         setf apache
    au BufRead					/var/log/*                          setf messages
    au BufRead					/var/log/*.log*                     setf messages
    au BufRead					/var/log/nginx/*                    setf messages
    au BufNewFile,BufRead		*.rfc                               setf rfc
    au BufNewFile,BufRead		*.md                                setf markdown
    au BufRead					grub.cfg                            setf sh
    au BufNewFile,BufRead		*.wiki                              setf vimwiki
    au BufNewFile,BufRead		mimeapps.list                       setf desktop
	au BufNewFile,BufRead		*.pgsql								setf pgsql
    au BufRead					*tmux.conf                          setf tmux
    au BufRead					rc.conf*                            setf sh
    au BufRead					*.grf,*.url                         setf dosini
    au BufNewFile,BufRead		*.install,install,.INSTALL          setf sh
    au BufNewFile,BufRead		*/xorg.conf.d/*                     setf xf86conf
    au BufNewFile,BufRead		hg-editor-*.txt                     setf hgcommit
    au BufNewFile,BufRead		*openvpn*/*.conf,*.ovpn             setf openvpn
    au BufNewFile,BufRead		*.pxi                               setf pyrex
    au BufNewFile,BufRead		*.io                                setf io
    au BufRead					*procmaillog                        setf mail
    au BufNewFile,BufRead		pf.conf*,*/pf.d/*                   setf pf
    au BufNewFile,BufRead		*/php-fpm.conf,*/*php-fpm.d/*		set syntax=dosini
    au BufNewFile,BufRead		*/stunnel.conf                      set syntax=cfg
    au BufNewFile,BufRead		$HOME/.vim/dict/*.txt,$VIM/vimfiles/dict/*.txt  setf dict
    au BufNewFile,BufRead		nginx.conf*,*/nginx/*/* setf nginx
    let g:do_filetype = 0
    au BufWinEnter,BufAdd   * if expand('<afile>') == "" | let g:do_filetype = 1 | endif
    au BufEnter             * if g:do_filetype | setf sh | let g:do_filetype = 0 | endif
augroup END
