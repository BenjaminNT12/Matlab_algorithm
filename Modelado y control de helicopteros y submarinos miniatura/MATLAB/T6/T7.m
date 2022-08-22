clear all
close all
clc

T = 0.1;
t = [0:T:1.7];

x = [0 0 0 0 0 0 0 0 0 0 0 0]

etha = [0 0 0 0 0 0]; 
ethaD = [0 0 3 0 0 0]; 
u = [0 0 0 0 0 0]


for i=1:length(t) 
    [tt,xx] = ode45(@underwaterModel,t,x,[],u);
    phi = xx(4);
    tht = xx(5);
    psi = xx(6);
    
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

    etha = xx(i,1:6)
    err_etha = ethaD - etha
    eb = J'*err_etha'

    u = Kp*eb + K1
    
end
size(xx)
plot(tt,xx(:,3))
hold on
plot(tt,ethaD(3))





