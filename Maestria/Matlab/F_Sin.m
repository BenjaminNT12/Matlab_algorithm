function z = F_Sin(x,y,w)
    format long;
    syms x y;
    
    z = w-sin(w*x)-0.5*sin(w*y);

