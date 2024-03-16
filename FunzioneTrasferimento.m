classdef FunzioneTrasferimento
    %FUNZIONETRASFERIMENTO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods (Static)
        function y = serie(n1,d1,n2,d2)
            %serie di 2 fdt
            %funzione di trasferimento  1 e 2
            sis1 = tf(n1,d1);
            sis2 = tf(n2,d2);
            % serie di fdt ed fdt2
            sis3 = series(sis1, sis2);
            sis4 = sis1*sis2;
            y = [sis3 sis4];
            disp(y)
            return
        end
        function y = parallelo(n1,d1,n2,d2)
            %funzione di trasferimento  1 e 2
            sis1 = tf(n1,d1);
            sis2 = tf(n2,d2);
            %parallelo
            sis3 = parallel(sis1,sis2);
            sis4 = sis1+sis2;
            y = [sis3 sis4];
            disp(y)
        end
        function [sisG0, sisG1] = retroazione()
            %funzione ramo diretto
            nG = 1; dG =[1 -1];%polo in s = +1
            sisG = tf(nG,dG);
            %funzione ramo di retroazione
            nH = 10; dH = 1; sisH = tf(nH,dH);
            %sistema chiuso in retrazione
            sisG0 = feedback(sisG,sisH);
            %sistema chiuso in retroazione unitaria
            sisG1 = feedback(sisG,1);
            return
        end
    end
end




