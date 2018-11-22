function varargout = prueba(varargin)

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

function Original()
global t;
global x1;
global x;
global xyzaxes;
global f;
global g;
xyzaxes = 0;
t = 2;
x=-t:0.001:t;
x1=-t:0.001:t;
f=sqrt(1-(abs(x)-1).^2);
g=acos(1-abs(x1))-pi;
f=f*t;
g=g*t;
plot(x,f)
hold on
plot(x1,g)
xlim([-5 5])
ylim([-10 10])


function varargout = prueba_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
Original()
global crece;
global decre;
global dere;
global izq;
global arrib;
global abaj;
crece=0;
decre=0;
dere=0;
izq=0;
arrib=0;
abaj=0;
global t;
global x1;
global x;
global f;
global g;
plot(x,f)
hold on
plot(x1,g)
xlim([-5 5])
ylim([-10 10])

function Crecer_Callback(hObject, eventdata, handles)
    global x1;
    global x;
    global f;
    global g;
    global crece;
    ex=1+(crece/10);
    if crece~=0
    f=f*ex;
    g=g*ex;
    x=x*ex;
    x1=x1*ex;
    end
    
function crecergrafica_Callback(hObject, eventdata, handles)
    global xyzaxes;
    xyzaxes=xyzaxes+1;
    xlim([-5-xyzaxes 5+xyzaxes]);
    ylim([-15-xyzaxes 15+xyzaxes])
    
function decrecergrafica_Callback(hObject, eventdata, handles)
    global xyzaxes;
    xyzaxes=xyzaxes-1;
    xlim([-5-xyzaxes 5+xyzaxes]);
    ylim([-15-xyzaxes 15+xyzaxes])  

function PruebadeRotar_Callback(hObject, eventdata, handles)
    global x1;
    global x;
    global f;
    global g;
    global grados;
    global gradosc;
    gradosc=grados*(180/3.14);
    cla
    %x=x*cos(-gradosc)-f*sin(-gradosc); NO SIRVE
    %f=f*sin(-grados)+f*cos(-grados);
    %x1=x1*cos(-gradosc)-g*sin(-gradosc); NO RIVE
    %g=g*sin(-grados)+g*cos(-grados);
    %x = (x-f*tan(gradosc))*cos(gradosc); NO SIRVE
    %f = f/cos(grados) + (x-f*tan(grados))*sin(grados);
    %x1 = (x1-g*tan(gradosc))*cos(gradosc); NO SIRVE
    %g = g/cos(grados) + (x1-g*tan(grados))*sin(grados);
   %x=x*cos(-45)-f*sin(-45);
    %f=f*sin(-45)+x*cos(-45);
    %x1=x1*cos(-45)-g*sin(-45);
    %g=g*sin(-45)+x1*cos(-45);
    f=-f;
    g=-g;
    plot(x,f)
    hold on
    plot(x1,g)

function RegresarAOriginal_Callback(hObject, eventdata, handles)
cla
Original()


function GradosaRotar_Callback(hObject, eventdata, handles)
global grados
grados=get(hObject,'value')-1

function GradosaRotar_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function GradosaRotar_KeyPressFcn(hObject, eventdata, handles)

function Decrecer_Callback(hObject, eventdata, handles)
    global x1;
    global x;
    global f;
    global g;
    global decre;
    ex=1+(decre/10);
    if decre~=0
    f=f/ex;
    g=g/ex;
    x=x/ex;
    x1=x1/ex;
    end


function DerechaGrafica_Callback(hObject, eventdata, handles)
    global x1;
    global x;
    global dere;
    ex=dere*.1;
    if dere~=0
    x1=x1+ex;
    x=x+ex;
    end


function IzquierdaGrafica_Callback(hObject, eventdata, handles)
    global x1;
    global x;
    global izq;
    ex=izq*.1;
    if izq~=0
    x1=x1-ex;
    x=x-ex;
    end

function ArribaDesplazar_Callback(hObject, eventdata, handles)
    global g;
    global f;
    global arrib;
    ex=arrib*.1;
    if arrib~=0
    f=f+ex;
    g=g+ex;
    end


function AbajoDesplazar_Callback(hObject, eventdata, handles)
    global g;
    global f;
    global abaj;
    ex=abaj*.1;
    if abaj~=0
    f=f-ex;
    g=g-ex;
    end


function AI_Callback(hObject, eventdata, handles)
ArribaDesplazar_Callback()
IzquierdaGrafica_Callback()


function DI_Callback(hObject, eventdata, handles)
AbajoDesplazar_Callback()
IzquierdaGrafica_Callback()

function AD_Callback(hObject, eventdata, handles)
ArribaDesplazar_Callback()
DerechaGrafica_Callback()

% --- Executes on button press in DD.
function DD_Callback(hObject, eventdata, handles)
% hObject    handle to DD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AbajoDesplazar_Callback()
DerechaGrafica_Callback()


% --- Executes on selection change in tagizq.
function tagizq_Callback(hObject, eventdata, handles)
% hObject    handle to tagizq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tagizq contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tagizq
global izq
izq=get(hObject,'value')-1


% --- Executes during object creation, after setting all properties.
function tagizq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tagizq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in tagder.
function tagder_Callback(hObject, eventdata, handles)
% hObject    handle to tagder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tagder contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tagder
global dere
dere=get(hObject,'value')-1


% --- Executes during object creation, after setting all properties.
function tagder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tagder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in tagabj.
function tagabj_Callback(hObject, eventdata, handles)
% hObject    handle to tagabj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tagabj contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tagabj
global abaj
abaj=get(hObject,'value')-1


% --- Executes during object creation, after setting all properties.
function tagabj_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tagabj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in tagarr.
function tagarr_Callback(hObject, eventdata, handles)
% hObject    handle to tagarr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tagarr contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tagarr
global arrib
arrib=get(hObject,'value')-1


% --- Executes during object creation, after setting all properties.
function tagarr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tagarr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in tagcrec.
function tagcrec_Callback(hObject, eventdata, handles)
% hObject    handle to tagcrec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tagcrec contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tagcrec
global crece
crece=get(hObject,'value')-1


% --- Executes during object creation, after setting all properties.
function tagcrec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tagcrec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in tagdecr.
function tagdecr_Callback(hObject, eventdata, handles)
% hObject    handle to tagdecr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tagdecr contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tagdecr
global decre
decre=get(hObject,'value')-1

% --- Executes during object creation, after setting all properties.
function tagdecr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tagdecr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in HacerTodo.
function HacerTodo_Callback(hObject, eventdata, handles)
% hObject    handle to HacerTodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global crece;
global decre;
global dere;
global izq;
global arrib;
global abaj;

if abaj~=0
AbajoDesplazar_Callback()
end
if dere~=0
DerechaGrafica_Callback()
end
if arrib~=0
ArribaDesplazar_Callback()
end
if izq~=0
IzquierdaGrafica_Callback()
end
if decre~=0
Decrecer_Callback()
end
if crece~=0
Crecer_Callback()
end
global x;
global x1;
global f;
global g;
cla
plot(x,f)
hold on
plot(x1,g)
