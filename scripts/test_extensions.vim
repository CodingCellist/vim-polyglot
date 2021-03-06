function! TestExtension(filetype, filename, content)
  try
    let g:message = ""
    exec "noautocmd n " . a:filename
    put =a:content
    1delete _
    filetype detect
    exec "if &filetype != '" . a:filetype . "' \nthrow &filetype\nendif"
    exec ":bw!"
  catch
    echo g:message
    echo 'Filename "' . a:filename  . '" does not resolve to extension "' . a:filetype . '"'
    echo '  instead received: "' . v:exception . '"'
    exec ':cq!'
  endtry
endfunction

call TestExtension('sh', 'bash1', "#!/bin/bash")
call TestExtension('sh', 'bash2', "#! /bin/bash")
call TestExtension('sh', 'bash3', "#! /bin/bash2.3")
call TestExtension('sh', 'bash4', "#!/usr/bin/env bash")
call TestExtension('sh', 'bash6', "#!/usr/bin/env -i -=split-string foo=bar bash -l foo")
call TestExtension('sh', 'bash1', "#!/bin/bash")

" Vim help file
call TestExtension('help', $VIMRUNTIME . '/doc/foobar.txt', '')

" Abaqus or Trasys
call TestExtension('abaqus', 'foobar.inp', "*HEADING\nFoobar")
call TestExtension('trasys', 'foobar.inp', "MSC PATRAN\n* foobar\nHEADER SURFACE DATA\nBSC ENCLO1")

" 8th (Firth-derivative)
call TestExtension('8th', 'foobar.8th', '')
call TestExtension('8th', 'foobar.8th', '')

" A-A-P recipe
call TestExtension('aap', 'foobar.aap', '')


" A2ps printing utility
call TestExtension('a2ps', '/etc/a2ps.cfg', '')
call TestExtension('a2ps', '/usr/local/etc/a2ps.cfg', '')
call TestExtension('a2ps', '/etc/a2ps/foobar.cfg', '')
call TestExtension('a2ps', '/usr/local/etc/a2ps/foobar.cfg', '')
call TestExtension('a2ps', '/tmp/a2psrc', '')
call TestExtension('a2ps', '/tmp/.a2psrc', '')

" ABAB/4
call TestExtension('abap', 'foobar.abap', '')

" ABC music notation
call TestExtension('abc', 'foobar.abc', '')

" ABEL
call TestExtension('abel', 'foobar.abl', '')

" AceDB
call TestExtension('acedb', 'foobar.wrm', '')

" Ada (83, 9X, 95)
call TestExtension('ada', 'foobar.adb', '')
call TestExtension('ada', 'foobar.ads', '')
call TestExtension('ada', 'foobar.ada', '')
call TestExtension('ada', 'foobar.gpr', '')

" AHDL
call TestExtension('ahdl', 'foobar.tdf', '')

" AIDL
call TestExtension('aidl', 'foobar.aidl', '')

" AMPL
call TestExtension('ampl', 'foobar.run', '')

" Ant
call TestExtension('ant', 'build.xml', '')

" Arduino
call TestExtension('arduino', 'foobar.ino', '')
call TestExtension('arduino', 'foobar.pde', '')

" Apache config file
call TestExtension('apache', '.htaccess', '')
call TestExtension('apache', '/etc/httpd/foobar.conf', '')
call TestExtension('apache', '/etc/apache2/sites-foobar/foobar.com', '')
call TestExtension('apache', '/usr/local/etc/httpd/foobar.conf', '')
call TestExtension('apache', '/usr/local/etc/apache2/sites-foobar/foobar.com', '')

" XA65 MOS6510 cross assembler
call TestExtension('a65', 'foobar.a65', '')

" Applescript
call TestExtension('applescript', 'foobar.scpt', '')

" Applix ELF
call TestExtension('elf', 'foobar.am', '')
call TestExtension('automake', 'Makefile.am', '')
call TestExtension('automake', 'makefile.am', '')

" ALSA configuration
call TestExtension('alsaconf', '.asoundrc', '')
call TestExtension('alsaconf', '/usr/share/alsa/alsa.conf', '')
call TestExtension('alsaconf', '/media/foo/usr/share/alsa/alsa.conf', '')
call TestExtension('alsaconf', '/etc/asound.conf', '')
call TestExtension('alsaconf', '/media/foo/etc/asound.conf', '')

" Arc Macro Language
call TestExtension('aml', 'foobar.aml', '')

" APT config file
call TestExtension('aptconf', 'apt.conf', '')
call TestExtension('aptconf', '/root/.aptitude/config', '')
call TestExtension('aptconf', '/etc/apt/apt.conf.d/foo_bar-12', '')
call TestExtension('aptconf', '/etc/apt/apt.conf.d/foo_bar-12.conf', '')
call TestExtension('', '/etc/apt/apt.conf.d/.gsdf', '')

