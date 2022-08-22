function game_life_v2
n=10; % tamaño del mundo
persistent world
persistent cont
if isempty(cont)
    cont=0;
else
    cont=cont+1;
end
if isempty(world)
    world=condiciones_ini(n);
    fprintf('Origen del mundo:\n');
    contourf(world);
    colormap(hot(8));
else
    world=actualizar_mundo(world);
    fprintf('Mundo en t=%d\n',cont);
    contourf(world);
    colormap(hot(8));
end
end
function enviroment=condiciones_ini(n)
enviroment=randi(2,n)-1;
end
function world = actualizar_mundo(world)
[m,n] = size(world);
for i=1:m
    for j=1:n
        if n_adyacentes(world,i,j) == 0
            world(i,j)=0;
        end
        if n_adyacentes(world,i,j) == 3
            world(i,j)=1;
        end
        if n_adyacentes(world,i,j) > 3
            world(i,j)=0;
        end
    end
end
end
function cont = n_adyacentes(world,i,j)
[m,n] = size(world);
cont=0;
if i>1 && j>1 && world(i-1,j-1) == 1
    cont = cont+1;
end
if i>1 && world(i-1,j) == 1
    cont = cont+1;
end
if i>1 && j<n && world(i-1,j+1) == 1
    cont = cont+1;
end
if j>1 && world(i,j-1) == 1
    cont = cont+1;
end
if j<n && world(i,j+1) == 1
    cont = cont+1;
end
if i<m && j>1 && world(i+1,j-1) == 1
    cont = cont+1;
end
if i<m && world(i+1,j) == 1
    cont = cont+1;
end
if i<m && j<n && world(i+1,j+1) == 1
    cont = cont+1;
end
end