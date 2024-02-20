function R = matrizRCubo8Agent(q, m)
    
    R1  = [ (q(1*m-2:1*m, 1) - q(2*m-2:2*m, 1))', -(q(1*m-2:1*m, 1) - q(2*m-2:2*m, 1))',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',                          zeros(m,1)'];
    R2  = [ (q(1*m-2:1*m, 1) - q(3*m-2:3*m, 1))',                          zeros(m, 1)', -(q(1*m-2:1*m, 1) - q(3*m-2:3*m, 1))',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',                          zeros(m,1)'];
    R3  = [ (q(1*m-2:1*m, 1) - q(4*m-2:4*m, 1))',                          zeros(m, 1)',                           zeros(m,1)', -(q(1*m-2:1*m, 1) - q(4*m-2:4*m, 1))',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',                          zeros(m,1)'];
    R4  = [ (q(1*m-2:1*m, 1) - q(5*m-2:5*m, 1))',                          zeros(m, 1)',                           zeros(m,1)',                           zeros(m,1)', -(q(1*m-2:1*m, 1) - q(5*m-2:5*m, 1))',                           zeros(m,1)',                           zeros(m,1)',                          zeros(m,1)'];
    R5  = [ (q(1*m-2:1*m, 1) - q(8*m-2:8*m, 1))',                          zeros(m, 1)',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)', -(q(1*m-2:1*m,1) - q(8*m-2:8*m, 1))'];
    R6  = [                          zeros(m,1)',  (q(2*m-2:2*m, 1) - q(3*m-2:3*m, 1))', -(q(2*m-2:2*m, 1) - q(3*m-2:3*m, 1))',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',                          zeros(m,1)'];
    R7  = [                          zeros(m,1)',  (q(2*m-2:2*m, 1) - q(5*m-2:5*m, 1))',                           zeros(m,1)',                           zeros(m,1)', -(q(2*m-2:2*m, 1) - q(5*m-2:5*m, 1))',                           zeros(m,1)',                           zeros(m,1)',                          zeros(m,1)'];
    R8  = [                          zeros(m,1)',  (q(2*m-2:2*m, 1) - q(6*m-2:6*m, 1))',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)', -(q(2*m-2:2*m, 1) - q(6*m-2:6*m, 1))',                           zeros(m,1)',                          zeros(m,1)'];
    R9  = [                          zeros(m,1)',                          zeros(m, 1)',  (q(3*m-2:3*m, 1) - q(4*m-2:4*m, 1))', -(q(3*m-2:3*m, 1) - q(4*m-2:4*m, 1))',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',                          zeros(m,1)'];
    R10 = [                          zeros(m,1)',                          zeros(m, 1)',  (q(3*m-2:3*m, 1) - q(6*m-2:6*m, 1))',                           zeros(m,1)',                           zeros(m,1)', -(q(3*m-2:3*m, 1) - q(6*m-2:6*m, 1))',                           zeros(m,1)',                          zeros(m,1)'];
    R11 = [                          zeros(m,1)',                          zeros(m, 1)',  (q(3*m-2:3*m, 1) - q(7*m-2:7*m, 1))',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)', -(q(3*m-2:3*m, 1) - q(7*m-2:7*m, 1))',                          zeros(m,1)'];
    R12 = [                          zeros(m,1)',                          zeros(m, 1)',                           zeros(m,1)',  (q(4*m-2:4*m, 1) - q(7*m-2:7*m, 1))',                           zeros(m,1)',                           zeros(m,1)', -(q(4*m-2:4*m, 1) - q(7*m-2:7*m, 1))',                          zeros(m,1)'];
    R13 = [                          zeros(m,1)',                          zeros(m, 1)',                           zeros(m,1)',  (q(4*m-2:4*m, 1) - q(8*m-2:8*m, 1))',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)', -(q(4*m-2:4*m,1) - q(8*m-2:8*m, 1))'];
    R14 = [                          zeros(m,1)',                          zeros(m, 1)',                           zeros(m,1)',                           zeros(m,1)',  (q(5*m-2:5*m, 1) - q(6*m-2:6*m, 1))', -(q(5*m-2:5*m, 1) - q(6*m-2:6*m, 1))',                           zeros(m,1)',                          zeros(m,1)'];
    R15 = [                          zeros(m,1)',                          zeros(m, 1)',                           zeros(m,1)',                           zeros(m,1)',  (q(5*m-2:5*m, 1) - q(8*m-2:8*m, 1))',                           zeros(m,1)',                           zeros(m,1)', -(q(5*m-2:5*m,1) - q(8*m-2:8*m, 1))'];
    R16 = [                          zeros(m,1)',                          zeros(m, 1)',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',  (q(6*m-2:6*m, 1) - q(7*m-2:7*m, 1))', -(q(6*m-2:6*m, 1) - q(7*m-2:7*m, 1))',                          zeros(m,1)'];
    R17 = [                          zeros(m,1)',                          zeros(m, 1)',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',  (q(6*m-2:6*m, 1) - q(8*m-2:8*m, 1))',                           zeros(m,1)', -(q(6*m-2:6*m,1) - q(8*m-2:8*m, 1))'];
    R18 = [                          zeros(m,1)',                          zeros(m, 1)',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',                           zeros(m,1)',  (q(7*m-2:7*m, 1) - q(8*m-2:8*m, 1))', -(q(7*m-2:7*m,1) - q(8*m-2:8*m, 1))'];

    R = [R1;
         R2; 
         R3; 
         R4; 
         R5; 
         R6; 
         R7; 
         R8; 
         R9; 
         R10; 
         R11; 
         R12; 
         R13; 
         R14; 
         R15; 
         R16; 
         R17; 
         R18];
