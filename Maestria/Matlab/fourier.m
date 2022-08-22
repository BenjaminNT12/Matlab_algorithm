f = 5;
T = 1/f;
n = 1:10;
t=-1: .01: 1;
for i = 1 :50
    for k = 1:size(t,2)
        s(i,k) = (2*(1-cos(pi*i))/((pi*i))*sin(2*pi*i*f*t(k)));
    end
end
for k = 1:size(t,2)
    st(k) = sum(s(:,k));
end
st(1) = st(1)+1;
plot(t,st,'r');
hold on 
F_cuadrada = square(2*pi*.5*t,50);
plot(t,F_cuadrada)
xlabel('Tiempo');
ylabel('Amplitud');