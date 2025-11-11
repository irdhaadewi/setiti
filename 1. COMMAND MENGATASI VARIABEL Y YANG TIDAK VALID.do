*CARA MENGATASI DATA YANG TIDAK VALID
pwcorr y_01 y_02 y_03 y_04 y_05 y_06 y_07 y_08 y_09 y_010 y_011 y_012 y_013 y_014 y_015 y_016 y_017 y_018 y, sig
drop y_01 
drop y_02 
drop y_04 
drop y_05
drop y_010
drop y_011
drop y_013
drop y_014
drop y_015
drop y_016
drop y_017
pwcorr y_03 y_06 y_07 y_08 y_09 y_012 y_018 y, sig
*setelah drop variabel yang signifikansinya >0.05 didapatkan beberapa indikator variabel yang valid, yaitu variabel y_03, y_06, y_07, y_08, y_09, y_012, y_018
