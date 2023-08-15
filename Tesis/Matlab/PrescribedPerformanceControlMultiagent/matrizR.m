function R = matrizR(q, m)

    R1 = [ (q(1*m-2:1*m, 1) - q( 2*m-2:2*m, 1))' ,-(q( 1*m-2:1*m, 1) - q(2*m-2:2*m, 1))' ,                           zeros(m, 1)' ,                            zeros(m,1)',                            zeros(m,1)'];
    R2 = [ (q(1*m-2:1*m, 1) - q( 3*m-2:3*m, 1))' ,                           zeros(m,1)' ,  -(q(1*m-2:1*m, 1) - q(3*m-2:3*m, 1))' ,                            zeros(m,1)',                            zeros(m,1)'];
    R3 = [ (q(1*m-2:1*m, 1) - q( 4*m-2:4*m, 1))' ,                           zeros(m,1)' ,                           zeros(m, 1)' ,  -(q(1*m-2:1*m, 1) - q(4*m-2:4*m, 1))',                            zeros(m,1)'];
    R4 = [ (q(1*m-2:1*m, 1) - q( 5*m-2:5*m, 1))' ,                           zeros(m,1)' ,                           zeros(m, 1)' ,                            zeros(m,1)',  -(q(1*m-2:1*m, 1) - q(5*m-2:5*m, 1))'];
    R5 = [                          zeros(m, 1)' ,  (q(2*m-2:2*m, 1) - q(3*m-2:3*m, 1))' ,   -(q(2*m-2:2*m,1) - q(3*m-2:3*m, 1))' ,                            zeros(m,1)',                            zeros(m,1)'];
    R6 = [                          zeros(m, 1)' ,                           zeros(m,1)' ,    (q(3*m-2:3*m,1) - q(4*m-2:4*m, 1))' ,  -(q(3*m-2:3*m, 1) - q(4*m-2:4*m, 1))',                            zeros(m,1)'];
    R7 = [                          zeros(m, 1)' ,                           zeros(m,1)' ,                           zeros(m, 1)' ,   (q(4*m-2:4*m, 1) - q(5*m-2:5*m, 1))',  -(q(4*m-2:4*m, 1) - q(5*m-2:5*m, 1))'];
    
    R = [R1; R2; R3; R4; R5; R6; R7];
end


% R1 = [ (q(1*m-2:1*m, i) - q( 2*m-2:2*m, i))' ,-(q( 1*m-2:1*m, i) - q(2*m-2:2*m, i))' ,                           zeros(m, 1)' ,                            zeros(m,1)',                            zeros(m,1)'];
% R2 = [ (q(1*m-2:1*m, i) - q( 3*m-2:3*m, i))' ,                           zeros(m,1)' ,  -(q(1*m-2:1*m, i) - q(3*m-2:3*m, i))' ,                            zeros(m,1)',                            zeros(m,1)'];
% R3 = [ (q(1*m-2:1*m, i) - q( 4*m-2:4*m, i))' ,                           zeros(m,1)' ,                           zeros(m, 1)' ,  -(q(1*m-2:1*m, i) - q(4*m-2:4*m, i))',                            zeros(m,1)'];
% R4 = [ (q(1*m-2:1*m, i) - q( 5*m-2:5*m, i))' ,                           zeros(m,1)' ,                           zeros(m, 1)' ,                            zeros(m,1)',  -(q(1*m-2:1*m, i) - q(5*m-2:5*m, i))'];
% R5 = [                          zeros(m, 1)' ,  (q(2*m-2:2*m, i) - q(3*m-2:3*m, i))' ,   -(q(2*m-2:2*m,i) - q(3*m-2:3*m, i))' ,                            zeros(m,1)',                            zeros(m,1)'];
% R6 = [                          zeros(m, 1)' ,                           zeros(m,1)' ,    (q(3*m-2:3*m,i) - q(4*m-2:4*m, i))' ,  -(q(3*m-2:3*m, i) - q(4*m-2:4*m, i))',                            zeros(m,1)'];
% R7 = [                          zeros(m, 1)' ,                           zeros(m,1)' ,                           zeros(m, 1)' ,   (q(4*m-2:4*m, i) - q(5*m-2:5*m, i))',  -(q(4*m-2:4*m, i) - q(5*m-2:5*m, i))'];
