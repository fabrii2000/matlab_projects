% chiamerai questa file della funzione "somma.m", "serie()","parallelo()"
%funzione per sommare le matrici 
function y = somma(a,b)
[m1, n1]= size (a);[m2, n2]= size(b);
%controllo su compatibilità delle dimensioni di a e b
if (m1~=m2)|(n1~=n2)
    disp('Errore: dimensioni differenti di a e b')
    return
end
y = a+b;
end

function [y] = serie()
%serie di 2 fdt
%funzione di trasferimento  1
n1 =1; d1 = [1 1]; sis1 = tf(n1,d1);
% funzione di trasferimento 2 
n2 = 10; d2 = [1 10]; sis2 =tf(n2,d2);
% serie di fdt ed fdt2
sis3 = series(sis1, sis2);
sis4 = sis1*sis2;
y = [sis3 sis4];
return 
end
%parallelo tra fdt1 e fdt2
function y = parallelo()
%funzione di trasferimento  1
n1 = 1; d1 = [1 1]; sis1 = tf(n1,d1);
% funzione di trasferimento 2 
n2 = 10; d2 = [1 10]; sis2 =tf(n2,d2);
%parallelo tra sis1 e sis2
sis5 = parallel(sis1,sis2);
sis6 = sis1+sis2;
y = [sis5 sis6];
end
%retroazione
function y = retroazione()
%funzione ramo diretto
nG = 1; dG =[1 -1];%poloin s = +1
sisG = tf(nG,dG);
%funzione ramo di retroazione
nH = 10; dH = 1; sisH = tf(nH,dH);
%sistema chiuso in retrazione
sisG0 = feedback(sisG,sisH);
%sistema chiuso in retroazione unitaria
sisG0 = feedback(sisG,1);
end
%sistema del primo ordine
syms t
% risposta all'impuslo,sistema 1 tau =1
sis1 = tf(1,[1 1]); % s +1 denominatore
impulse(sis1,3), grid
% risposta all'impulso che converge

%sistema 2
sis2=tf(1,[-1 1]);
impulse(sis2, 3), grid
%risposta al gradino
%sistema co tau = 1
sis1=tf(1,[1 1]);
step(sis1,10), grid, 
hold on
sis2 = tf(1,[2 1]);
step(sis2,10), grid, 
hold on
sis3 = tf(1,[3 1]);
step(sis3,10), grid, 
hold on
sis4 = tf(1,[4 1]);
step(sis4,10), grid, 
hold on
sis5 = tf(1,[5 1]);
step(sis5,10), grid, legend('tau=1','tau=2','tau=3','tau=4','tau=5')
hold on
%risposta di tipo aperiodica,raggiunge il valore finale dopo un certo tempo
% plot della y(t) in risposta a questo gradino
% va studiato l'andamento di questa rispostas 
%-tempo di assestamento ci da una indicazione su quanto tempo la risposta
%del sistema ci impiega per raggiungere il valore finale ( 95% del valore
%finale) quanto tempo il sistema impiega a raggiungere il 95% del valore
%finale = tempo di assestamento 
%la risposta del sistema permane all'interno certa banda di tolleranza data
 
%errore relativo allla risposta indiciale
figure(2)
fplot(exp(-t),[0 6]), title ( 'errore risposta indiciale tau = 1')
fplot(exp(t),[0 6], title ( 'errore risposta indiciale tau = -1')
%errore relativo alla risposta della rampa unitaria
fplot(1-1*exp(-t),[0 6]), title ( 'errore risposta alla rampa unitaria tau = 1')
fplot(1-1*exp(t),[0 6], title ( 'errore risposta alla rampa unitaria tau = -1')


