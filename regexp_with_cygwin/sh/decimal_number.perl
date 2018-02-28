# un nombre decimal
#PATTERN="^.?([[:digit:]]+(\\.[[:digit:]]*)?|\\.[[:digit:]]+)$"
PATTERN="^-?[[:digit:]]+(,[[:digit:]]+)*(\.[[:digit:]]+(e[[:digit:]]+)?)?$"
#PATTERN_SED="^.?([0-9]+(\\.[0-9]*)?|\\.[0-9]+)$"
PATTERN_SED="^-\?[0-9]\+\(,[0-9]\+\)*\(\.[0-9]\+\(e[0-9]\+\)\?\)\?$"
#PATTERN_MAWK="^.?([0-9]+(\\.[0-9]*)?|\\.[0-9]+)$"
PATTERN_MAWK="^-?[0-9]+(,[0-9]+)*(\.[0-9]+(e[0-9]+)?)?$"
#PATTERN_PYTHON="^.?(\\d+(\\.\\d*)?|\\.\\d+)$"
PATTERN_PYTHON="^-?\d+(,\d+)*(\.\d+(e\d+)?)?$"