end

































    
        % R1 = [ (q(1*m-2:1*m, 1) - q( 2*m-2:2*m, 1))' ,-(q( 1*m-2:1*m, 1) - q(2*m-2:2*m, 1))' ,                           zeros(m, 1)' ,                            zeros(m,1)',                            zeros(m,1)'];
        % R2 = [ (q(1*m-2:1*m, 1) - q( 3*m-2:3*m, 1))' ,                           zeros(m,1)' ,  -(q(1*m-2:1*m, 1) - q(3*m-2:3*m, 1))' ,                            zeros(m,1)',                            zeros(m,1)'];
        % R3 = [ (q(1*m-2:1*m, 1) - q( 4*m-2:4*m, 1))' ,                           zeros(m,1)' ,                           zeros(m, 1)' ,  -(q(1*m-2:1*m, 1) - q(4*m-2:4*m, 1))',                            zeros(m,1)'];
        % R4 = [ (q(1*m-2:1*m, 1) - q( 5*m-2:5*m, 1))' ,                           zeros(m,1)' ,                           zeros(m, 1)' ,                            zeros(m,1)',  -(q(1*m-2:1*m, 1) - q(5*m-2:5*m, 1))'];
        % R5 = [                          zeros(m, 1)' ,  (q(2*m-2:2*m, 1) - q(3*m-2:3*m, 1))' ,   -(q(2*m-2:2*m,1) - q(3*m-2:3*m, 1))' ,                            zeros(m,1)',                            zeros(m,1)'];
        % R6 = [                          zeros(m, 1)' ,                           zeros(m,1)' ,    (q(3*m-2:3*m,1) - q(4*m-2:4*m, 1))' ,  -(q(3*m-2:3*m, 1) - q(4*m-2:4*m, 1))',                            zeros(m,1)'];
        % R7 = [                          zeros(m, 1)' ,                           zeros(m,1)' ,                           zeros(m, 1)' ,   (q(4*m-2:4*m, 1) - q(5*m-2:5*m, 1))',  -(q(4*m-2:4*m, 1) - q(5*m-2:5*m, 1))'];
        
        % R = [R1; R2; R3; R4; R5; R6; R7];