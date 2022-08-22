clc
syms tht thtP phi phyP psi psiP Ixx Iyy Izz
%J=[
np=[phyP;thtP;psiP]
J=[Ixx 0 -Ixx*sin(tht);0, Iyy*sin(phi)^2 + Izz*sin(phi)^2 cos(phi)*cos(tht)*sin(phi)*(Iyy - Izz);-Ixx*sin(tht) cos(phi)*cos(tht)*sin(phi)*(Iyy - Izz) Izz*cos(phi)^2*cos(tht)^2 + Iyy*cos(tht)^2*sin(phi)^2 + Ixx*sin(tht)^2]
Jp=[0,0,-Ixx*cos(tht)*thtP;0,-2*Iyy*sin(tht)*cos(tht)*thtP+2*Izz*sin(phi)*phyP*cos(tht),-sin(phi)^2*cos(tht)-cos(phi)*sin(tht)*thtP*sin(phi)*(Iyy-Izz);-Ixx*cos(tht)*thtP,(-cos(tht)*sin(phi)^2*phyP-cos(phi)*sin(phi)*sin(tht)*thtP+cos(phi)^2*cos(tht)*phyP)*(Iyy-Izz),2*Ixx*sin(tht)*cos(tht)*thtP+Iyy*(-2*cos(tht)*sin(tht)*thtP*sin(phi)^2+2*sin(phi)*cos(tht)^2*cos(phi)*phyP)+Izz*(-2*cos(phi)*sin(phi)*phyP*cos(tht)^2-2*cos(phi)^2*cos(tht)*sin(tht)*thtP)]

mul=(1/2)*(np.'*J)


M1=[Ixx/2;0;-Ixx*sin(tht)/2]
M2=[]