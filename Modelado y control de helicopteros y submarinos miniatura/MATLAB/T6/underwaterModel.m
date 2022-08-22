function dxdt = underwaterModel(t,x,tau)
%syms w m u v r q
 %syms psi tht phi

 %x = [1 1 1 1 1 1 1 1 1 1 1 1]; 

 phi = x(4);
 tht = x(5);
 psi = x(6);

 zg = 1;
 u = x(7);
 v = x(8);
 w = x(9);
 p = x(10);
 q = x(11);
 r = x(12);
 
 m = 11.5;
 Ix = 0.16;
 Iy = 0.16;
 Iz = 0.16;
 
 xu = -4.03;
 yv = -6.22;
 zw = -5.18;
 kp = -0.07;
 mq = -0.07;
 nr = -0.07;
 
 xuu = -18.18;
 yvv = -21.66;
 zww = -36.99;
 kpp = -1.55;
 mqq = -1.55;
 nrr = -1.55;
 
 W = 112.8;
 B = 114.8;

 ethaP = [x(7) x(8) x(9) x(10) x(11) x(12)]'; 
 
Rnb11 = cos(psi)*cos(tht);
Rnb12 = -sin(psi)*cos(phi)+cos(psi)*sin(tht)*sin(phi);
Rnb13 = sin(psi)*sin(phi)+cos(psi)*cos(phi)*sin(tht);
Rnb21 = sin(psi)*cos(tht);
Rnb22 = cos(psi)*cos(phi)+sin(phi)*sin(tht)*sin(psi);
Rnb23 = -cos(psi)*sin(phi)+sin(tht)*sin(psi)*cos(phi);
Rnb31 = -sin(tht);
Rnb32 = cos(tht)*sin(phi);
Rnb33 = cos(tht)*cos(phi);

Rnb = [Rnb11 Rnb12 Rnb13;
       Rnb21 Rnb22 Rnb23;
       Rnb31 Rnb32 Rnb33];

Ttht11 = 1;
Ttht12 = sin(phi)*tan(tht);
Ttht13 = cos(phi)*tan(tht);
Ttht21 = 0 ;
Ttht22 = cos(phi);
Ttht23 = -sin(phi);
Ttht31 = 0;
Ttht32 = sin(phi)/cos(tht);
Ttht33 = cos(phi)/cos(tht);

Ttht = [Ttht11 Ttht12 Ttht13;
        Ttht21 Ttht22 Ttht23;
        Ttht31 Ttht32 Ttht33];
    
ceros33 = zeros(3);
    
