function varargout = choose(varargin)
% choose M-file for choose.fig
%      choose, by itself, creates a new choose or raises the existing
%      singleton*.
%
%      H = choose returns the handle to a new choose or the handle to
%      the existing singleton*.
%
%      choose('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in choose.M with the given input arguments.
%
%      choose('Property','Value',...) creates a new choose or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before choose_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to choose_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help choose

% Last Modified by GUIDE v2.5 28-Sep-2012 19:53:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @choose_OpeningFcn, ...
                   'gui_OutputFcn',  @choose_OutputFcn, ...
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


% --- Executes just before choose is made visible.
function choose_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to choose (see VARARGIN)

% Choose default command line output for choose
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(hObject, 'KeyPressFcn',@myKeyPressFunction);
children=get(hObject,'children');
for child=children,
    set(child, 'KeyPressFcn',@myKeyPressFunction);
end;
global handle_choose;
handle_choose=gcf;

% UIWAIT makes choose wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = choose_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Left.
function Left_Callback(hObject, eventdata, handles)
% hObject    handle to Left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LeftClicked;
LeftClicked=1;



% --- Executes on button press in Right.
function Right_Callback(hObject, eventdata, handles)
% hObject    handle to Right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LeftClicked;
LeftClicked=0;


function myKeyPressFunction(src,evnt)
 global keyEvent;
 keyEvent=evnt;
 global LeftClicked;
if strcmp(keyEvent.Key,'leftarrow'),
    LeftClicked=1;
end;
if strcmp(keyEvent.Key,'rightarrow')
    LeftClicked=0;
end;


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global close_choose;
% close_choose=get(handles.figure1,'CloseRequestFcn');
% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes on button press in cancelbutton.
function cancelbutton_Callback(hObject, eventdata, handles)
% hObject    handle to cancelbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LeftClicked;
LeftClicked=-1;