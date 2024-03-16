clc
clear 
close all
f=figure;
%angoli
a1=[-90:1:0]*pi/180;
a2=[0:1:90]*pi/180;
matO2=[];
for i = 1:length(a1)
%punti del sdr fisso
    O0f= [0,0,0]';
    Pi0f= [2,0,0]';
    Pg0f= [0,2,0]';
    Pk0f= [0,0,2]';

%punti nel sdr locale 1
    O1l= [0,0,0,1]';
    Pi1l= [2,0,0,1]';
    Pg1l= [0,2,0,1]';
    Pk1l= [0,0,2,1]';
   
    %punti nel sdr locale 2
    O2l= [0,0,0,1]';
    Pi2l= [2,0,0,1]';
    Pg2l= [0,2,0,1]';
    Pk2l= [0,0,2,1]';
%lunghezza O0O1 e O1O2 (distanza centri dei sdr)
O0O1=3;
O1O2=3;
%matrici di posa rispettivamente di sdr1 risp sdr0 e di sdr2 risp sdr1
A10=[cos(a1(i)) -sin(a1(i)) 0 O0O1*cos(a1(i));...
    sin(a1(i)) cos(a1(i)) 0 O0O1*sin(a1(i));...
    0 0 1 0;...
    0 0 0 1];
A21=[cos(a2(i)) -sin(a2(i)) 0 O1O2*cos(a2(i));...
    sin(a2(i)) cos(a2(i)) 0 O1O2*sin(a2(i));...
    0 0 1 0;...
    0 0 0 1];

    %punti del sdr1 rispetto sdr0
    O1f=  A10*O1l;
    Pi1f= A10*Pi1l;
    Pg1f= A10*Pg1l;
    Pk1f= A10*Pk1l;

    %punti del sdr 2 rispetto sdr 1
    O2f=  A10*A21*O2l;
    Pi2f= A10*A21*Pi2l;
    Pg2f= A10*A21*Pg2l;
    Pk2f= A10*A21*Pk2l;    
    %salvo le coordinate di O2f
    matO2(:,i)=O2f(1:3);
%plot
    %sdr0
    plot3([O0f(1) Pi0f(1)],[O0f(2) Pi0f(2)],[O0f(3) Pi0f(3)],'r','linewidth',5);
    grid on
    hold on
    plot3([O0f(1) Pg0f(1)],[O0f(2) Pg0f(2)],[O0f(3) Pg0f(3)],'g','linewidth',5);
    plot3([O0f(1) Pk0f(1)],[O0f(2) Pk0f(2)],[O0f(3) Pk0f(3)],'b','linewidth',5);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    %sdr1
    plot3([O1f(1) Pi1f(1)],[O1f(2) Pi1f(2)],[O1f(3) Pi1f(3)],'r','linewidth',1);
    plot3([O1f(1) Pg1f(1)],[O1f(2) Pg1f(2)],[O1f(3) Pg1f(3)],'g','linewidth',1);
    plot3([O1f(1) Pk1f(1)],[O1f(2) Pk1f(2)],[O1f(3) Pk1f(3)],'b','linewidth',1);
    %sdr2
    plot3([O2f(1) Pi2f(1)],[O2f(2) Pi2f(2)],[O2f(3) Pi2f(3)],'r','linewidth',1);
    plot3([O2f(1) Pg2f(1)],[O2f(2) Pg2f(2)],[O2f(3) Pg2f(3)],'g','linewidth',1);
    plot3([O2f(1) Pk2f(1)],[O2f(2) Pk2f(2)],[O2f(3) Pk2f(3)],'b','linewidth',1); 
    %unisco O0 O1 O2
    plot3([O0f(1) O1f(1) O2f(1)],[O0f(2) O1f(2) O2f(2)],[O0f(3) O1f(3) O2f(3)],'k','linewidth',2);
    xlim([-2 8]);
    ylim([-9 8]);
    zlim([-5 5]);
    view([30 60]) %pov
    pause(0.05); %rallenta animazione
        %cancella tutto nella figura tranne la scena successiva
        if i ~= length(a1)
            clf(f,'reset') ;
        end

end
freq=100;
tempo=[1:length(a1)]*1/freq;
f1=figure;
%grafici delle coord. x,y,z di O2f
subplot(3,1,1)
plot(tempo,matO2(1,:))
xlabel('tempo (s)')
ylabel('x polso (cm)')

subplot(3,1,2)
plot(tempo,matO2(2,:))
xlabel('tempo (s)')
ylabel('y polso (cm)')

subplot(3,1,3)
plot(tempo,matO2(3,:))
xlabel('tempo (s)')
ylabel('z polso (cm)')

