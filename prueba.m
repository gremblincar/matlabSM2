function varargout = prueba(varargin)
% PRUEBA MATLAB code for prueba.fig
%      PRUEBA, by itself, creates a new PRUEBA or raises the existing
%      singleton*.
%
%      H = PRUEBA returns the handle to a new PRUEBA or the handle to
%      the existing singleton*.
%
%      PRUEBA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRUEBA.M with the given input arguments.
%
%      PRUEBA('Property','Value',...) creates a new PRUEBA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before prueba_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to prueba_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help prueba

% Last Modified by GUIDE v2.5 05-Nov-2018 09:39:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @prueba_OpeningFcn, ...
                   'gui_OutputFcn',  @prueba_OutputFcn, ...
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


% --- Executes just before prueba is made visible.
function prueba_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to prueba (see VARARGIN)

% Choose default command line output for prueba
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes prueba wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = prueba_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global t;
global xyzaxes;
xyzaxes = 0;
t = 2;
x=-t:0.001:t;
x1=-t:0.001:t;
f=sqrt(1-(abs(x)-1).^2);
g=acos(1-abs(x1))-pi;
plot(x,f)
hold on
plot(x1,g)
xlim([-5 5])
ylim([-10 10])
% --- Executes on button press in P1.
function P1_Callback(hObject, eventdata, handles)
Crecer()
% hObject    handle to P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function Crecer()
    global t;
    t = t*1.2;
    cla
    x=-t:0.001:t;
    f=sqrt(1-(abs(x)-1).^2);
    g=acos(1-abs(x))-pi;
    plot(x,t*f);
    plot(x,t*g);


% --- Executes on button press in crecergrafica.
function crecergrafica_Callback(hObject, eventdata, handles)
funcioncrecergrafica()
% hObject    handle to crecergrafica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function funcioncrecergrafica()
    global xyzaxes;
    xyzaxes=xyzaxes+1;
    xlim([-5-xyzaxes 5+xyzaxes]);
    ylim([-15-xyzaxes 15+xyzaxes])

% --- Executes on button press in decrecergrafica.
function decrecergrafica_Callback(hObject, eventdata, handles)
funciondecrecergrafica()
% hObject    handle to decrecergrafica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function funciondecrecergrafica()
    global xyzaxes;
    xyzaxes=xyzaxes-1;
    xlim([-5-xyzaxes 5+xyzaxes]);
    ylim([-15-xyzaxes 15+xyzaxes])  