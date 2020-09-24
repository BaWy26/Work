function setDAQValues(handles)
% displays DAQ values in GUI 
for i=1:1000
    pause(0.1)
    if(handles.Pause.Value==0)
        value=getDaqDev1(handles);   
    end
if(strcmp(handles.case,'EMEO')==1)
   set(handles.display_VDC,'String',sprintf('%0.2f',value.VDC));
   set(handles.display_IDC,'String',sprintf('%0.2f',value.IDC));
   set(handles.display_Va,'String',sprintf('%0.2f',value.Va));
   set(handles.display_If,'String',sprintf('%0.3f',value.If));
   set(handles.display_speed,'String',sprintf('%0.1f',value.speed));
   
else 
set(handles.display_VAC1,'String',sprintf('%0.2f',value.VAC1));
set(handles.display_VAC2,'String',sprintf('%0.2f',value.VAC2));
set(handles.display_IAC1,'String',sprintf('%0.2f',value.IAC1));
set(handles.display_IAC2,'String',sprintf('%0.2f',value.IAC2));
set(handles.display_speed,'String',sprintf('%0.1f',value.speed));
set(handles.display_Pel,'String',sprintf('%0.2f',value.Pel));
set(handles.display_cosphi,'String',sprintf('%0.2f',value.cosphi));
set(handles.display_slip,'String',sprintf('%0.3f',value.slip));
end
end

