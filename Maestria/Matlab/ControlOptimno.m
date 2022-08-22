clc;
clear all;
clear axis;

x=0:0.001:100;
F = 0;
Fun1 = 0;
disp('Tipos de Funciones de Membresía (MF) ')
disp('1.- Triangular.')
disp('2.- Trapezoidal.')
disp('3.- Campana generalizada.')
disp('4.- Gaussiana. ')
disp('5.- Sigmoidal.')

Seleccion = input('Seleccione el tipo de la Primera función de membresía: ');
switch Seleccion
    case 1
       disp('función de membresía Triangular')
       a = input('Ingrese un valor para a:');
       b = input('Ingrese un valor para b:');
       c = input('Ingrese un valor para c:');
       triangle = max(min(((x-a)/(b-a)),((c-x)/(c-b))),0);
       plot(x,triangle)
       hold on
       F = triangle;
       
    case 2
       disp('función de membresía Trapezoidal')
       a = input('Ingrese un valor para a:');
       b = input('Ingrese un valor para b:');
       c = input('Ingrese un valor para c:');
       d = input('Ingrese un valor para d:');
       trap = max(min((x-a)/(b-a),min(1,(d-x)/(d-c))),0);
       plot(x,trap);
       hold on
       F = trap;
       
    case 3
       disp('función de membresía Campana Generalizada')
       A = input('Ingrese un valor para a:');
       B = input('Ingrese un valor para b:');
       C1 = input('Ingrese un valor para c:');
       Bell =1./(1+abs((x-C1)./A).^(2*B));
       plot(x,Bell)
       hold on
       F = Bell;
       
    case 4
       disp('función de membresía Gaussiana')
       C = input('Ingrese un valor para c:');
       r = input('Ingrese un valor para r:');
       gaussian =  exp(-(1/2)*((x-C)/r).^2);
       plot(x,gaussian)
       hold on
       F = gaussian;
       
    case 5
       disp('función de membresía Sigmoidal')
       a = input('Ingrese un valor para a:');
       c = input('Ingrese un valor para c:');
       sig = 1./(1 + exp(-a*(x-c)));
       plot(x,sig)
       hold on
       F = sig;
       
end  

while(1)
clc;
disp('tipos de operaciónes ')
disp('1.- Concentración')
disp('2.- Dilatación')
disp('3.- Negación')
disp('4.- AND ')
disp('5.- OR')
disp('6.- Intensificación')
oper = input('Seleccione el tipo de operación que desea realizar: ');
 
if oper >0 && oper <= 6 
switch oper
    case 1
        Con = (F).^2;
        plot(x,Con,'r');
        hold on 
    case 2
       Dil = (F).^.5;
       plot(x,Dil,'r');
       hold on   
    case 3
       Not =(1-F);
       plot(x,Not,'r');
       hold on 
    case 4
        Seleccion_2 = input('Seleccione el tipo de función de membresía: ');
        switch Seleccion_2
            case 1
                disp('función de membresía Triangular')
                a = input('Ingrese un valor para a:');
                b = input('Ingrese un valor para b:');
                c = input('Ingrese un valor para c:');
                triangle = max(min(((x-a)/(b-a)),((c-x)/(c-b))),0);
                plot(x,triangle)
                hold on
                F_2 = triangle;
            case 2
                disp('función de membresía Trapezoidal')
                a = input('Ingrese un valor para a:');
                b = input('Ingrese un valor para b:');
                c = input('Ingrese un valor para c:');
                d = input('Ingrese un valor para d:');
                trap = max(min((x-a)/(b-a),min(1,(d-x)/(d-c))),0);
                plot(x,trap);
                hold on
                F_2 = trap;
       
            case 3
                disp('función de membresía Campana Generalizada')
                A = input('Ingrese un valor para a:');
                B = input('Ingrese un valor para b:');
                C1 = input('Ingrese un valor para c:');
                Bell =1./(1+abs((x-C1)./A).^(2*B));
                plot(x,Bell)
                hold on
                F_2 = Bell;
            case 4
                disp('función de membresía Gaussiana')
                C = input('Ingrese un valor para c:');
                r = input('Ingrese un valor para r:');
                gaussian =  exp(-(1/2)*((x-C)/r).^2);
                plot(x,gaussian)
                hold on
                F_2 = gaussian;       
            case 5
                disp('función de membresía Sigmoidal')
                a = input('Ingrese un valor para a:');
                c = input('Ingrese un valor para c:');
                sig = 1./(1 + exp(-a*(x-c)));
                plot(x,sig)
                hold on
                F_2 = sig;
       end 
       AND= union(F,F_2);
       plot(x,AND,'r');
       hold on 
    case 5
        Seleccion_2 = input('Seleccione el tipo de función de membresía: ');
        switch Seleccion_2
            case 1
                disp('función de membresía Triangular')
                a = input('Ingrese un valor para a:');
                b = input('Ingrese un valor para b:');
                c = input('Ingrese un valor para c:');
                triangle = max(min(((x-a)/(b-a)),((c-x)/(c-b))),0);
                plot(x,triangle)
                hold on
                F_2 = triangle;
            case 2
                disp('función de membresía Trapezoidal')
                a = input('Ingrese un valor para a:');
                b = input('Ingrese un valor para b:');
                c = input('Ingrese un valor para c:');
                d = input('Ingrese un valor para d:');
                trap = max(min((x-a)/(b-a),min(1,(d-x)/(d-c))),0);
                plot(x,trap);
                hold on
                F_2 = trap;
       
            case 3
                disp('función de membresía Campana Generalizada')
                A = input('Ingrese un valor para a:');
                B = input('Ingrese un valor para b:');
                C1 = input('Ingrese un valor para c:');
                Bell =1./(1+abs((x-C1)./A).^(2*B));
                plot(x,Bell)
                hold on
                F_2 = Bell;
       
            case 4
                disp('función de membresía Gaussiana')
                C = input('Ingrese un valor para c:');
                r = input('Ingrese un valor para r:');
                gaussian =  exp(-(1/2)*((x-C)/r).^2);
                plot(x,gaussian)
                hold on
                F_2 = gaussian;
            case 5
                disp('función de membresía Sigmoidal')
                a = input('Ingrese un valor para a:');
                c = input('Ingrese un valor para c:');
                sig = 1./(1 + exp(-a*(x-c)));
                plot(x,sig)
                hold on
                Fun1 = sig;
       
        end 
        OR = intersect(F,F_2);
        plot(x,OR,'r');
        hold on 
    case 6
        if 0<= F <= .5
        INT= (2*F).^2;
        else .5 <= F <= 1
        INT= (2*(1-F)).^2  ;  
        end
        plot(x,INT,'r');
       hold on 
end
break;
else
    disp('Error Seleccion incorrecta')
end
end