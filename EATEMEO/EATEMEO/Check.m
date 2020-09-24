getAllSpec; % Specifications of the setup, the file must be imported to C:\MeasSetup\ if folder is not created: import the folder
p=daq.createSession('ni');
addAnalogInputChannel(p,'Dev1',0:7, 'Voltage');
p.Rate=5000; 
[data,time] = p.startForeground;
V(:,1)=(data(:,1)-mean(data(:,1)))*Spec(4,1)-Spec(4,2);values.VAC1=rms(V(:,1));
 I(:,1)=(data(:,2)-mean(data(:,2)))*Spec(5,1)-Spec(5,2);values.IAC1=rms(I(:,1));
 V(:,2)=(data(:,3)-mean(data(:,3)))*Spec(6,1)-Spec(6,2);values.VAC2=rms(V(:,2));
 I(:,2)=(data(:,4)-mean(data(:,4)))*Spec(7,1)-Spec(7,2);values.IAC2=rms(I(:,2));
 I(:,3)=-(I(:,1)+I(:,2));
 V(:,3)=-(V(:,1)+V(:,2));
 Vf=(inv([1 -1 0;0 1 -1;1 1 1])*([V(:,[1 2]),V(:,1)*0]'))';
 P(:)=Vf(:,1).*I(:,1)+Vf(:,2).*I(:,3)+Vf(:,3).*I(:,2);
 subplot(2,1,1)
 plot(time,I)
 subplot(2,1,2)
 plot(P)
 line([time(1) time(end)],[rms(P) rms(P)])
 stop(p)
 Srms=3*rms(Vf(:,1))*rms(I(:,2));
 Prms=rms(P);
 disp(Prms/Srms)
  %close all
 %clear all
 %clc