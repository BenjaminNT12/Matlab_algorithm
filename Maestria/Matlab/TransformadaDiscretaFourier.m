clear all;
clear axis;
clc;

Npasos = 8;
muestras = [0:(2*pi-((2*pi)/Npasos))/(Npasos-1):(2*pi)-(2*pi)/Npasos];
Nm = length(muestras);
func = cos(muestras);
PasosK = 0;
temp = 0;
Nm
for k = 0:Npasos-1
    PasosK = 0;
    PasosK2 = 0;
    for i=0:Nm-1
%         temp = func(i)*exp(-(1j*2*pi*(k)*i)/Nm);
%         func(i)
%         exp(-(2*pi*(k)*muestras(i))/Nm)
%         PasosK = PasosK + temp;
        trig = (cos(-(2*pi*k*(i))/Nm)+1j*sin(-(2*pi*k*(i))/Nm));
        f1 = func(i+1);
        temp2 = func(i+1)*(cos(-(2*pi*k*(i))/Nm)+1j*sin(-(2*pi*k*(i))/Nm));
        PasosK2 = PasosK2 + temp2;
    end
    hold on
    k
    PasosK2
    real(PasosK2)
    plot(k,real(PasosK2),'x')
end