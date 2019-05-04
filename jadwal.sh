#!/bin/bash

#Gausah Ganti Author Kalo Mau Dihargain
#Ingat Anda Nub Kalo Masih Ganti Author
#Trigged ? Jancox koe !
#awokaowka 
#recode ? Dosa gblk cuman jadwal sholat di recode ! :V

cyan='\e[0;36m'
green='\e[0;34m'
yell='\e[1;33m'
merah='\e[1;31m'
putih='\e[1;37m'

pusat="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"

dapatkan(){
	curl -s -A "${pusat}" "https://time.siswadi.com/pray/${kota}" >> hasil.lst
	if [[ $(cat hasil.lst) =~ "invalid address g88" ]]; then
		echo "[!] Kota Gak Ada COK ! "
	else
		waktuShubuh=$(cat hasil.lst | grep -Po '(?<="Fajr": ").*?(?=")')
		waktuDzuhur=$(cat hasil.lst | grep -Po '(?<="Dhuhr": ").*?(?=")')
		waktuAshar=$(cat hasil.lst | grep -Po '(?<="Fajr": ").*?(?=")')
		waktuMaghrib=$(cat hasil.lst | grep -Po '(?<="Maghrib": ").*?(?=")')
		waktuIsya=$(cat hasil.lst | grep -Po '(?<="Isha": ").*?(?=")')
		waktustm=$(cat hasil.lst | grep -Po '(?<="SepertigaMalam": ").*?(?=")')
		waktutm=$(cat hasil.lst | grep -Po '(?<="TengahMalam": ").*?(?=")')
		waktudtm=$(cat hasil.lst | grep -Po '(?<="DuapertigaMalam": ").*?(?=")')

        
		echo  $green"Tanggal  : $merah`date`"
		echo  $green"Kota     : $cyan$kota"
        echo ""
		echo  $green"======================================================"
		echo  $cyan"Shubuh  : $merah$waktuShubuh    |  $cyan Sepertiga Malam  : $merah$waktustm"
		echo  $cyan"Dzuhur  : $merah$waktuDzuhur    |  $cyan Duapertiga Malam : $merah$waktudtm"
		echo  $cyan"Ashar   : $merah$waktuAshar"
        echo  $cyan"Magrib  : $merah$waktuMaghrib"   
		echo  $cyan"Isya    : $merah$waktuIsya"
        echo  $green"======================================================"
		
	fi
}

banner(){
echo  $putih"     (*           [Jadwal Sholat] "
echo  $putih"    _|_        $merah Author : Nii-san Haxor Ft Mr.D374VU"
echo  $putih"   /   \       $merah Team   : IndoSec | BekasiSec"
echo  $putih"  /     \      $merah Since  : 2017 "
echo  $putih" |_______| .v.1"
echo  $green"======================================================"
echo ""
}

clear
echo  $putih"     (*           [Jadwal Sholat] "
echo  $putih"    _|_        $merah Author : Nii-san Haxor Ft Mr.D374VU"
echo  $putih"   /   \       $merah Team   : IndoSec | BekasiSec"
echo  $putih"  /     \      $merah Since  : 2017 "
echo  $putih" |_______| .v.1"
echo ""
read -p " Nama Kota : " kota;
clear
banner
dapatkan
rm -f hasil.lst
