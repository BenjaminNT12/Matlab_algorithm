function z = F_Cos(x,y,w) 
    format long;
    syms x y;
    
    z = -1.3-cos(w*x)-0.5*cos(w*y);
    
    