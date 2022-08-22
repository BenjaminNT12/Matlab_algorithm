function  triangle = triangle_mf(x, abc)

 a  =  abc(1);
 b  =  abc(2);
 c  =  abc(3);

 
 if (a<b && b<c)
    triangle=max(min((x-a)/(b-a),(c-x)/(c-b)),0);
    %plot(x,triangle)
%     xlabel('univ. de disc')
%     ylabel('grados de mem')
%     title('FUNCION TRIANGULAR')
else
    disp('error')
end

end