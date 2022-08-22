%QPMR(QP,D,d,e)
%    Quasi-Polynomial Mapping based Rootfinder 
%    Finds all roots of the characteristic quasi-polynomial QP 
%    of a Time Delay System (TDS) located in the defined region
%    of the complex plane D. The algorithm maps the zero-level 
%    curves of both real and imaginary parts of the 
%    quasi-polynomial using the Matlab function contour. 
%    The roots are located as the intersection points of the 
%    curves. Accuracy of the roots is increased using Newton's 
%    iteration method.
%     
%    QP - quasi-polynomial in symblic variable s
%    D=[Real_min Real_max Imag_min Imag_max] - region D in the 
%       complex plane
%    d - grid-step of the mesh spread over D for mapping the 
%        zero-level curves, (d<0.1*pi/tau_max, tau_max is the 
%        maximum delay in the TDS dynamics)
%    eps - required acuracy of the roots
%    
%    Example
%    syms s
%    QP=s^3+3.1*s+(1.8*s^3+2.3)*exp(-0.31*s)+1.9*s^2*exp(-1.43*s)+0.7*exp(-2.5*s)
%    P=qpmr(QP,[-15 10 0 100],0.1*pi/2.5,0.0000001);
%
%    see also AQPMR


function P=qpmr(M,Reg,d,e)

syms s
%Initialization
b_min=Reg(1)-3*d;
b_max=Reg(2)+3*d;
w_min=Reg(3)-3*d;
w_max=Reg(4)+3*d;

m=size(M);
if m(1)>1
    M=poly(M,s);
end;

P='No roots in the selected region';   

nW=round((w_max-w_min)/d+1);
nB=round((b_max-b_min)/d+1);
W=linspace((w_min),(w_max),nW);
B=linspace((b_min),(b_max),nB);

oB=ones(1,nW);
oW=ones(1,nB);

WW=oW'*W;
BB=oB'*B;
 
D=BB+WW'*j;

MM=subs(M,s,D);
MM=double(MM);
R=real(MM);
I=imag(MM);   
   

figure(2);
hold off;
title('System Poles');
[Ci,Hi]=contour(B,W,I,[0 0],'r-');
hold on;
[Cr,Hr]=contour(B,W,R,[0 0],'b-');
axis([Reg(1) Reg(2) Reg(3) Reg(4)]);
xlabel('Re(\its \rm)','FontSize',10)
ylabel('Im(\its \rm)','FontSize',10)
pause(0.1);
p=0;
%uprava Cr

pCr=size(Cr);     %kontrola po sobe jdoucich hodnot
pCr=pCr(2);
Crr=Cr;
Cr=Cr(1,:)+Cr(2,:)*j;
IIc=imag(subs(M,s,Cr));

np=1;
ch=1;
for no=2:pCr-2
    if ((IIc(no-1)*IIc(no+1))<0)&(ch==1)
        if (Reg(1)<=real(Cr(no)))&(Reg(2)>=real(Cr(no)))&(Reg(3)<=imag(Cr(no)))&(Reg(4)>=imag(Cr(no)))
            if (abs(Crr(1,no)-Crr(1,no+1))<2*d)&(abs(Crr(2,no)-Crr(2,no+1))<2*d)
               Pp(np)=Cr(no);
               np=np+1;
               ch=0;
            end
       end
    else
        ch=1;
    end
end

P=Pp;

%numeric calculation of poles
if ~(ischar(P))
    clear P
    H=M/diff(M);
    n=size(Pp);
    n=n(2);
for o=1:n
    a=Pp(o);
    Newton_run=1;
while Newton_run
    a_k1=a;
    s=a;
    a=a-eval(H);
    Newton_run=(abs(a-a_k1)>e);
end
  if (~isreal(a))&(abs(imag(a))<0.1*e)  %orezani imag polu 
      a=real(a);
end
      
  P(o,1)=a;
  figure(2);
  hold on;
end
plot(real(P),imag(P),'ko','MarkerFaceColor',[0 0 0],'MarkerSize',3);
pause(0.01)
end

Pmax=max(abs(P));
for k=1:n
    [Pm o]=min(abs(P));
    PM(k,1)=P(o);
    P(o)=2*Pmax;
end
P=PM;