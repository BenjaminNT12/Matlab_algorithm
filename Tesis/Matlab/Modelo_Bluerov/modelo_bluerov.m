syms M_11 M_12 M_21 M_22
syms C_11 C_12 C_21 C_22
syms D_11 D_12 D_21 D_22
syms g_1 g_2
syms J_11_inv J_22_inv
syms J_p_11 J_p_12 J_p_21 J_p_22
syms eta_1_p eta_2_p
syms eta_1_pp eta_2_pp
syms tau_1 tau_2
syms w_1 w_2

J_12_inv = 0;
J_21_inv = 0;


M = [M_11 M_12; M_21 M_22];
C = [C_11 C_12; C_21 C_22];
D = [D_11 D_12; D_21 D_22];
g = [g_1; g_2];
J_inv = [J_11_inv J_12_inv; J_21_inv J_22_inv];
J_p = [J_p_11 J_p_12; J_p_21 J_p_22];
eta_p = [eta_1_p; eta_2_p];
eta_pp = [eta_1_pp; eta_2_pp];
tau = [tau_1; tau_2];
w = [w_1; w_2];

M*J_inv*eta_pp

-M*J_inv*J_p*J_inv*eta_p