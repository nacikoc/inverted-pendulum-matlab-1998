%
%...........................TEZ_SBB.M.................................
%
%  Bu M dosyasý SRL_KBB.M ile belirlenen sistem kutuplarýný 
%  kullanarak 4 durum-uzay sistem matrislerinden oluþan 
%  1 giriþli,4 çýkýþlý sistemin birim basamak cevabý elde edilecektir.
%
clear
%
%    
%
%..........SÝSTEM MATRÝSLERÝ...........................................
%
%
A=[ 0      1 0 0;
    20.601 0 0 0;
    0      0 0 1;
   -0.4905 0 0 0];
%
B=[    0;
      -1;
       0;
     0.5];
%
C=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];
%
D=[0;0;0;0];
%
disp('Ktp2.mat dosyasýndan sistem kutuplarý yükleniyor');
%
load Ktp2.mat;
%
disp('Yükleme sona erdi');
%
% SRL ile belirlenen kutuplara uygun durum geri-besleme kazançlarý
% hesaplanýyor.
%                      (K1=[kt kw kx kv] )
%
K1=place(A,B,P2)
pause;
%
%   
%   Burada sistemin birim basamak cevabý iki aþamada bulunuyor.
% Ýlkönce ileri yol kazancý k=1 alýnarak ve daha önce bulunan K1 
% durum geri-besleme kazancýda kullanýlarak kaplý-çevrim durum  
% matrisleri Acl,Bcl,Ccl,Dcl elde ediliyor.
%
%........................k=1
%
%  Acl=A-k*B*K1, Bcl=k*B, Ccl=C-k*D*K1, Dcl=k*D
%
 Acl=A-B*K1;
 Bcl=B;
 Ccl=C-D*K1;
 Dcl=D;
%
ys=step(Acl,Bcl,Ccl,Dcl,1);
%
% ys'in t,w,x,v ile ilgili 4 sütunu vadýr  
% k=1 ve K1 için birim basamak cevabý elde ediliyor.
% Bu çýkýþlarýn izlenmesiyle, istenen çýkýþýn 1'e gitmesi için  
% uygun k ve K deðerleri hesplanýr.
%
k=1/ys(length(ys),3) %Burada konum için birim basamak cevabý seçiliyor
K=K1/k      
%
save K_2.mat K;
%
%
%  Ac=A-k*B*K, Bc=k*B, Cc=C-k*D*K, Dc=k*D
%
 Ac=A-k*B*K;
 Bc=k*B;
 Cc=C-k*D*K;
 Dc=k*D;
%
t=[0:0.01:4];           
disp('Basamak Giriþ');
%
ys=step(Ac,Bc,Cc,Dc,1,t);
plot(t,ys(:,1))
grid;
xlabel('Zaman (sn)');
ylabel('Açýsal hýz (radyan/sn)');
title('Birim basamak giriþ için');
pause;
%
plot(t,ys(:,2))
grid;
xlabel('Zaman (sn)');
ylabel('Sarkaç açýsý(radyan)');
title('Birim basamak giriþ için ');
pause;
%
plot(t,ys(:,3))
grid;
xlabel('Zaman (sn)');
ylabel('Araba Pozisyonu (m)');
title('Birim basamak giriþ için');
pause;
%
plot(t,ys(:,4))
grid;
xlabel('Zaman (sn)');
ylabel('Araba hýzý (m/sn)');
title('Birim basamak giriþ için');
axis;
disp('son tez_sbb')
%..........................son tez_sbb.................................   