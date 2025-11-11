//balik data
import excel "C:\Users\ASUS\Downloads\DATA MENTAH 9_10.xlsx", firstrow clear
recode y_02 (1=5) (2=4) (3=3) (4=2) (5=1), gen(y_2) //untuk ngebalik data kuesioner
recode y_05 (1=5) (2=4) (3=3) (4=2) (5=1), gen(y_5)
recode y_07 (1=5) (2=4) (3=3) (4=2) (5=1), gen(y_7)
recode y_08 (1=5) (2=4) (3=3) (4=2) (5=1), gen(y_8)
recode y_010 (1=5) (2=4) (3=3) (4=2) (5=1), gen(y_10)
recode y_012 (1=5) (2=4) (3=3) (4=2) (5=1), gen(y_12)
recode y_015 (1=5) (2=4) (3=3) (4=2) (5=1), gen(y_15)
recode y_016 (1=5) (2=4) (3=3) (4=2) (5=1), gen(y_16)
recode y_018 (1=5) (2=4) (3=3) (4=2) (5=1), gen(y_18) 

//UJI VALIDITAS
import excel "C:\Users\ASUS\Downloads\BOOK 9_10.xlsx", firstrow clear //DATA yang sudah dibalik
pwcorr x1_1 x1_2 x1_3 x1_4 x1_5 x1_6 x1, sig
pwcorr x2_1 x2_2 x2_3 x2_4 x2_5 x2_6 x2, sig
pwcorr x3_1 x3_2 x3_3 x3_4 x3_5 x3_6 x3, sig
pwcorr y_01 y_2 y_03 y_04 y_5 y_06 y_7 y_8 y_09 y_10 y_011 y_12 y_013 y_014 y_15 y_16 y_017 y_18 y, sig
drop y_2
drop y_03
drop y_011
drop y_16
//percobaan BOOK 2
drop y_2
drop y_03
drop y_011
drop y_18
pwcorr y_01 y_04 y_5 y_06 y_7 y_8 y_09 y_10 y_12 y_013 y_014 y_15 y_16 y_017 y, sig

pwcorr y_01 y_04 y_5 y_06 y_7 y_8 y_09 y_10 y_12 y_013 y_014 y_15 y_017 y_18 y, sig
//valid semua kalo liat koefisien korelasinya --> di atas 0,3
//tapi kalo diliat signifikansinya ada beberapa yang masih di atas 0,05
//drop y2 y3
drop y_2
drop y_03
pwcorr y_01 y_04 y_5 y_06 y_7 y_8 y_09 y_10 y_011 y_12 y_013 y_014 y_15 y_16 y_017 y_18 y, sig
//drop y11 y16
drop y_011
drop y_16
pwcorr y_01 y_04 y_5 y_06 y_7 y_8 y_09 y_10 y_12 y_013 y_014 y_15 y_017 y_18 y, sig

//RELIABILITAS
alpha x1_3 x1_4 x1_5
alpha x2_1 x2_2 x2_3 x2_4 x2_5 x2_6
alpha x3_1 x3_2 x3_3 x3_4 x3_5 x3_6
alpha y_01 y_2 y_03 y_04 y_5 y_06 y_7 y_8 y_09 y_10 y_011 y_12 y_013 y_014 y_15 y_16 y_017 y_18
//kalo nggak drop, koefisien alpha nya kurang dari 0,6 (aman)
//drop y2 y3 y11 y16 aka yang tidak valid
alpha y_01 y_04 y_5 y_06 y_7 y_8 y_09 y_10 y_12 y_013 y_014 y_15 y_017 y_18
drop y_7
alpha y_01 y_04 y_5 y_06 y_8 y_09 y_10 y_12 y_013 y_014 y_15 y_017 y_18
//semua di atas 0,7
//drop 2,3,11,18
alpha y_01 y_04 y_5 y_06 y_8 y_09 y_10 y_12 y_013 y_014 y_15 y_16 y_017 y_18


clear
//REGRESI
import excel "C:\Users\ASUS\Downloads\BOOK 9_10.xlsx", firstrow clear
//data ini cuman x1 sampe x3 yang udah disesuaikan sama hasil validitas dan reabilitas aka udah ada yang di drop
regress y x1 x2 x3 
predict resid, r
swilk resid //normalitas
//prob > 0,05 data berdistribusi normal
vif //multikolineraritas
//mean vif < 10 tidak ada gejala multikolinearitas
estat hettest //heteroscedasticty
//p < 0,05 ada hetero, harusnya lebih dari 0,05
//p > 0,05 homo
estat ovtest //linearitas
//p>0,05 model linier
reg y x1 x2 x3 //regresi
//prob t < 0,05 signifikan --> parsial
//prob F < 0,05 signifikan --> simultan

import excel "C:\Users\ASUS\Downloads\pkm coba lagi.xlsx", firstrow clear
//data ini ada x4 nya
regress y x1 x2 x3 x4
redict resid, r
swilk resid //normalitas
//prob > 0,05 data berdistribusi normal
vif //multikolineraritas
//mean vif < 10 tidak ada gejala multikolinearitas
estat hettest //heteroscedasticty
//p < 0,05 ada hetero, harusnya lebih dari 0,05
//p > 0,05 homo
estat ovtest //linearitas
//p>0,05 model linier
reg y x1 x2 x3 x4 //regresi
//prob t < 0,05 signifikan

//CFA MODEL
import excel "C:\Users\ASUS\Downloads\BOOK 3.xlsx", firstrow clear

sem (x1_1 x1_2 x1_3 x1_4 x1_5 x1_6 <- X1) (x2_1 x2_2 x2_3 x2_4 x2_5 x2_6 <- X2) (x3_1 x3_2 x3_3 x3_4 x3_5 x3_6 <-X3), standardized

sem (x1_1 x1_2 x1_3 x1_4 x1_5 x1_6 <- X1) (x2_1 x2_2 x2_3 x2_4 x2_5 x2_6 <- X2) (x3_1 x3_2 x3_3 x3_4 x3_5 x3_6 <-X3) (y_01 y_04 y_5 y_06 y_8 y_09 y_10 y_12 y_013 y_014 y_15 y_017 y_18 <- Y), standardized
sem,standardized
sem (x1_1 x1_2 x1_3 x1_4 x1_5 x1_6 <- X1) (x2_1 x2_2 x2_3 x2_4 x2_5 x2_6 <- X2) (x3_1 x3_2 x3_3 x3_4 x3_5 x3_6 <-X3), standardized
estat eqgof
estat gof,stats(all)

sem (y_01 y_04 y_5 y_06 y_8 y_09 y_10 y_12 y_013 y_014 y_15 y_017 y_18 <- Y), standardized
estat eqgof
estat gof,stats(all)
//tanpa drop y
sem (y_01 y_2 y_03 y_04 y_5 y_06 y_7 y_8 y_09 y_10 y_011 y_12 y_013 y_014 y_15 y_16 y_017 y_18 <- Y), standardized


//factor loadings
factor x1_1 x1_2 x1_3 x1_4 x1_5 x1_6
factor x2_1 x2_2 x2_3 x2_4 x2_5 x2_6 
factor x3_1 x3_2 x3_3 x3_4 x3_5 x3_6
factor y_01 y_04 y_5 y_06 y_8 y_09 y_10 y_12 y_013 y_014 y_15 y_017 y_18
//tanpa drop
factor y_01 y_2 y_03 y_04 y_5 y_06 y_7 y_8 y_09 y_10 y_011 y_12 y_013 y_014 y_15 y_16 y_017 y_18
