function varargout = Experiment(varargin)
% Experiment M-file for Experiment.fig
%      Experiment, by itself, creates a new Experiment or raises the existing
%      singleton*.
%
%      H = Experiment returns the handle to a new Experiment or the handle to
%      the existing singleton*.
%
%      Experiment('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Experiment.M with the given input arguments.
%
%      Experiment('Property','Value',...) creates a new Experiment or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Experiment_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Experiment_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Experiment

% Last Modified by GUIDE v2.5 04-Mar-2013 10:48:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Experiment_OpeningFcn, ...
                   'gui_OutputFcn',  @Experiment_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Experiment is made visible.
function Experiment_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Experiment (see VARARGIN)

% Choose default command line output for Experiment
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
clear all
set(gcf,'Color',[1,1,1])
axis off
imshow('logo_audi.png')
global TestSoundIsOnRight;
TestSoundIsOnRight=1;
% uistack(ax,'bottom');

% UIWAIT makes Experiment wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Experiment_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Frequency1_Callback(hObject, eventdata, handles)
% hObject    handle to Frequency1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global freq1;
str1=get(handles.Frequency1,'String');
freq1 = str2double(str1);
% Hints: get(hObject,'String') returns contents of Frequency1 as text
%        str2double(get(hObject,'String')) returns contents of Frequency1 as a double


% --- Executes during object creation, after setting all properties.
function Frequency1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Frequency1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Frequency2_Callback(hObject, eventdata, handles)
% hObject    handle to Frequency2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global freq2;
str2=get(handles.Frequency2,'String');
freq2 = str2double(str2);
% Hints: get(hObject,'String') returns contents of Frequency2 as text
%        str2double(get(hObject,'String')) returns contents of Frequency2 as a double


% --- Executes during object creation, after setting all properties.
function Frequency2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Frequency2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in ILD.
function ILD_Callback(hObject, eventdata, handles)
% hObject    handle to ILD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% data=make_ILD_k;
global subject freq1 freq2;
% make sure that form fields are read in to variables
Frequency1_Callback(hObject, eventdata, handles);
Frequency2_Callback(hObject, eventdata, handles);
Name_Callback(hObject, eventdata, handles);
% check values and run
if (ischar(subject)==1)
    if (freq1>50 & freq1<15000 & freq2>50 & freq2<15000 & ischar(subject)==1)
        type='ILD';
        main(type,subject,freq1,freq2);
    else set(handles.warn_frequencies,'Visible','off'); pause(0.4); set(handles.warn_frequencies,'Visible','on');    end
else
    warn_fields;
end


% --- Executes on button press in ITD.
function ITD_Callback(hObject, eventdata, handles)
% hObject    handle to ITD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global subject freq1 freq2;
% make sure that form fields are read in to variables
Frequency1_Callback(hObject, eventdata, handles);
Frequency2_Callback(hObject, eventdata, handles);
Name_Callback(hObject, eventdata, handles);
% check values and run
if (ischar(subject)==1)
    if (freq1>50 & freq1<15000 & freq2>50 & freq2<15000 & ischar(subject)==1)
        type='ITD';
        main(type,subject,freq1,freq2);
    else set(handles.warn_frequencies,'Visible','off'); pause(0.4); set(handles.warn_frequencies,'Visible','on');
    end
else
    warn_fields;
end



function Name_Callback(hObject, eventdata, handles)
% hObject    handle to Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global subject;
str_name=get(handles.Name,'String');
subject=str_name;
% Hints: get(hObject,'String') returns contents of Name as text
%        str2double(get(hObject,'String')) returns contents of Name as a double


% --- Executes during object creation, after setting all properties.
function Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function warn_frequencies_CreateFcn(hObject, eventdata, handles)
% hObject    handle to warn_frequencies (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function warn_frequencies_Callback(hObject, eventdata, handles)
% hObject    handle to warn_frequencies (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of warn_frequencies as text
%        str2double(get(hObject,'String')) returns contents of warn_frequencies as a double


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in TestSound.
function TestSound_Callback(hObject, eventdata, handles)
% hObject    handle to TestSound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestSoundIsOnRight;
if TestSoundIsOnRight
    anoise=[zeros(4000,1), randn(4000,1)/10];
else
    anoise=[randn(4000,1)/10, zeros(4000,1)];
end;
sound(anoise,22050);


% --- Executes on button press in TestSoundIsLeft.
function TestSoundIsLeft_Callback(hObject, eventdata, handles)
% hObject    handle to TestSoundIsLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TestSoundIsLeft
global TestSoundIsOnRight;
TestSoundIsOnRight=not(get(hObject,'Value'));


% --- Executes on button press in TestSoundIsRight.
function TestSoundIsRight_Callback(hObject, eventdata, handles)
% hObject    handle to TestSoundIsRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TestSoundIsRight
global TestSoundIsOnRight;
TestSoundIsOnRight=get(hObject,'Value');