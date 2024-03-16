
% GENERA IL SEGNALE ARMONICO
clc
clear 
close all
global singola_sinusoide multiarmonico onda_quadrata onda_triangolare
singola_sinusoide = 1;
multiarmonico = 2;
onda_quadrata = 3;
onda_triangolare = 4;



%segnale a singola sinusoide
tipo = singola_sinusoide;
disp("segnale a singola sinusoide")
K = 1 ; %input('vettore ordini armonici ==> ');
A = 4 ; %input('vettore ampiezze armoniche ==> ');
P = 0 ; %input('vettore fasi armoniche in radianti ==> ');
N = 128;  %input('N. di punti campionati ==> ');
f = 100;  %input('frequenza della componente fondamentale ==> ');
M = 4.;  %input('N. di periodi considerati ==> ');
[x0, df] = crea_segnale(tipo, K, A, P, N,f, M);
segnale_originale = x0;
% CALCOLA VALORE MEDIO E VALORE EFFICACE
calcolo_valori_segnale(x0);
% CALCOLA LO SPETTRO DEL SEGNALE
calcolo_spettro(x0, df, N)
% INTRODUCI RUMORE 1 + CALCOLA VALORE MEDIO E VALORE EFFICACE DEL SEGNALE RUMOROSO
m = 0;
d_s = A(1)/4;
[x0] = calcolo_rum_g(segnale_originale,m, d_s, N);
calcolo_valori_segnale(x0);
calcolo_spettro(x0, df, N)
% INTRODUCI RUMORE 2 + CALCOLA VALORE MEDIO E VALORE EFFICACE DEL SEGNALE RUMOROSO
m = 1;
d_s = A(1)*4/3;
[x0] = calcolo_rum_g(segnale_originale, m, d_s, N);
calcolo_valori_segnale(x0);
calcolo_spettro(x0, df, N)
%INTRODUZIONE RUMORE 3 UNIFORME + CALCOLA VALORE MEDIO E VALORE EFFICACE DEL SEGNALE RUMOROSO
m = 0;
d_s = A(1)/4;
[x0] = calcolo_rum_u(segnale_originale, m, d_s, N);
calcolo_valori_segnale(x0);
calcolo_spettro(x0, df, N)
%INTRODUZIONE RUMORE 4 UNIFORME + CALCOLA VALORE MEDIO E VALORE EFFICACE DEL SEGNALE RUMOROSO
m = 1;
d_s = A(1)*4/3;
[x0] = calcolo_rum_u(segnale_originale,m, d_s, N);
calcolo_valori_segnale(x0);
calcolo_spettro(x0, df, N)
%Onda con raddrizzamento a singola semionda e calcolo del valore medio ed
% efficace
[x0] = raddrizzamento_singola_semionda(segnale_originale);
calcolo_valori_segnale(x0);
%Onda con raddrizzamento a doppia semionda e calcolo del valore medio ed
% efficace
[x0] = raddrizzamento_doppia_semionda(segnale_originale);
calcolo_valori_segnale(x0);



%segnale multiarmonico a tre componenti
tipo = multiarmonico;
disp("segnale multiarmonico")
K = [1 3 5]; %input('vettore ordini armonici ==> ');
A = [3 4 5]; %input('vettore ampiezze armoniche ==> ');
P = [0 0 0]; %input('vettore fasi armoniche in radianti ==> ');
N = 128;  %input('N. di punti campionati ==> ');
f = 50;  %input('frequenza della componente fondamentale ==> ');
M = 4.;  %input('N. di periodi considerati ==> ');
[x0, df] = crea_segnale(tipo, K, A, P, N,f, M);
segnale_originale = x0;
% CALCOLA VALORE MEDIO E VALORE EFFICACE
calcolo_valori_segnale(x0);
% CALCOLA LO SPETTRO DEL SEGNALE
calcolo_spettro(x0, df, N)
% INTRODUCI RUMORE 1 + CALCOLA VALORE MEDIO E VALORE EFFICACE DEL SEGNALE RUMOROSO
m = 0;
d_s = (9.46)/4;
[x0] = calcolo_rum_g(segnale_originale,m, d_s, N);
calcolo_valori_segnale(x0);
calcolo_spettro(x0, df, N)
% INTRODUCI RUMORE 2 + CALCOLA VALORE MEDIO E VALORE EFFICACE DEL SEGNALE RUMOROSO
m = 1;
d_s = (9.46)*4/3;
[x0] = calcolo_rum_g(segnale_originale,m, d_s, N);
calcolo_valori_segnale(x0);
calcolo_spettro(x0, df, N)
%INTRODUZIONE RUMORE 3 UNIFORME + CALCOLA VALORE MEDIO E VALORE EFFICACE DEL SEGNALE RUMOROSO
m = 0;
d_s = (9.46)/4;
[x0] = calcolo_rum_u(segnale_originale,m, d_s, N);
calcolo_valori_segnale(x0);
calcolo_spettro(x0, df, N)
%INTRODUZIONE RUMORE 4 UNIFORME + CALCOLA VALORE MEDIO E VALORE EFFICACE DEL SEGNALE RUMOROSO
m = 1;
d_s = (9.46)*4/3;
[x0] = calcolo_rum_u(segnale_originale,m, d_s, N);
calcolo_valori_segnale(x0);
calcolo_spettro(x0, df, N)



