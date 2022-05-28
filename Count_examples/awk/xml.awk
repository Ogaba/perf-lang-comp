#!/usr/local/bin/gawk -f
#* h**************************************************************************#
# Script gawk : XML formatting functions
#
# Author........... : OGA
# Created.......... : 2004-11-03
# Modified......... : 2019-09-29
# Notes............ : Version 1.0
# Version GNU awk.. : 3+
#**************************************************************************h *#

BEGIN	{
}

function odd(x)  {return x % 2}

function even(x) {return ! odd(x)}

function replace_blank(x){
         return sprintf ("%s", gensub(" ","","g",x))
}

function xml_element(x)  {
	split (x, tab, "=")
	x2 = ""
	for (tabtmp in tab) {
		if (even(tabtmp)) {
			_balise = replace_blank(tab[tabtmp-1]);
			x2 = sprintf("<%s>%s</%s>",_balise,tab[tabtmp],_balise)
		}
	}
	return x2
}

function xml_header(algorithm,xmlxsl) {
	return sprintf ("%s\n%s%s%s\n%s\n<DATE>%s</DATE>\n<ALGORITHM>%s</ALGORITHM>\n%s","<?xml version=\"1.0\" encoding=\"UTF-8\"?>","<?xml-stylesheet type=\"text/xsl\" href=\"",xmlxsl,"\"?>","<body>",strftime(),algorithm,"<ROWSET>")
}

function xml_bottom(log_names,most_hash) {
	return sprintf ("<LOG_NAMES>%s</LOG_NAMES>\n<MOST_PROBABLE_CORRECT_HASH>%s</MOST_PROBABLE_CORRECT_HASH>\n%s\n%s",log_names,most_hash,"</ROWSET>","</body>")
}

END	{
}
