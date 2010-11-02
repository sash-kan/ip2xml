#!/bin/sed -rf

# remove garbage
s/\\ / /g
s/ +/ /g
tbug;:bug

# start
s!: <([^>]*)>! flags \1!
ti

# address
s/^([0-9]*): ([^ ]*) (.*) \2$/\1: \2 \3/
s! scope global ([^ ]+) ! scope global-\1 !
s!^([0-9]*): ([^ ]*) (.*)$!\3 /interfaces/interface/address/!
ba

# interface
:i
s!/!-!
s!^([0-9]*): ([^ ]*) (.*)$!\3 name \2 index \1 /interfaces/interface/!

:a
s/^/ /
x

# main cycle throw line
:c
G
h
s/ ([^\n ]+) ([^\n ]+) ([^\n ]+)$/ \3/
x
s/.* ([^\n ]+) ([^\n ]+) ([^\n ]+)/\3\1=\2/
tc

s/^.*\n//
#x
G
x
s/.*//
x

s/\n\n[^\n]*$//
s/^ //