" Arch Inventory file
call TestExtension('arch', '.arch-inventory', '')
call TestExtension('arch', '=tagging-method', '')

" ART*Enterprise (formerly ART-IM)
call TestExtension('art', 'foobar.art', '')

" AsciiDoc
call TestExtension('asciidoc', 'foobar.asciidoc', '')
call TestExtension('asciidoc', 'foobar.adoc', '')

" ASN.1
call TestExtension('asn', 'foobar.asn', '')
call TestExtension('asn', 'foobar.asn1', '')

" Active Server Pages (with Visual Basic Script)
call TestExtension('aspvbs', 'foobar.asa', '')
let g:filetype_asa = 'fizfuz'
call TestExtension('fizfuz', 'foobar.asa', '')

" Active Server Pages (with Perl or Visual Basic Script)
call TestExtension('aspvbs', 'vbs.asp', "")
call TestExtension('aspperl', 'perl.asp', "<Job ID=\"DropFiles\">\n<script language=\"PerlScript\">\n</script>\n</Job>")
let g:filetype_asp = 'fizfuz'
call TestExtension('fizfuz', 'fizfuz.asp', '')


" Grub (must be before catch *.lst)
call TestExtension('grub', '/boot/grub/menu.lst', '')
call TestExtension('grub', '/media/foobar/boot/grub/menu.lst', '')
call TestExtension('grub', '/boot/grub/grub.conf', '')
call TestExtension('grub', '/media/foobar/boot/grub/grub.conf', '')
call TestExtension('grub', '/etc/grub.conf', '')
call TestExtension('grub', '/media/foobar/etc/grub.conf', '')

" Assembly (all kinds)
" *.lst is not pure assembly, it has two extra columns (address, byte codes)

au BufNewFile,BufRead *.asm,*.[sS],*.[aA],*.mac,*.lst	call dist#ft#FTasm()

" Macro (VAX)
call TestExtension('vmasm', 'foobar.mar', '')

" Atlas
call TestExtension('atlas', 'foobar.atl', '')
call TestExtension('atlas', 'foobar.as', '')

" Autoit v3
call TestExtension('autoit', 'foobar.au3', '')

" Autohotkey
call TestExtension('autohotkey', 'foobar.ahk', '')

" Automake
call TestExtension('automake', 'Makefile.am', '')
call TestExtension('automake', 'makefile.am', '')
call TestExtension('automake', 'GNUmakefile.am', '')

" Autotest .at files are actually m4
call TestExtension('m4', 'foobar.at', '')

" Avenue
call TestExtension('ave', 'foobar.ave', '')

" Awk
call TestExtension('awk', 'foobar.awk', '')

" vim-polyglot only
call TestExtension('blade', 'test.blade.php', '')
call TestExtension('yaml.ansible', 'playbook.yml', '')
call TestExtension('yaml.ansible', 'host_vars/foobar', '')
call TestExtension('yaml.ansible', 'handlers.foobar.yaml', '')
call TestExtension('yaml.ansible', 'requirements.yaml', '')
call TestExtension('ps1xml', 'foobar.ps1xml', '')
call TestExtension('terraform', 'terraform.tf', '')

" .m extension
call TestExtension('octave', 'matlab.m', '')
call TestExtension('objc', 'objc.m', "\n\n  #import <Foundation/Foundation.h>")
call TestExtension('octave', 'objc.m', "results_ub_times=zeros(2,2,M);\n%results pour la lower bound")
call TestExtension('mma', 'mathematica.m', "newcase[ \"00003\" ];\n  (* Hello world *)")
call TestExtension('murphi', 'murphi.m', "type\n  square: 1 .. 9")
call TestExtension('murphi', 'murphi.m', "something\n--foobar")
call TestExtension('octave', 'percentcomment.m', "hello world\n%foobar")
call TestExtension('objc', 'comment.m', "\n/* Hello world */")
let g:filetype_m = 'fizfuz'
call TestExtension('fizfuz', 'fizfuz.m', '')

" .fs extension
call TestExtension('forth', 'empty.fs', '')
call TestExtension('fsharp', 'fsharp.fs', "let myInt = 5")
call TestExtension('glsl', 'glsl.fs', "//#version 120\nvoid main() {}")
let g:filetype_fs = 'fizfuz'
call TestExtension('fizfuz', 'fizfuz.fs', '')

" .re extension
call TestExtension('reason', 'empty.re', '')
call TestExtension('cpp', 'cpp.re', '#include "config.h"')
call TestExtension('cpp', 'cpp2.re', '#ifdef HAVE_CONFIG_H')
call TestExtension('cpp', 'cpp3.re', '#define YYCTYPE unsigned char')
call TestExtension('reason', 'react.re', 'ReasonReact.Router.push("");')
