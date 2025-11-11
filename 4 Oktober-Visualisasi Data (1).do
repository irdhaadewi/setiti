import excel "C:\Users\asus\Downloads\BINER.xlsx", sheet("Sheet1") firstrow clear
gen Perempuan=0
replace Perempuan=1 if gender == 0
gen Laki_laki=0
replace Laki-laki=1 if gender == 1
replace Laki_laki=1 if gender == 1
gen Tidak_Menjawab=0
replace Tidak_Menjawab=1 if gender == 2
graph bar Perempuan Laki_laki Tidak Menjawab, bargap(3) ytitle(Jumlah responden) title(Gender)
graph bar Perempuan Laki_laki Tidak_Menjawab, bargap(3) ytitle(Jumlah responden) title(Gender)
use "C:\Users\asus\Downloads\SETITITITII.dta", clear
import excel "C:\Users\asus\Downloads\BINER.xlsx", sheet("Sheet1") firstrow clear
gen Islam=0
replace Islam=1 if agama==1
gen Protestan=0
replace Protestan=1 if agama==2
gen Katolik=0
replace Katolik=1 if agama==3
gen Tidak_menjawab=0
replace Tidak_menjawab=1 if agama==6
graph bar Islam Protestan Katolik Tidak_menjawab, bargap(4) ytitle(Jumlah responden) title(Agama)
graph bar Islam Protestan Katolik Tidak_menjawab, bargap(4) ytitle(Jumlah responden) title(Agama)
gen Single=0
replace Single=1 if status==0
gen In_a_relationship=0
replace In_a_relationship=1 if status==1
graph bar Single In_a_relationship, bargap(2) ytitle(Jumlah responden) title(Status Hubungan)
gen income_500=0
replace income_500=1 if income==1
gen income_500_1000=0
replace income_500_1000=1 if income==2
gen income_1000_2000=0
replace income_1000_2000=1 if income==3
gen income_3000=0
drop income_3000
gen income_3000=0
graph bar income_500 income_500_1000 income_1000_2000 income_3000, bargap(4) ytitle(Jumlah responden) title(Pendapatan per Bulan)
gen spending_500=0
replace spending_500=1 if spending==1
gen spending_500_1000=0
replace spending_500_1000=1 if spending==2
gen spending_1000_2000=0
replace spending_1000_2000=1 if spending==3
gen spending_3000=0
graph bar spending_500 spending_500_1000 spending_1000_2000 spending_3000, bargap(4) ytitle(Jumlah responden) title(Pengeluaran per Bulan)
gen Yogyakarta=0
replace Yogyakarta=1 if dom==0
gen Semarang=0
replace Semarang=1 if dom==1
gen Surakarta=0
replace Surakarta=1 if dom==2
gen Magelang=0
replace Magelang=1 if dom==3
gen Wonogiri=0
replace Wonogiri=1 if dom==4
graph bar Yogyakarta Semarang Surakarta Magelang Wonogiri, bargap(4) ytitle(Jumlah responden) title(Domisili)
