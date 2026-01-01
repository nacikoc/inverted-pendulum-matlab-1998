%.........................func_Ac.M....................................
%
% Bu fonksiyon dosyasý ode23 difreyansiyel çözümü için yapýlmýþtýr.
% Matlab programýnda fonksiyon dosyalarýnýn özelliðinden dolayý program
% akýþý içinde tanýmlanan'Ac'matrisini,fonksiyon dosyasý tanýmamaktadýr.
% Bu yüzden func_Ac.m fonksiyon dosyasýnda Ac'yi tekrar atamak gerekir.
%
%
function dy=func_Ac(t,y);
% Ac=?  Ac'tanýmlayýnýz.




dy(1)=Ac(1,1)*y(1)+Ac(1,2)*y(2)+Ac(1,3)*y(3)+Ac(1,4)*y(4);
dy(2)=Ac(2,1)*y(1)+Ac(2,2)*y(2)+Ac(2,3)*y(3)+Ac(2,4)*y(4);
dy(3)=Ac(3,1)*y(1)+Ac(3,2)*y(2)+Ac(3,3)*y(3)+Ac(3,4)*y(4);
dy(4)=Ac(4,1)*y(1)+Ac(4,2)*y(2)+Ac(4,3)*y(3)+Ac(4,4)*y(4);
%
%......................son func_Ac.m...................................