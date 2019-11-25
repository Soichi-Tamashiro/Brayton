% Ciclo de Brayton de Refrigeracion Ideal
%Donde se asume que todos los procesos son internamente reversibles y que
%los procesos en la turbina y compresor son adiabaticos.
%Metodo de analisis del cilo de Brayton de refrigeracion es similar al
%cicli de brayton de potencia
% Q heat transfer rate , capacidad de refrieracion
% w power
% bwr back work ratio
% T temperatura K
% u specific internal energy
% h entalpia especifica Kj/Kg
% S entropia especifica
% P presion KPa
% v volumen especifico
% z ratio de compresiblidad 
% n eficinca 
% dt  dif log mean tempe
clc
clear all
% Datos modificables para el Ciclo de Brayton de Refrigeracion Ideal
atm=101.3250;%Kpa
V = 1.5000; %m3/s
T1 = 270; %K
T3 = 300;%k
j = 1.4;
%K=1.4;
Cp=1.0050%(R*K)/(K-1)
P2=3*atm
P1=atm
R=0.287;
S1=100;S3=30;
%Ideal
%en la fase 1 isontropic
%la salida isontropica de s4 es igual s3
S2=S1
S4=S3
P3 = P2;
P4 = P1;
%temperaturas
T2=T1*(P2/P1)^((j-1)/j) %k
T4=T3/((P3/P4)^((j-1)/j))%k
% h
H1= Cp*T1 %Kj/Kg
H2= Cp*T2 %Kj/Kg
H3= Cp*T3 %Kj/Kg
H4= Cp*T4 %Kj/Kg
% %Presion isentropica 1-2 
% Pr2=Pr1*P2/P1
% H4dot=
% H2dot=
% %eficiencia
% nT=(H3-H4dot)/(H3-H4)%trubina
% nc=(H2-H1)/(H2dot-H1)
V1=(R*T1)/P1;V2=(R*T2)/P2;V3=(R*T3)/P3;V4=(R*T4)/P4;
Qc =H1-H4 %Kj/Kg %evaporador  refrigerator //cooling efect
Wt=H3-H4%Wt Salida turbina %Kj/Kg
% la entrada de trabajo es
Wc=H2-H1%Wc entrada de compresor %Kj/Kg
Qh=H2-H3% condensador %Kj/Kg
%flujo del fluido mdot = flujo volumetro /volumen especifico a la en trada
%del compresor Kg/svdot/v1
vdot=V*P1;
mdot=vdot/(R*T1) %Kg/s
Wnet=mdot*(Wc-Wt)% potencia de la red? Kw
Qct=mdot*Qc %KW
COPrev=Qct/Wnet

% Grafico
plot(S4,T4,'*');
hold on;
plot(S3,T3,'*');
hold on;
plot(S2,T2,'*');
hold on;
plot(S1,T1,'*');
grid on
X1=[ S1 S1 ];Y1=[ T1 T2 ];
line(X1,Y1)
pause(2)
 X2=[ S2 S3 ];Y2=[ T2 T3 ];
 line(X2,Y2)
 pause(2)
X3=[ S3 S4 ];Y3=[ T3 T4 ];
line(X3,Y3)
pause(2)
% pause(2)
 X4=[ S1 S4 ];Y4=[ T1 T4 ];
 line(X4,Y4)
 xlabel('S (KJ/Kgk)')
 ylabel('T (K)')
 set(gca,'XLim',[(S3-10) (S4+80)],'YLim',[0 (T4+200)])
 title('Ciclo de Brayton')

