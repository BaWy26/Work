function values=getDaqDev1(handles)
% Reads values from the data acquisition system ('Dev1') and stores this in
% the structure 'values'

global Spec
    count(1)=0;time(1)=0;
    tic
    %% Speed measurements
    for i=1:50;    
    count(i+1,:)=inputSingleScan(handles.s);% handles.s=> object for speed measurements
    time(i+1)=toc;
    speed(i)=(count(i+1)-count(i))/(time(i+1)-time(i));
    pause(0.01)
    end
    values.speed=mean(speed(2:end)*60/Spec(3,1));
    values.slip=1-values.speed/(3000/Spec(2,1));
    %% Voltage measurements 
    % AC-measurements
    [data,time] = handles.p.startForeground;% handles.p=> object for voltage measurements
     V(:,1)=(data(:,1)-mean(data(:,1)))*Spec(4,1)-Spec(4,2);values.VAC1=rms(V(:,1));
     I(:,1)=(data(:,2)-mean(data(:,2)))*Spec(5,1)-Spec(5,2);values.IAC1=rms(I(:,1));
     V(:,2)=(data(:,3)-mean(data(:,3)))*Spec(6,1)-Spec(6,2);values.VAC2=rms(V(:,2));
     I(:,2)=(data(:,4)-mean(data(:,4)))*Spec(7,1)-Spec(7,2);values.IAC2=rms(I(:,2));
    I(:,3)=-(I(:,1)+I(:,2));
    V(:,3)=-(V(:,1)+V(:,2));
    Vf=(inv([1 -1 0;0 1 -1;1 1 1])*([V(:,[1 2]),V(:,1)*0]'))';
    P(:)=Vf(:,1).*I(:,1)+Vf(:,2).*I(:,3)+Vf(:,3).*I(:,2);
    Prms=rms(P);Srms=sqrt(3)*rms(V(:,1))*rms(I(:,1));values.Pel=Prms;values.cosphi=Prms/Srms;
    % DC-measurements 
    values.VDC=rms(data(:,1)-mean(data(:,1)))*Spec(8,1)-Spec(8,2);%from AC measurements
     values.IDC=mean((data(:,6))*Spec(9,1))-Spec(9,2);
     values.Va=mean((data(:,5))*Spec(10,1))-Spec(10,2);
     values.If=mean((data(:,8)-Spec(11,2))*Spec(11,1));
    end

