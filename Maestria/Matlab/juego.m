A = 13;
PT = input('¿Quien tira primero?')
F1 = 0;
L = 0;
VT = 0; 
VTA = 0;
if PT == 1
    while A > 1 
        while F1 == 0
            VT = input('cuantos quieres eliminar')
            if VT > 0 && VT < 4
                A = A-VT
                F1 = 1;
                if A <= 1
                    L = 1;
                    disp('GANASTE!!!')
                end
            else
                disp('Valor erroneo')
            end
        end
        VT = 4-VT
        A = A-VT
        VT = 0;
        if(A <= 1)
            L = 2
            disp('PERDISTE!!!')
        end            
        F1 = 0;
    end
else
    while A > 1
        if(A == 13) 
            VT = 2;
            VT = 4-VT;
            A = A-VT
            VTA = VT
        else
            if((VTA + VT)> 4)
                VT = 8 - (VTA + VT);
                if(VT == 0)
                    VT = 1
                end
                VTA = VT
                A = A-VT
            else
                VT = 4 - (VTA + VT);
                if(VT == 0)
                    VT = 1
                end
                VTA = VT
                A = A-VT
            end
        end
        if(A <= 1)
            L = 2;
            disp('PERDISTE!!!')
        end                    
        while F1 == 0 && L == 0        
            VT = input('cuantos quieres eliminar')
            if VT > 0 && VT < 4
                A = A-VT
                F1 = 1;
                if A <= 1
                    L = 1;
                    disp('GANASTE!!!')
                end
            else
                disp('Valor erroneo')
            end
        end 
        F1 = 0;
    end
end



