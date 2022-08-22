
i = 0;
j = 0;
k1 = 0;
l = 1;
m = 1;
NumeroFOR = 1;
C = 1;
N = 5;
N2 = N;
N_R = ((N*2)-1);
N_R2 = ((N*2)-1);
RF = (N-1)/2;
Matrix = [N_R,N_R];
Matrix2 = [N,N];

    for i = 1: N
		k1 = i;
        for j = (N2):N_R2
            Matrix(k1,j)=C;
            k1 = (k1 + 1);
            C = C+1;
        end
        N2 = (N2 - 1);
        N_R2 =(N_R2 - 1);
    end
    
    NumeroFOR
    
    k1 = N+1;
    for i = 1:RF
        for j = 1:N_R
            if Matrix(k1,j) == 0
                Matrix(k1,j) = Matrix(i,j);
            end
        end
        k1 = (k1 + 1);
    end
    
    NumeroFOR = NumeroFOR+1
    
    k1 = N + RF + 1;
    for i = RF + 1:(N-1)
        for j = 1:N_R 
            if Matrix(i,j) == 0
                Matrix(i,j) = Matrix(k1,j);
            end
        end
        k1 = (k1 + 1);
    end
    
    NumeroFOR = NumeroFOR+1
    
    for i = 1:N_R
        k1 = (RF + N + 1);
        for j = (RF + 1):N-1
            if Matrix(i,j) == 0
                Matrix(i,j) = Matrix(i,k1);
            end
            k1 = (k1 + 1);
        end
    end

    NumeroFOR = NumeroFOR+1
    
    for i = 1:N_R
        k1 = 1;
        for  j = N+1:(N + RF)
            if Matrix(i,j) == 0
                Matrix(i,j) = Matrix(i,k1);
            end
            k1 = (k1 + 1);
        end
    end
    
    NumeroFOR = NumeroFOR+1
    
    for i = (RF + 1):N+RF
        for j = (RF + 1):N+RF
            Matrix2(l,m) = Matrix(i,j);
            m = (m+1);
        end
        l = (l+1); 
        m = 1
    end
    
    Matrix2
    
    
