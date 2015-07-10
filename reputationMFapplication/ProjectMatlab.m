function varargout = ProjectMatlab(varargin)
% PROJECTMATLAB M-file for ProjectMatlab.fig
%      PROJECTMATLAB, by itself, creates a new PROJECTMATLAB or raises the existing
%      singleton*.
%
%      H = PROJECTMATLAB returns the handle to a new PROJECTMATLAB or the handle to
%      the existing singleton*.
%
%      PROJECTMATLAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTMATLAB.M with the given input arguments.
%
%      PROJECTMATLAB('Property','Value',...) creates a new PROJECTMATLAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProjectMatlab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProjectMatlab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProjectMatlab

% Last Modified by GUIDE v2.5 23-Jun-2015 10:10:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProjectMatlab_OpeningFcn, ...
                   'gui_OutputFcn',  @ProjectMatlab_OutputFcn, ...
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


% --- Executes just before ProjectMatlab is made visible.
function ProjectMatlab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProjectMatlab (see VARARGIN)

% Choose default command line output for ProjectMatlab
handles.output = hObject;

%load the beihang logo
background = imread('linkprediction.jpg');
axes(handles.linkprediction); 
axis off;
imshow(background);



% Update handles structure
guidata(hObject, handles);
% UIWAIT makes ProjectMatlab wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ProjectMatlab_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opc=questdlg('Do you want to quit?','Quit','Yes','No','No');
if strcmp(opc,'No')
return;
end
clear,clc,close all


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function SparseMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to reindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FullMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to FullMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenFile_Callback(hObject, eventdata, handles)
% hObject    handle to OpenFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%read data from txt file
Z = uigetfile('*.txt','pick a text file'); %get file with .txt format
% data = fileread(Z);
%Digunakan untuk mencegah error jk user tdk jd mengambil file
if isequal(Z,0)        
    return
end
data=load(Z);
fid = fopen(Z,'r','n','UTF-8');
str = textscan(fid, '%s', 'Delimiter','\n'); str = str{1};
fclose(fid);
set(handles.linkprediction,'visible','off');
set(handles.information,'visible','off');
%hFig = figure('Menubar','none', 'Toolbar','none');
hPan = uipanel('Title','User Service Rating','FontSize', 10, ...
    'Units','normalized', 'Position',[0.01 0.01 0.25 0.99]);
hEdit = uicontrol(hPan, 'Style','edit', 'FontSize',12, ...
    'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
    'BackgroundColor','white',...
    'Units','normalized', 'Position',[0 0 1 1], ...
    'String',str);
handles.data=data;
size(data)
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in reindex.
function reindex_Callback(hObject, eventdata, handles)
fprintf('start reindex ....');
% hObject    handle to reindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=handles.data; 
data
size(data)
[Q,L,R] =  reindex (data);
Q
size(Q)
% hPan = uipanel('Title','User Service Rating After Reindex','FontSize', 14, ...
%     'Units','normalized', 'Position',[0.02 0.04 0.7 0.9]);
hPan = uipanel('Title','User Service Rating After Reindex','FontSize', 10, ...
    'Units','normalized', 'Position',[0.26 0.01 0.25 0.99]);
hEdit = uicontrol(hPan, 'Style','edit', 'FontSize',12, ...
    'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
    'BackgroundColor','white',...
    'Units','normalized', 'Position',[0 0 1 1],'String',num2str(Q));
handles.data=Q;
guidata(hObject, handles);

%[m,n]=size(Q);
%set(handles.user,'String',m);
%set(handles.service,'String',n);
  %fprintf('After filtering, we have %d users, %d services\n',m,n);
%b=sparse(num2str(data(:,1)),num2str(data(:,2)),num2str(data(:,3)))
%b=sparse(a(:,1),a(:,2),a(:,3))
%disp(b);
%set(handles.listbox1,'String',b);

%b=sparse(num2str(data(:,1)),num2str(data(:,2)),num2str(data(:,3)))
%b=sparse(a(:,1),a(:,2),a(:,3))
% str = textscan(b, '%s', 'Delimiter','\n'); str = str{1};
% %set(handles.edit3,'string',b);
% hsparse = display('Title','Sparse Matrix','FontSize', 14, ...
%     'Units','normalized', 'Position',[0.02 0.09 0.7 0.9]);
% hEsp = uicontrol(hsparse, 'Style','edit', 'FontSize',12, ...
%     'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
%     'BackgroundColor','white',...
%     'Units','normalized', 'Position',[0 0 1 1], ...
%     'String',str);

 

