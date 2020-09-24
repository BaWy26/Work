function varargout = EATTestBench(varargin)
% EATTESTBENCH MATLAB code for EATTestBench.fig
%      EATTESTBENCH, by itself, creates a new EATTESTBENCH or raises the existing
%      singleton*.
%
%      H = EATTESTBENCH returns the handle to a new EATTESTBENCH or the handle to
%      the existing singleton*.
%
%      EATTESTBENCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EATTESTBENCH.M with the given input arguments.
%
%      EATTESTBENCH('Property','Value',...) creates a new EATTESTBENCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EATTestBench_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EATTestBench_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EATTestBench

% Last Modified by GUIDE v2.5 25-Feb-2018 11:10:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EATTestBench_OpeningFcn, ...
                   'gui_OutputFcn',  @EATTestBench_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
               

              
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% End initialization code - DO NOT EDIT


% --- Executes just before EATTestBench is made visible.
function EATTestBench_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EATTestBench (see VARARGIN)

% Choose default command line output for EATTestBench
% Choose default command line output for EMEOTestBench
handles.output = hObject;
handles.s=daq.createSession('ni');
handles.p=daq.createSession('ni');
try
addCounterInputChannel(handles.s,'Dev1','ctr0','EdgeCount');
    addAnalogInputChannel(handles.p,'Dev1',0:7, 'Voltage');
    handles.p.Rate=5000;
catch
    warning('No devices found');
end
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes EATTestBench wait for user response (see UIRESUME)
% uiwait(handles.figure1)

% --- Outputs from this function are returned to the command line.
function varargout = EATTestBench_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Spec
if(strcmp(handles.output,'<==')==1)
    close all;
    MainProg;
elseif(strcmp(handles.output,'Close')==1)
    handles.output='No';
end
varargout{1} = handles.output
handles.Pause.Value=0;
set(handles.testbenchnumber,'String',sprintf('%0.0f',Spec(1,1)));
%handles=setEMEOTBSettings(handles);
handles.case='EAT';
setDAQValues(handles);


% --- Executes on button press in knop.
function knop_Callback(hObject, eventdata, handles)
% hObject    handle to knop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB




function display_VAC1_Callback(hObject, eventdata, handles)
% hObject    handle to display_VAC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%set(handles.display_VAC1,'String',num2str(value))
% Hints: get(hObject,'String') returns contents of display_VAC1 as text
%        str2double(get(hObject,'String')) returns contents of display_VAC1 as a double

% --- Executes during object creation, after setting all properties.
function display_VAC1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_VAC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_VAC2_Callback(hObject, eventdata, handles)
% hObject    handle to display_VAC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_VAC2 as text
%        str2double(get(hObject,'String')) returns contents of display_VAC2 as a double


% --- Executes during object creation, after setting all properties.
function display_VAC2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_VAC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_IAC2_Callback(hObject, eventdata, handles)
% hObject    handle to display_IAC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_IAC1 as text
%        str2double(get(hObject,'String')) returns contents of display_IAC1 as a double


% --- Executes during object creation, after setting all properties.
function display_IAC2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_IAC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_IAC1_Callback(hObject, eventdata, handles)
% hObject    handle to display_IAC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_IAC1 as text
%        str2double(get(hObject,'String')) returns contents of display_IAC1 as a double


% --- Executes during object creation, after setting all properties.
function display_IAC1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_IAC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_cosphi_Callback(hObject, eventdata, handles)
% hObject    handle to display_cosphi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_cosphi as text
%        str2double(get(hObject,'String')) returns contents of display_cosphi as a double


% --- Executes during object creation, after setting all properties.
function display_cosphi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_cosphi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_Pel_Callback(hObject, eventdata, handles)
% hObject    handle to display_Pel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_Pel as text
%        str2double(get(hObject,'String')) returns contents of display_Pel as a double


% --- Executes during object creation, after setting all properties.
function display_Pel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_Pel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_speed_Callback(hObject, eventdata, handles)
% hObject    handle to display_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_speed as text
%        str2double(get(hObject,'String')) returns contents of display_speed as a double


% --- Executes during object creation, after setting all properties.
function display_speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Pause.
function Pause_Callback(hObject, eventdata, handles)
% hObject    handle to Pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Pause


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function display_slip_Callback(hObject, eventdata, handles)
% hObject    handle to display_slip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_slip as text
%        str2double(get(hObject,'String')) returns contents of display_slip as a double


% --- Executes during object creation, after setting all properties.
function display_slip_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_slip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TestbenchEdit_Callback(hObject, eventdata, handles)
% hObject    handle to TestbenchEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TestbenchEdit as text
%        str2double(get(hObject,'String')) returns contents of TestbenchEdit as a double


% --- Executes during object creation, after setting all properties.
function TestbenchEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TestbenchEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = get(hObject,'String');
% Use UIRESUME instead of delete because the OutputFcn needs
% to get the updated handles structure.
uiresume(handles.figure1);
% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton3 (see GCBO)
handles.output = get(hObject,'String');

% Update handles structure
guidata(hObject, handles);

% Use UIRESUME instead of delete because the OutputFcn needs
% to get the updated handles structure.
uiresume(handles.figure1);



function testbenchnumber_Callback(hObject, eventdata, handles)
% hObject    handle to testbenchnumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of testbenchnumber as text
%        str2double(get(hObject,'String')) returns contents of testbenchnumber as a double


% --- Executes during object creation, after setting all properties.
function testbenchnumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to testbenchnumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
