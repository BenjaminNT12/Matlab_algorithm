% serie de fourier diente de sierra 
syms x
G = 0
gs = 0;
for i = 1:4
    gs = gs + sin(i*x)/i
end
gs = gs*2
G = pi-gs
t = linspace(0,6*pi,500);
fG = subs(G,t);
plot(t,fG);