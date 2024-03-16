clc
clear all
close all
f=figure;
%matrice di rotazione R
%R10=[1 0 0;0 1 0;0 0 1]; 
alfa=[0:5:360]*pi/180;
for i = 1:length(alfa)
    R10=[cos(alfa(i)) -sin(alfa(i)) 0;sin(alfa(i)) cos(alfa(i)) 0;0 0 1];
    %punti del sdr fisso
    O0f= [0,0,0]';
    Pi0f= [1,0,0]';
    Pg0f= [0,1,0]';
    Pk0f= [0,0,1]';
    %punti nel sdr locale
    %punti del sdr locale (' dopo il vettore perché sono vettori colonna e ' fa la trasposta)
    O1l= [0,0,0]';
    Pi1l= [1,0,0]';
    Pg1l= [0,1,0]';
    Pk1l= [0,0,1]';
    %punti del quadrato
    Pail= [0,1,0.7]';
    Pbil= [1,1,0.7]';
    Pcil= [1,0,0.7]';
    Pdil= [0,0,0.7]';
    %punti nel sdr fisso
    O1f= R10*O1l;
    Pi1f= R10*Pi1l;
    Pg1f= R10*Pg1l;
    Pk1f= R10*Pk1l;
    %punti del quadrato nel sdr fisso
    Paif= R10*Pail;
    Pbif= R10*Pbil;
    Pcif= R10*Pcil;
    Pdif= R10*Pdil;
    
    %plotto i punti
    %sdr base
    plot3([O0f(1) Pi0f(1)],[O0f(2) Pi0f(2)],[O0f(3) Pi0f(3)],'r','linewidth',5);
    grid on
    hold on
    plot3([O0f(1) Pg0f(1)],[O0f(2) Pg0f(2)],[O0f(3) Pg0f(3)],'g','linewidth',5);
    plot3([O0f(1) Pk0f(1)],[O0f(2) Pk0f(2)],[O0f(3) Pk0f(3)],'b','linewidth',5);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    %sdr mobile
    plot3([O1f(1) Pi1f(1)],[O1f(2) Pi1f(2)],[O1f(3) Pi1f(3)],'r','linewidth',1);
    grid on
    hold on
    plot3([O1f(1) Pg1f(1)],[O1f(2) Pg1f(2)],[O1f(3) Pg1f(3)],'g','linewidth',1);
    plot3([O1f(1) Pk1f(1)],[O1f(2) Pk1f(2)],[O1f(3) Pk1f(3)],'b','linewidth',1);
    
    %quadrato
    plot3([Paif(1) Pbif(1) Pcif(1) Pdif(1) Paif(1)],[Paif(2) Pbif(2) Pcif(2) Pdif(2) Paif(2)],[Paif(3) Pbif(3) Pcif(3) Pdif(3) Paif(3)],'k','linewidth',2);
    xlim([-3 3]);
    ylim([-3 3]);
    zlim([-3 3]);
    pause(0.05); %rallenta animazione
        %cancella tutto nella figura tranne la scena successiva, elimina
        %cioè la precedente
        if i ~= length(alfa)
            clf(f,'reset') ;
        end

end
