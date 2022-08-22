clear all
clc
colormap('default');

xx = 0:1:10;
yy = 0:1:10;
aa = 0:0.05:1;
bb = 0:0.05:1;

%bell_x = gbell_mf(xx, [4, 3, 10]);
%bell_y = gbell_mf(yy, [4, 3, 10]);
% bell_x = trap_mf(xx, [3, 8, 12, 17]);
% bell_y = trap_mf(yy, [3, 8, 12, 17]);
bell_x = triangle_mf(xx, [2, 3, 6]);
bell_y = gauss_mf(yy, [4, 3]);

[x,y] = meshgrid(bell_x, bell_y);
[a,b] = meshgrid(aa, bb); % a = mu(x), b = mu(y);

subplot(2,2,1); mesh(aa, bb, max(a, b));%%%%%
view(-15, 30); xlabel('a'); ylabel('b');
set(gca, 'box', 'on');
title('(a) Min');
subplot(2,2,3); mesh(xx, yy, max(x, y));
view(-15, 30); xlabel('X = x'); ylabel('Y = y');
set(gca, 'box', 'on');

subplot(2,2,2); mesh(aa, bb, a+b);
view(-15, 30); xlabel('X = a'); ylabel('Y = b');
set(gca, 'box', 'on');
title('(b) Producto algebraico');
subplot(2,2,4); mesh(xx, yy, x+y);
view(-15, 30); xlabel('X = x'); ylabel('Y = y');
set(gca, 'box', 'on');

figure;

subplot(2,2,1); mesh(aa, bb, min(1, a+b));
view(-15, 30); xlabel('X = a'); ylabel('Y = b');
set(gca, 'box', 'on');
title('(c) Producto acotado');
subplot(2,2,3); mesh(xx, yy, min(1, x+y));
view(-15, 30); xlabel('X = x'); ylabel('Y = y');
set(gca, 'box', 'on');

z1 = ones(size(a));
z1(find(b==0)) = a(find(b==0));
z1(find(a==0)) = b(find(a==0));
z2 = ones(size(x));
z2(find(x==0)) = y(find(x==0));
z2(find(y==0)) = x(find(y==0));
subplot(2,2,2); mesh(aa, bb, z1);
view(-15, 30); xlabel('X = a'); ylabel('Y = b');
set(gca, 'box', 'on');
title('(d) Producto drastico');
subplot(2,2,4); mesh(xx, yy, z2);
view(-15, 30); xlabel('X = x'); ylabel('Y = y');
set(gca, 'box', 'on');