% --- Executes on button press in fullmatrix.
function fullmatrix_Callback(hObject, eventdata, handles)
% hObject    handle to fullmatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% [Q,L,R] =  reindex (data);
%   [m,n]=size(Q);
%   fprintf('After filtering, we have %d users, %d services\n',m,n);
%  d=0.1;


B=handles.data; 
B
size(B)
 AA=sparse(B(:,1),B(:,2),B(:,3));
  Q=full(AA);
  [m,n]=size(Q)
% hPan = uipanel('Title','User Service Rating Full matrix','FontSize', 14, ...
%     'Units','normalized', 'Position',[0.02 0.04 0.7 0.9]);
% hEdit = uicontrol(hPan, 'Style','edit', 'FontSize',12, ...
%     'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
%     'BackgroundColor','white',...
%     'Units','normalized', 'Position',[0 0 1 1],'String',num2str(Q));

  f1=figure('Name','Observed Rating','Position', [100 300 752 250]);
 t = uitable('Parent', f1, 'Position', [25 50 700 200], 'Data', Q);

  set(handles.user,'String',m);
set(handles.service,'String',n);
handles.data=Q;
guidata(hObject, handles);




% --- Executes on button press in foundr.
function foundr_Callback(hObject, eventdata, handles)
% hObject    handle to foundr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Q=handles.data; 
d=0.1; 
 [ r ,A,history] = reputation( Q,d );
 hPan = uipanel('Title','User Reputation','FontSize', 10, ...
    'Units','normalized', 'Position',[0.51 0.01 0.15 0.99]);;
hEdit = uicontrol(hPan, 'Style','edit', 'FontSize',12, ...
    'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
    'BackgroundColor','white',...
    'Units','normalized', 'Position',[0 0 1 1],'String',num2str(r));


handles.Q=Q;
handles.r=r;
guidata(hObject, handles);

 
 
% --- Executes on button press in predict.
function predict_Callback(hObject, eventdata, handles)
% hObject    handle to predict (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Q=handles.Q; 
r=handles.r;
alpha=0.01;
q=3;
[U,S,rmse,history]=repMF(Q,r,alpha,q);
estimatedQ=U*S';
%  hPan = uipanel('Title','User Service Rating --predicted','FontSize', 14, ...
%     'Units','normalized', 'Position',[0.02 0.04 0.7 0.9]);
% hEdit = uicontrol(hPan, 'Style','edit', 'FontSize',12, ...
%     'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
%     'BackgroundColor','white',...
%     'Units','normalized', 'Position',[0 0 1 1],'String',num2str(estimatedQ));

  f2=figure('Name','Predicted Rating','Position', [100 100 752 250]);
 t = uitable('Parent', f2, 'Position', [25 50 700 200], 'Data', estimatedQ);

handles.Q=Q;
%  handles.U=U;
%  handles.S=S;
 handles.estimatedQ=estimatedQ;
handles.history=history;
guidata(hObject, handles);

% --- Executes on button press in rmse.
function rmse_Callback(hObject, eventdata, handles)
% hObject    handle to rmse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 history=handles.history;
 f = figure('Name','RMSE -iterations','Position', [200 150 752 250]);
 plot(history);
xlabel('iteration');
ylabel('rmse');

% --- Executes on button press in graphic.
function graphic_Callback(hObject, eventdata, handles)
% hObject    handle to graphic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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





function user_Callback(hObject, eventdata, handles)
% hObject    handle to user (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of user as text
%        str2double(get(hObject,'String')) returns contents of user as a double


% --- Executes during object creation, after setting all properties.
function user_CreateFcn(hObject, eventdata, handles)
% hObject    handle to user (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function service_Callback(hObject, eventdata, handles)
% hObject    handle to service (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of service as text
%        str2double(get(hObject,'String')) returns contents of service as a double


% --- Executes during object creation, after setting all properties.
function service_CreateFcn(hObject, eventdata, handles)
% hObject    handle to service (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lb.
function lb_Callback(hObject, eventdata, handles)
% hObject    handle to lb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lb contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lb


% --- Executes during object creation, after setting all properties.
function lb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
