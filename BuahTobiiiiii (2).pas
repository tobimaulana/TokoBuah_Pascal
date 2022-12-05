PROGRAM Harga_buah_berdasarkan_kualitas;
uses crt;

const max=100;

PROCEDURE DAFTBUAH;
    Begin
    	 writeln('                             _____________________________________________');
    	 writeln('                             I                 DAFTAR BUAH               I');
    	 writeln('                             I            =====================          I');
    	 writeln('                             I                                           I');
    	 writeln('                             I                                           I');
    	 writeln('                             I   1. Apel Fuji Kualitas Bagus    - [FB]   I');
    	 writeln('                             I   2. Apel Fuji Kualitas Sedang   - [FS]   I');
    	 writeln('                             I   3. Apel Malang Kualitas Bagus  - [MB]   I');
    	 writeln('                             I   4. Apel Malang Kualitas Sedang - [MS]   I');
    	 writeln('                             I                                           I');
    	 writeln('                             I___________________________________________I');
    End;

Type
    tanggal=record
    hari,bulan:string;
    tgl,tahun:integer;
    End;

Type
    data=record
    jenis:string[20];
    hpkg:real;
    jml:integer;
    totalll:real;
    End;

Type blnj=record
     jns:string[30];
     hkilo:real;
     jkg:integer;
     tothrg:real;
     end;
     transaksi=array[1..max] of blnj;

Type Huruf = String[100];

Function Garis : Huruf;
Begin
     Garis := '===========================================================';
end;

VAR
   napem:string;
   i,j:integer;
   pmbl:array[1..50] of string [20];
   waktu:tanggal;
   PIL:CHAR;
   hasil,kembalian,bayar:real;
   a,jumlah,kg:integer;
   kode:string;
   harga:array[1..4] of real;
   total:array[1..4] of real;
   apel:array[1..100] of data;
   jenis:string[20];
   totalpembelian,tot,kembali:real;
   buy:transaksi;
   n,tampil,indexs,x,seqsearch1:integer;
   maks,min,rata,jmlh:real;
   temp:blnj;
   ulang:integer;

PROCEDURE Rekursi;
          Begin
          IF ulang<5 THEN
          BEGIN
          writeln('                                     ---STAY SAFE , STAY HEALTHY---');
          writeln;
          ulang:=ulang + 1;
          Rekursi;
          END;
          End;


LABEL AWAL,AKHIR,IDBL,IDBL2,UANG,CARI,SORTIR,STRUK,KELUAR;

BEGIN
TEXTBACKGROUND(white);
clrscr;
TEXTCOLOR(blue);

