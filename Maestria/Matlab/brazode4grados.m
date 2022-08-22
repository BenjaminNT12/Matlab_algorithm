function A=brazode4grados(theta,theta2,theta3,theta4) 
theta = theta*pi/180; 
theta2= theta2*pi/180; 
theta3= theta3*pi/180; 
theta4= theta4*pi/180; 



alfa=-pi/2; 
a=0; 
di=30; 


A1=[cos(theta) -cos(alfa)*sin(theta) sin(alfa)*sin(theta) a*cos(theta); 
sin(theta) cos(alfa)*cos(theta) -sin(alfa)*cos(theta) a*sin(theta); 
0 sin(alfa) cos(alfa) di ; 
0 0 0 1 ]; 

alfa=0; 
a=50; 
di=0; 

A2=[cos(theta2) -cos(alfa)*sin(theta2) sin(alfa)*sin(theta2) a*cos(theta2); 
sin(theta2) cos(alfa)*cos(theta2) -sin(alfa)*cos(theta2) a*sin(theta2) ; 
0 sin(alfa) cos(alfa) di ; 
0 0 0 1 ]; 


alfa=-pi/2; 
a=40; 
di=0; 


A3=[cos(theta3) -cos(alfa)*sin(theta3) sin(alfa)*sin(theta3) a*cos(theta3); 
sin(theta3) cos(alfa)*cos(theta3) -sin(alfa)*cos(theta3) a*sin(theta3) ; 
0 sin(alfa) cos(alfa) di ; 
0 0 0 1 ]; 

alfa=-pi/2; 
a=20; 
di=0; 



A4=[cos(theta4) -cos(alfa)*sin(theta4) sin(alfa)*sin(theta4) a*cos(theta4); 
sin(theta4) cos(alfa)*cos(theta4) -sin(alfa)*cos(theta4) a*sin(theta4); 
0 sin(alfa) cos(alfa) di ; 
0 0 0 1 ]; 


P1=A1; 
P2=A1*A2; 
P3=A1*A2*A3; 
P4=A1*A2*A3*A4; 

x=[ 0 P1(1,4) P2(1,4) P3(1,4) P4(1,4) ]; 
y=[ 0 P1(2,4) P2(2,4) P3(2,4) P4(2,4) ]; 
z=[ 0 P1(3,4) P2(3,4) P3(3,4) P4(3,4) ]; 
axis on 

view([120,20]), %angulo de visión del plot 3D 

plot3(x,y,z,'k'); %graficamos la linea definida en (x,y,z) 

axis([ -120 120 -120 120 0 120]); %definir rango del plot 


grid on 

title('grafico de brazo robot'); 
xlabel('eje X'), ylabel('eje Y'), zlabel('ejeZ') 