J = [Rnb ceros33;
	 ceros33 Ttht];
 
 Mrb11 = m  ;
 Mrb12 = 0;
 Mrb13 = 0;
 Mrb14 = 0;
 Mrb15 = m*zg;
 Mrb16 = 0;
 
 Mrb21 = 0;
 Mrb22 = m;
 Mrb23 = 0;
 Mrb24 = -m*zg;
 Mrb25 = 0;
 Mrb26 = 0;
 
 Mrb31 = 0;
 Mrb32 = 0;
 Mrb33 = m;
 Mrb34 = 0;
 Mrb35 = 0;
 Mrb36 = 0;
 
 Mrb41 = 0;
 Mrb42 = -m*zg;
 Mrb43 = 0;
 Mrb44 = Ix;
 Mrb45 = 0;
 Mrb46 = 0;
 
 Mrb51 = m*zg;
 Mrb52 = 0;
 Mrb53 = 0;
 Mrb54 = 0;
 Mrb55 = Iy;
 Mrb56 = 0;
 
 Mrb61 = 0;
 Mrb62 = 0;
 Mrb63 = 0;
 Mrb64 = 0;
 Mrb65 = 0;
 Mrb66 = Iz;
 
 Mrb = [Mrb11 Mrb12 Mrb13 Mrb14 Mrb15 Mrb16;
        Mrb21 Mrb22 Mrb23 Mrb24 Mrb25 Mrb26;
        Mrb31 Mrb32 Mrb33 Mrb34 Mrb35 Mrb36;
        Mrb41 Mrb42 Mrb43 Mrb44 Mrb45 Mrb46;
        Mrb51 Mrb52 Mrb53 Mrb54 Mrb55 Mrb56;
        Mrb61 Mrb62 Mrb63 Mrb64 Mrb65 Mrb66];

 Crb11 = 0;
 Crb12 = 0;
 Crb13 = 0;
 Crb14 = 0;
 Crb15 = m*w;
 Crb16 = 0;
    
 Crb21 = 0;
 Crb22 = 0;
 Crb23 = 0;
 Crb24 = -m*w;
 Crb25 = 0;
 Crb26 = 0;
    
 Crb31 = 0;
 Crb32 = 0;
 Crb33 = 0;
 Crb34 = m*v;
 Crb35 = -m*u;
 Crb36 = 0;

 Crb41 = 0;
 Crb42 = m*w;
 Crb43 = -m*v;
 Crb44 = 0;
 Crb45 = Iz*r;
 Crb46 = -Iy*q;
    
 Crb51 = -m*w ;
 Crb52 = 0;
 Crb53 = -m*u;
 Crb54 = -Iz*r;
 Crb55 = 0;
 Crb56 = Ix*p;
    
 Crb61 = m*v;
 Crb62 = -m*u;
 Crb63 = 0;
 Crb64 = Iy*q;
 Crb65 = -Ix*p;
 Crb66 = 0;
 
 Crb = [Crb11 Crb12 Crb13 Crb14 Crb15 Crb16;
        Crb21 Crb22 Crb23 Crb24 Crb25 Crb26;
        Crb31 Crb32 Crb33 Crb34 Crb35 Crb36;
        Crb41 Crb42 Crb43 Crb44 Crb45 Crb46;
        Crb51 Crb52 Crb53 Crb54 Crb55 Crb56;
        Crb61 Crb62 Crb63 Crb64 Crb65 Crb66];
    
 Dv11 = xu + xuu*abs(u);
 Dv12 = 0;
 Dv13 = 0;
 Dv14 = 0;
 Dv15 = 0;
 Dv16 = 0;
 
 Dv21 = 0;
 Dv22 = yv + yvv*abs(v);
 Dv23 = 0;
 Dv24 = 0;
 Dv25 = 0;
 Dv26 = 0;
 
 Dv31 = 0;
 Dv32 = 0;
 Dv33 = zw + zww*abs(w);
 Dv34 = 0;
 Dv35 = 0;
 Dv36 = 0;
 
 Dv41 = 0;
 Dv42 = 0;
 Dv43 = 0;
 Dv44 = kp + kpp*abs(p);
 Dv45 = 0;
 Dv46 = 0;
 
 Dv51 = 0;
 Dv52 = 0;
 Dv53 = 0;
 Dv54 = 0;
 Dv55 = mq + mqq*abs(q);
 Dv56 = 0;
 
 Dv61 = 0;
 Dv62 = 0;
 Dv63 = 0;
 Dv64 = 0;
 Dv65 = 0;
 Dv66 = nr + nrr*abs(r);
 
 
 
 Dv = [Dv11 Dv12 Dv13 Dv14 Dv15 Dv16;
       Dv21 Dv22 Dv23 Dv24 Dv25 Dv26;
       Dv31 Dv32 Dv33 Dv34 Dv35 Dv36;
       Dv41 Dv42 Dv43 Dv44 Dv45 Dv46;
       Dv51 Dv52 Dv53 Dv54 Dv55 Dv56;
       Dv61 Dv62 Dv63 Dv64 Dv65 Dv66];
    

   
 gn11 = (W-B)*sin(tht);
 gn12 = -(W-B)*cos(tht)*sin(phi);
 gn13 = -(W-B)*cos(tht)*cos(phi);
 gn14 = zg*W*cos(tht)*sin(phi);
 gn15 = zg*W*sin(tht);
 gn16 = 0;
   
 gn = [gn11;
       gn12;
       gn13;
       gn14;
       gn15;
       gn16];
 
 g0 = [0;
       0;
       0;
       0;
       0;
       0];
   
 
 M = inv(J')*Mrb*inv(J);
 
 size(M);
 size(inv(J'));
 size(Crb);
 size(Mrb);
 size(inv(J));
 size(diff(J));
 
 
 
 %C = inv(J')*(Crb-Mrb*inv(J)*J)*inv(J);
 D = inv(J')*Dv*inv(J);
 Gn =inv(J')*gn ;
 G0 =inv(J')*g0;
 %ethaDP = inv(M)*(-C*ethaP-D*ethaP-Gn-G0-tau); 
 ethaDP = inv(M)*(-D*ethaP-Gn-G0-tau); 

 dxdt(1,1) = x(7);
 dxdt(2,1) = x(8);
 dxdt(3,1) = x(9);
 dxdt(4,1) = x(10);
 dxdt(5,1) = x(11);
 dxdt(6,1) = x(12);
 dxdt(7:12,1) = ethaDP(1:6);