Gotoxy(40,5);
writeln('Kelas : Sistem Informasi 19-A2');
Gotoxy(40,8);
writeln('NIM   : 190101058');
Gotoxy(40,11);
writeln('Nama  : Tobi Fiambodo Syech Maulana');
Gotoxy(40,18);
writeln('TUGAS PROJECT PROGRAM PASCAL');
Gotoxy(30,21);
writeln('Mata Kuliah Algoritma Pemrograman & Struktur Data');
Gotoxy(44,30);
writeln('Fakultas Ilmu Komputer');
Gotoxy(38,33);
writeln('Universitas Duta Bangsa Surakarta');
readln;

     AWAL:
	  CLRSCR;
	          TEXTBACKGROUND(7);
	          TEXTCOLOR(9);
          writeln;
          writeln;
          writeln;
	  WRITELN('                                           TOKO BUAH APEL MAS TOBI');
	  writeln('                        Jl. Sungai Musi 7, Demangan, Sangkrah RT 02 RW 12 Surakarta');
	  write('                        '); WRITELN(Garis);
	  WRITELN;
	  writeln;
          writeln;
          writeln;
          writeln;
                 TEXTCOLOR(9);
	  writeln('                                 _________________________________________');
	  writeln('                                I                ----------               I');
          WRITELN('                                I            >>> MENU UTAMA <<<           I');
	  writeln('                                I                ----------               I');
	  writeln('                                I                                         I');
          WRITELN('                                I  [1].INPUT IDENTITAS & INPUT PEMBELIAN  I');
          writeln('                                I  [2].INPUT PEMBELIAN KE-2*              I');
          WRITELN('                                I  [3].INPUT NOMINAL UANG                 I');
          writeln('                                I  [4].PENCARIAN DATA BELANJA*            I');
	  WRITELN('                                I  [5].PENYORTIRAN DATA BELANJA*          I');
          WRITELN('                                I  [6].CETAK STRUK PEMBELIAN              I');
	  WRITELN('                                I  [7].KELUAR                             I');
	  WRITELN('                                I                                         I');
	  writeln('                                I_________________________________________I');
	  writeln;
          WRITELN('                     *input pembelian ke-2 hanya untuk acuan menu pencarian & penyortiran* ');
          WRITELN('                       *abaikan jika tidak ingin mengakses menu pencarian & penyortiran* ');
	  WRITELN;
          WRITELN;
          writeln;
          writeln;
          WRITELN;
	  WRITE('                                       PILIHAN ANDA [1/2/3/4/5/6/7] :  ');READLN(PIL);


	  IF (PIL='1') THEN GOTO IDBL;
	  IF (PIL='2') THEN GOTO IDBL2;
          IF (PIL='3') THEN GOTO UANG;
          IF (PIL='4') THEN GOTO CARI;
          IF (PIL='5') THEN GOTO SORTIR;
	  IF (PIL='6') THEN GOTO STRUK;
	  IF (PIL='7') THEN GOTO KELUAR;


     IDBL:
	  CLRSCR;
		 TEXTBACKGROUND(7);
	   	 TEXTCOLOR(9);
          writeln;
	  writeln('                                      INPUT IDENTITAS & INPUT PEMBELIAN');
	  writeln('                                      _________________________________');
	  WRITELN;
	  WRITELN;
	  writeln;
          writeln;
	  WRITE('                        Nama Pembeli : '); readln(napem);
	  writeln;
          writeln;
          writeln;

	  	TEXTCOLOR(12);
	  i:=0;
	  REPEAT
	  BEGIN
	  WRITELN('                                 ** Anda Adalah Pembeli Ke-5 Dalam Hari Ini **');
	  i:= i + 1;
	  End;
	  UNTIL i = 3;
	  readln;
          writeln;
          writeln;
          writeln;

		TEXTCOLOR(9);
	  pmbl[1]:= ' Mas Rafii';
	  pmbl[2]:= ' Ridho';
	  pmbl[3]:= ' Ahmad';
	  pmbl[4]:= ' Pak Yanto';

	  i:=4;
	  WHILE i >= 1 DO
	  BEGIN
	  write('                        Pembeli Ke-',i,' Adalah = ', pmbl[i]); writeln;
	  i:=i-1;
          writeln;
	  end;
          readln;

	  writeln;
	  clrscr;
	  	TEXTBACKGROUND(7);
	  	TEXTCOLOR(9);
          writeln;
	  DAFTBUAH;
	  writeln;
          writeln;
	  write('              Masukkan jumlah apel(jenis berbeda) yang akan dibeli : '); readln(jumlah);
	  writeln;

	  FOR a:=1 TO jumlah DO

	      Begin
	  writeln;
	  write('              Masukkan kode jenis apel : '); readln(kode);

	  CASE (kode) of 'FB':

	  BEGIN
	  harga[a]:=40000;
	  writeln('              ===============================================');
	  writeln('                 > Jenis Apel   : Apel Fuji Kualitas Bagus');
 	  writeln('                 > Harga per Kg : Rp. 40.000');
	  write('                 > Berapa Kg yang Ingin Anda Beli : '); readln(kg);

	  total[a]:=harga[a]*kg;
	  hasil:=total[1]+total[2]+total[3]+total[4];
	  kembalian:=bayar-hasil;

	      TEXTCOLOR(4);
	  writeln('                 > Total Harga  : Rp. ',total[a]:5:0); TEXTCOLOR(9);
          writeln('              ===============================================');
	  END;

	  'FS':

	  BEGIN
	  harga[a]:=30000;
	  writeln('              ================================================');
	  writeln('                 > Jenis Apel   : Apel Fuji Kualitas Sedang');
 	  writeln('                 > Harga per Kg : Rp. 30.000');
	  write('                 > Berapa Kg yang Ingin Anda Beli : '); readln(kg);

 	  total[a]:=harga[a]*kg;
	  hasil:=total[1]+total[2]+total[3]+total[4];
	  kembalian:=bayar-hasil;

	       TEXTCOLOR(5);
	  writeln('                 > Total Harga  : Rp. ',total[a]:5:0); TEXTCOLOR(9);
          writeln('              ================================================');
	  END;

	  'MB':

	  BEGIN
	  harga[a]:=25000;
	  writeln('              =================================================');
	  writeln('                 > Jenis Apel   : Apel Malang Kualitas Bagus');
 	  writeln('                 > Harga per Kg : Rp. 25.000');
	  write('                 > Berapa Kg yang Ingin Anda Beli : '); readln(kg);

	  total[a]:=harga[a]*kg;
	  hasil:=total[1]+total[2]+total[3]+total[4];
	  kembalian:=bayar-hasil;

	        TEXTCOLOR(5);
	  writeln('                 > Total Harga  : Rp. ',total[a]:5:0); TEXTCOLOR(9);
          writeln('              ================================================');

	  END;

	  'MS':

	  BEGIN
	  harga[a]:=20000;
	  writeln('              ==================================================');
	  writeln('                 > Jenis Apel   : Apel Malang Kualitas Sedang');
 	  writeln('                 > Harga per Kg : Rp. 20.000');
	  write('                 > Berapa Kg yang Ingin Anda Beli : '); readln(kg);

	  total[a]:=harga[a]*kg;
	  hasil:=total[1]+total[2]+total[3]+total[4];
	  kembalian:=bayar-hasil;

	  	TEXTCOLOR(5);
	  writeln('                 > Total Harga  : Rp. ',total[a]:5:0); TEXTCOLOR(9);
          writeln('              ==================================================');

	  END

	  ELSE

	  BEGIN

	  writeln;
	  	TEXTCOLOR(12);
	  writeln('                               KODE ERROR!!!'); break; TEXTCOLOR(9);

	  END;


	  END
          END;

	  writeln;
                  TEXTCOLOR(4);
	  writeln('                   Total Belanja Anda : Rp. ',hasil:5:0); TEXTCOLOR(9);
	  writeln;
	  writeln;
          writeln('         === Klik Enter Untuk Kembali Ke Menu Utama dan Menyelesaikan Transaksi ==='); readln;

	  GOTO AWAL;


   IDBL2 :
          CLRSCR;
	  	 TEXTBACKGROUND(7);
	   	 TEXTCOLOR(9);
	  WRITELN;
          WRITELN('                                            INPUT PEMBELIAN KE-2');
	  WRITELN('                                            ____________________');
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          write('              SILAHKAN ISI DATA BELANJA ANDA*');
          WRITELN;
          writeln;
                  n:=n+1;
          write('                    -> Jenis Apel yang Dibeli : '); readln(buy[n].jns);
          WRITELN;
          write('                    -> Harga per Kg           : '); readln(buy[n].hkilo);
          writeln;
          write('                    -> Jumlah(Kg) yang Dibeli : '); readln(buy[n].jkg);
          writeln;
          write('                    -> Total Harga            : '); readln(buy[n].tothrg);
          writeln;
          writeln;
          writeln;
          writeln;
          writeln('        *jika Anda membeli lebih dari 1 jenis apel, tekan "ENTER" dan pilih nomor 2 lagi*');
          readln;

          GOTO AWAL;


    UANG :
	  CLRSCR;
	  	 TEXTBACKGROUND(7);
	   	 TEXTCOLOR(9);
	  WRITELN;
	  WRITELN('                                         INPUT NOMINAL UANG');
	  WRITELN('                                         __________________');
	  WRITELN;
	  WRITELN;
	  WRITELN;
          writeln;
          writeln;
          writeln;
	  writeln('              Total Belanja Anda         : Rp. ',hasil:5:0);
	  writeln('              ______________________________________________');
	  writeln;
	  writeln;
	  write('              Masukkan Nominal Uang Anda : Rp. '); readln(bayar);
          writeln;
          writeln;
                  kembalian:=bayar-hasil;
	  writeln('              Kembalian                  : Rp. ',kembalian:5:0);
	  writeln;
	  writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          writeln('          === Klik Enter Untuk Kembali Ke Menu Utama dan Menyelesaikan Transaksi ===');
          readln;

	  GOTO AWAL;


    CARI :
          CLRSCR;
	  	 TEXTBACKGROUND(7);
	   	 TEXTCOLOR(9);
	  writeln;
          WRITELN('                                         PENCARIAN DATA BELANJA');
	  WRITELN('                                         ______________________');
	  WRITELN;
	  WRITELN;
          WRITELN;
                  IF n=0 THEN
                  BEGIN
          writeln('              Silahkan Masukkan Data Belanja Anda'); readln;
                  END;

                  FOR i:=1 TO n DO
          writeln;
          write('                Input Data Ke : '); readln(tampil);
          writeln;

                  indexs:=seqsearch1;
                  IF indexs > 4 THEN
          writeln(x,'TIDAK DITEMUKAN !!! ');
          writeln;
          writeln;
          writeln('                         ---------------------------------------------------------');
          writeln('                                      DATA BELANJA YANG DITAMPILKAN');
          writeln;
          WRITELN('                           -> Jenis Apel yang Dibeli : ',buy[tampil].jns);
          writeln;
          WRITELN('                           -> Harga per Kg           : ',buy[tampil].hkilo:5:0);
          writeln;
          WRITELN('                           -> Jumlah(kg) yang Dibeli : ',buy[tampil].jkg);
          writeln;
          WRITELN('                           -> Total Harga            : ',buy[tampil].tothrg:5:0);
          writeln('                         ---------------------------------------------------------');

                   BEGIN
                   with buy[i] do
                   end;
                   readln;
          GOTO AWAL;


  SORTIR :
          CLRSCR;
	  	 TEXTBACKGROUND(7);
	   	 TEXTCOLOR(9);
	  writeln;
          WRITELN('                                         PENYORTIRAN DATA BELANJA');
	  WRITELN('                                         ________________________');
	  WRITELN;
	  WRITELN;
          writeln;
          writeln;
          writeln;
          writeln('               Data Belanja Sebelum Diurutkan');
          writeln('               ------------------------------');
          writeln;

                   FOR i:=1 TO n DO
                   BEGIN
          writeln('  Total Harga Belanja per Jenis Apel Ke-',i,' Adalah : ',buy[i].tothrg:5:0);
                   END;
          writeln;
                   FOR i:=1 TO n-1 DO
                   BEGIN

                   FOR j:=n downto i+1 DO
                   BEGIN

                   IF buy[j].tothrg < buy[j-1].tothrg THEN
                   BEGIN

                   temp := buy[j];
                   buy[j] := buy[j-1];
                   buy[j-1] := temp;
                   END;
                   END;
                   END;
          writeln;
          writeln;
          writeln('                 Data Belanja Setelah Diurutkan');
          writeln('                 ------------------------------');
          writeln;
          writeln;
          writeln('       Total Harga Belanja per Jenis Apel dari KECIL ke BESAR : ');
          writeln;
                  FOR i:=1 TO n DO
                  BEGIN
          write('       '); writeln(buy[i].tothrg:5:0);
                  END;
          readln;

          GOTO AWAL;


   STRUK :
	  CLRSCR;
	  	 TEXTBACKGROUND(7);
	   	 TEXTCOLOR(9);
	  writeln;
          writeln;
          writeln('                   ~Inputkan belanja Anda terlebih dahulu sebelum cetak struk pembelian~');
          writeln;
          writeln;
	  write('           Jumlah apel(jenis berbeda) yang Dibeli : '); readln(jumlah);
          writeln;

	  FOR i:=1 TO jumlah DO
	  BEGIN
	  writeln('           Input Data Ke-',i);
          writeln('           ==========================================');

	      BEGIN
	  write('                > Jenis Apel   : Apel ');readln(apel[i].jenis);
          write('                > Harga per Kg : Rp. ');readln(apel[i].hpkg);
     	  write('                > Jumlah (Kg)  : ');readln(apel[i].jml);
	      END;
	  writeln;
	  END;
 	  writeln;
          clrscr;
	  	TEXTBACKGROUND(7);
	  	TEXTCOLOR(9);
          writeln;
          writeln('                                            NOTA PEMBELIAN');
	  writeln;
	  writeln('                                       Toko Buah Apel Mas Tobi');
	  writeln('                     Jl. Sungai Musi 7, Demangan, Sangkrah RT 02 RW 12 Surakarta');
	  writeln('                     ___________________________________________________________');
	  writeln;
	  writeln;
                  waktu.hari:= 'Senin';
                  waktu.tgl:=13;
                  waktu.bulan:= 'Juli';
                  waktu.tahun:=2020;

	  Writeln('             Waktu Pembelian : ',waktu.hari,', ',waktu.tgl,' ',waktu.bulan,' ',waktu.tahun,'');
	  writeln('             Nama Pembeli    : ',napem);
	  writeln;
          writeln;


	  writeln('             I No. I    Jenis Apel    I Harga/Kg I Jumlah(kg) I    Total    I');
          writeln('             ----------------------------------------------------------------');
          writeln;

	  BEGIN
	  apel[i].totalll:=0;

	  FOR i:=1 TO jumlah DO
	     BEGIN
	  apel[i].totalll:=apel[i].hpkg*apel[i].jml;
	  write(i:17);
	  write(apel[i].jenis:18);
	  write(apel[i].hpkg:11:0);
	  write(apel[i].jml:10);
	  write(apel[i].totalll:16:0);
          writeln;
	     END;

	  writeln('             -----------------------------------------------------------------');

	  FOR j:=1 TO jumlah DO
	     tot:=tot+apel[j].totalll;
	  writeln('                                            Total Pembayaran = Rp. ',tot:5:0);
	  writeln('                                            Uang Tunai       = Rp. ',bayar:5:0);
	  writeln('                                            Kembalian        = Rp. ',kembalian:5:0);
	  writeln('             -----------------------------------------------------------------');
	  writeln;
          writeln;
          writeln;
          writeln;
	  writeln('                            Terima Kasih Atas Kunjungan Anda');
	  writeln('                            ________________________________');
	  writeln('                                      Follow Us On');
	  writeln('                               Instagram : @tobi.maulana');
	  writeln('                               WhatsApp  : 0857 4005 4600');
	  END;

	  readln;

   	  GOTO AWAL;

  KELUAR :
	  CLRSCR;
	  	 TEXTBACKGROUND(7);
	   	 TEXTCOLOR(9);
 	  writeln;
	  writeln;
	  writeln;
	  writeln;
	  writeln;
	  writeln;
          writeln;
          writeln;
	  writeln;
          writeln;
          writeln;
          writeln;
	  writeln;
          writeln;
	  writeln;
 	  writeln('                                    TERIMA KASIH ATAS KUNJUNGAN ANDA');
	  writeln;
          writeln;
	           ulang:=0;
                   Rekursi;

	  readln;

          END.







