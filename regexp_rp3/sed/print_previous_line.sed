#!/usr/bin/sed -f
#* h**************************************************************************#
# sed script to print previous line from a regular expression match
#
# Author........... : OGA
# Created.......... : 2008-05-02
# Modified......... :
# Notes............ :
#**************************************************************************h *#
2,${
/envoi_grep/{
x
p
x
}
}
h
