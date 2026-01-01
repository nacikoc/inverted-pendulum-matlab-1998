%
%.......................SRL_K.m.........................................
%
% Bu m dosyasý SRL'nin çizilmesiyle her bir kutuplarýn yerinin  
% belirlenmesini ve kontrol sistemi performansý için uygun kutuplarýn
% seçilmesini saðlar.
%
clear
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
H=[0 0 4.4 1]
%
D=0;
%
disp('Burada H vektöründe istenilen deðiþiklikler ')
disp('yapýlabilir,deðiþiklik yapmak istiyormusunuz?')
e=1; h=0;
G=input('e/h:');  
if G==e 
H=input('Ýstenilen H vetörü:')
end;
%
disp('Simetrik sistem formu.A,B,H,D-A,B,-C,D')
%
[As,Bs,Cs,Ds]=series(A,B,H,D,-A,B,-H,D);
rlocus(As,Bs,Cs,Ds);
grid;
%
%  Kullanýlan rhk nisbi aðýrlýk oranýdýr. 
%
[rhk,sis_kutp]=rlocfind(As,Bs,Cs,Ds);
%
P1=[sis_kutp(find(real(sis_kutp)<0))]
%
rhk
%
sis_kutp
%
save Ktp1.mat P1;
disp('son srl_k')
%...........................son SRL_K.M................................   