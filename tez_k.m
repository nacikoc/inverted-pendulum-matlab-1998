
%..............................TEZ_K.M................................
%
%  Bu M dosyasý SRL_K.m ile belirlenen sistem kutuplarýný 
%  kullanarak 4 durum-uzay sistem matrislerinden oluþan 
%  1 giriþli,4 çýkýþlý sistemin kontrolü gerçekleþtirilecektir.
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
B =[   0;
      -1;
       0;
      0.5];
%
C=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];
%
D  =[0   
     0   
     0  
     0 ];
%
disp('SRL_k.m ile belirlenen kutuplar giriliyor');
%
load Ktp1.mat
%
disp('P1 belirlendi');
%
% SRL ile belirlenen kutuplara uygun durum geri-besleme kazançlarý
% hesaplanýyor.
%                    (K=[kt kw kx kv] )
%
K=place(A,B,P1)
pause;
%
%  Kontrol sisteminin ileri yol kazancý k=1 alýnarak ve durum geri-
% kazancý K için kapalý-çevrim sistem matrisleri elde ediliyor.
%
%....................k=1
%
%  Acl=A-k*B*K, Bcl=k*B, Ccl=C-k*D*K, Dcl=k*D
%
 Ac=A-B*K
 Bc=B;
 Cc=C-D*K;
 Dc=D;
%
disp('func_Ac fonksiyon dosyasýndan Ac yi tanýmladýnýz mý?')
e=1; h=0;
G=input('e/h:');  
if G==e 
%
[t y]=ode23('func_Ac',0,4,[0.1 0 0 0]);
%
theta=y(:,1);
plot(t,theta);
grid;
xlabel('zaman (sn)');
ylabel('Sarkaç açýsý (radyan)');
pause;
%
w=y(:,2);
plot(t,w);
grid;
xlabel('zaman (sn)');
ylabel( 'Açýsal Hýz (rad/sn)');
pause;
%
x=y(:,3);  % y'nin 3. sütunu x'ye atanýyor (konum)
plot(t,x);
grid;
xlabel('zaman (sn)');
ylabel( 'Araba Pozisyonu (m)');
pause;
%
[t y]=ode23('func_Ac',0,4,[0.1 0 0 0]); 
%                          
v=y(:,4);  
plot(t,v);
grid;
xlabel('zaman (sn)');
ylabel( 'Araba Hýzý (m/sn)');
%
end
if G==0
disp('Varolan func_Ac.m fonksiyon dosyasýnda Ac yi ');
disp('tanýmlayýnýz');
end
disp('son tez_k.m');
%...............................son tez_k.m............................