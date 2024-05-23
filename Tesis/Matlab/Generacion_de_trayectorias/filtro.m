clear all
% close
datos = load('datos_pruebas_deph_2024-05-22_12-23.txt');



T = 0.1
tau = 0.2
tau_2 = 0.5

z = datos(:,1);
t = datos(:,3);

z_f = z(1)
z_pf = 0

for i =2 : length(z)
    z_f(i) = z_f(i-1) + (T/tau)*(z(i-1) - z_f(i-1));
    z_p(i) = (z_f(i) - z_f(i-1))/T;

    z_pf(i) = z_pf(i-1) + (T/tau_2)*(z_p(i-1) - z_pf(i-1));
end


z_f = self.z_f_a + (T/tau)*(self.z_a - self.z_f_a);
z_p = (z_f - self.z_f_a)/T;
z_pf = self.z_pf_a + (T/tau_2)*(self.z_p_a - self.z_pf_a);



% plot(t, z, t, z_f)

figure(3)

plot(t, z_p, t, z_pf)