% segnale onda quadrata 
tipo = onda_quadrata;
disp("segnale onda quadra")
K = 1; %input('vettore ordini armonici ==> ');
A = 4; %input('vettore ampiezze armoniche ==> ');
P = 0; %input('vettore fasi armoniche in radianti ==> ');
N = 128;  %input('N. di punti campionati ==> ');
f = 100;  %input('frequenza della componente fondamentale ==> ');
M = 4.;  %input('N. di periodi considerati ==> ');
[x0, df] = crea_segnale(tipo, K, A, P, N,f, M);
segnale_originale = x0;
% CALCOLA VALORE MEDIO E VALORE EFFICACE
calcolo_valori_segnale(x0);
% CALCOLA LO SPETTRO DEL SEGNALE
calcolo_spettro(x0, df, N)
% Onda con raddrizzamento a singola semionda e calcolo del valore medio ed
% efficace
[x0] = raddrizzamento_singola_semionda(segnale_originale);
calcolo_valori_segnale(x0)
% Onda con raddrizzamento a doppia semionda e calcolo del valore medio ed
% efficace
[x0] = raddrizzamento_doppia_semionda(segnale_originale);
calcolo_valori_segnale(x0)


%onda triangolare 
tipo = onda_triangolare;
disp("segnale onda triangolare")
K = 1; %input('vettore ordini armonici ==> ');
A = 4; %input('vettore ampiezze armoniche ==> ');
P = 0; %input('vettore fasi armoniche in radianti ==> ');
N = 128;  %input('N. di punti campionati ==> ');
f = 100;  %input('frequenza della componente fondamentale ==> ');
M = 4.;  %input('N. di periodi considerati ==> ');
[x0, df] = crea_segnale(tipo, K, A, P, N,f, M);
segnale_originale = x0;
% CALCOLA VALORE MEDIO E VALORE EFFICACE
calcolo_valori_segnale(x0);
% CALCOLA LO SPETTRO DEL SEGNALE
calcolo_spettro(x0, df, N)
% Onda con raddrizzamento a singola semionda e calcolo del valore medio ed
% efficace
[x0] = raddrizzamento_singola_semionda(segnale_originale);
calcolo_valori_segnale(x0);
% Onda con raddrizzamento a doppia semionda e calcolo del valore medio ed
% efficace
[x0] = raddrizzamento_doppia_semionda(segnale_originale);
calcolo_valori_segnale(x0);
fprintf("aaaaaa"\...
    "ciao")

%FUNZIONI
%CALCOLO SEGNALE
function [x0, df] = crea_segnale(tipo, K, A, P, N,f, M)
global singola_sinusoide multiarmonico onda_quadrata onda_triangolare
disp('frequenza di campionamento ==> ')
fc=N*f/M;
df=fc/N;
n0=0;  %input('N. ordine punto iniziale ==> ');
LK=length(K);
n=(n0:n0+N-1);
ka=2*pi*f/fc;
%inizializzo il segnale x0
x0=0;            %tensione continua
if tipo == singola_sinusoide || tipo == multiarmonico
    for j=1:LK
        c=A(j)*sin(ka*K(j)*n+P(j));
	    x0=x0+c;
    end
    
elseif tipo == onda_quadrata
    for j=1:LK
        c=A(j)*square(ka*K(j)*n+P(j));
	    x0=x0+c;
    end
elseif tipo == onda_triangolare
    for j=1:LK
         c=A(j)*sawtooth(ka*K(j)*n+P(j),0.5);
	    x0=x0+c;
    end
end   
figure, plot(x0,'k')
title ('segnale ingresso')
end
% CALCOLA VALORE MEDIO E VALORE EFFICACE DEL SEGNALE 
function calcolo_valori_segnale(segnale)
valore_medio = mean(segnale);
valore_efficace = rms(segnale);
fprintf('media = %d\n', valore_medio);
fprintf('Valore efficace = %d\n', valore_efficace);
pause
end
% CALCOLA LO SPETTRO DEL SEGNALE 
function calcolo_spettro(segnale, df, N)
A=fft(segnale);
B=abs(A);
len=N/2;
B=[B(1) 2*B(2:len)];  % ripiegamento in frequenza
[~, ~]=max(B);
assex=(0:len-1)*df;
figure, stem(assex, B(1,:)./N)
title ('spettro del segnale')
pause
end
%rumore gaussiano
function [segnale] = calcolo_rum_g(segnale, media, dev_standard, N)
fprintf("segnale ingresso+ rumore a distribuzione \ngaussiana")
fprintf("(media = %d, deviazione standard = %d)=\n",media, dev_standard)
rumore_gauss=media+dev_standard*randn(1,N);
segnale = segnale + rumore_gauss;
figure,  plot(segnale,'k')
title ('segnale con rumore gaussiano')
end
%rumore uniforme
function [segnale] = calcolo_rum_u(segnale, media, dev_standard, N)
fprintf("segnale ingresso+ rumore a distribuzione \nuniforme")
fprintf("(media = %d, deviazione standard = %d)=\n",media, dev_standard)
rumore_unif=media+dev_standard*rand(1,N);
segnale=segnale+rumore_unif;
figure,  plot(segnale,'k')
title ('segnale con rumore uniforme')
end
% Onda con raddrizzamento a singola semionda 
function [segnale_r]=raddrizzamento_singola_semionda(segnale)
segnale_r=segnale.*(segnale>=0);
figure, plot(segnale_r,'k') %onda sinusoidale a singola semionda
title ('onda con raddrizzamento a singola semionda')
fprintf('raddrizzamento a singola semionda\n');
end
% Onda con raddrizzamento a doppia semionda 
function [segnale_r] = raddrizzamento_doppia_semionda(segnale)
segnale_r=abs(segnale);
figure, plot(segnale_r,'k') % sinusoide doppia semionda
title ('onda con raddrizzamento a doppia semionda')
fprintf('raddrizzamento a doppia semionda\n');
end

