function  gauss = gauss_mf(x, cr)

 c  =  cr(1);
 r  =  cr(2);
 
 
 %if (a<b && b<c)
    gauss = exp(-(1/2)*((x-c)/r).^2);
%     plot(x,gauss);
%     xlabel('univ. de disc')
%     ylabel('grados de mem')
%     title('FUNCION GAUSIANA')
%else
    %disp('error')
%end

end