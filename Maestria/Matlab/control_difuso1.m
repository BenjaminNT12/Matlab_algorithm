x = 0.1:0.0001:100
mu = 1./(1+(x-50).^4)
plot(x,mu,'-r')
xlabel = ('Funcion de membresia')
ylabel = ('Grados de membresia')
axis([0,100,-0.2,1.2])
grid