function varargout = GUI_M(varargin)
% GUI_M MATLAB code for GUI_M.fig
%      GUI_M, by itself, creates a new GUI_M or raises the existing
%      singleton*.
%
%      H = GUI_M returns the handle to a new GUI_M or the handle to
%      the existing singleton*.
%
%      GUI_M('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_M.M with the given input arguments.
%
%      GUI_M('Property','Value',...) creates a new GUI_M or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_M_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_M_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_M

% Last Modified by GUIDE v2.5 02-Apr-2021 20:37:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_M_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_M_OutputFcn, ...
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


% --- Executes just before GUI_M is made visible.
function GUI_M_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_M (see VARARGIN)

% Choose default command line output for GUI_M
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = GUI_M_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function mywaitbar(x,varargin)
if nargin < 1
    error('Input arguments not valid');
end
set(0,'CurrentFigure',gcf);
fAxes = findobj(gcf,'type','axes');
set(gcf,'CurrentAxes',fAxes);
if nargin > 1
    hTitle = get(fAxes,'title');
    set(hTitle,'String',varargin{1});
end
fractioninput = x;
x = max(0,min(100*x,100));
if fractioninput == 0    
    cla
    pause(0.1) % 暂停小会清除上次使用进度 
    xpatch = [0 x x 0];
    ypatch = [0 0 1 1];
    xline = [100 0 0 100 100];
    yline = [0 0 1 1 0];
    patch(xpatch,ypatch,'b','EdgeColor','b','EraseMode','none');
    set(gcf,'UserData',fractioninput);
    l = line(xline,yline,'EraseMode','none');
    set(l,'Color',get(gca,'XColor'));   
else
    p = findobj(gcf,'Type','patch');
    l = findobj(gcf,'Type','line');
    if (get(gcf,'UserData') > fractioninput)
        set(p,'EraseMode','normal');
    end
    xpatch = [0 x x 0];
    set(p,'XData',xpatch);
    xline = get(l,'XData');
    set(l,'XData',xline);  
end
drawnow;


function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit1_ButtonDownFcn(hObject, eventdata, handles)

function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
function edit5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)
function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit8_Callback(hObject, eventdata, handles)
function edit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit9_Callback(hObject, eventdata, handles)
function edit9_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit10_Callback(hObject, eventdata, handles)
function edit10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit13_Callback(hObject, eventdata, handles)
function edit13_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit14_Callback(hObject, eventdata, handles)
function edit14_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit15_Callback(hObject, eventdata, handles)
function edit15_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit16_Callback(hObject, eventdata, handles)
function edit16_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit17_Callback(hObject, eventdata, handles)
function edit17_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit18_Callback(hObject, eventdata, handles)
function edit18_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit19_Callback(hObject, eventdata, handles)
function edit19_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit20_Callback(hObject, eventdata, handles)
function edit20_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit21_Callback(hObject, eventdata, handles)
function edit21_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit22_Callback(hObject, eventdata, handles)
function edit22_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% 两个按钮
function pushbutton1_Callback(hObject, eventdata, handles)
%% 蒙特卡洛仿真模拟主要程序代码

mywaitbar(0,'Please Wait...');
TheEndTime = 600; 
for t = 1:TheEndTime
       mywaitbar(t/TheEndTime,[num2str(floor(t*100/TheEndTime)),'%']);
end

N = str2num(get(handles.edit4,'string'));%随机模拟的次数
% RisklessRate = 0.0306;%无风险利率即银行利率来自9年平均值
% BorrowRate   = 0.055;%贷款利率取约定值
% RiskAversion = 39.8;%取厌恶系数平均值
%M期望 E为sigma
%ExpReturn=[ 11.58	3.87	22.02	0.99 ]./100;
%sigma =[0.05 0.01 0.05 0.01];%根据对未来的预期，分别给股票、债券、基金和房产赋予一个sigma
RisklessRate = str2num(get(handles.edit1,'string'));
BorrowRate   = str2num(get(handles.edit2,'string'));
RiskAversion = str2num(get(handles.edit3,'string'));
S_M = str2num(get(handles.edit5,'string'));%股票
S_E = str2num(get(handles.edit6,'string'));%正态分布标准差
B_M = str2num(get(handles.edit14,'string'));%债券
B_E = str2num(get(handles.edit15,'string'));
F_M = str2num(get(handles.edit17,'string'));%基金
F_E = str2num(get(handles.edit18,'string'));
H_M = str2num(get(handles.edit20,'string'));%房产
H_E = str2num(get(handles.edit21,'string'));
%生成服从正态分布的随机数
S = normrnd(S_M,S_E,N,1);
B = normrnd(B_M,B_E,N,1);
F = normrnd(F_M,F_E,N,1);
H = normrnd(H_M,H_E,N,1);

for i=1:N
	ExpReturns=[S(i) B(i) F(i) H(i)];
	set(handles.edit13,'string',S(i));
	set(handles.edit16,'string',B(i));
	set(handles.edit19,'string',F(i));
	set(handles.edit22,'string',H(i));
	ExpCovariance=[0.264	-0.01	0.273	0.025
                     -0.01	0.002	-0.013	-0.002
                     0.273	-0.013	0.318	0.028
                     0.025	-0.002	0.028	0.005 ];
            %由前面计算得到的协方差矩阵
	[PortRisk,PortReturn,PortWts]=portopt(ExpReturns,ExpCovariance,20);
	[RiskyRisk,RiskyReturn,RiskyWts,RiskyFraction,OverallRisk,OverallReturn]=portalloc(PortRisk,PortReturn,PortWts,RisklessRate,BorrowRate,RiskAversion);
	RiskWeights=RiskyWts*RiskyFraction;
    %show(i,:)=[OverallRisk OverallReturn]
	S1(i) = RiskWeights(1);
	B1(i) = RiskWeights(2);
	F1(i) = RiskWeights(3);
	H1(i) = RiskWeights(4);
    RiskWeights1(i,:)=RiskWeights;
    RiskyWts1(i,:)=RiskyWts;
    RiskyReturn1(i)=RiskyReturn;
    RiskyRisk1(i)=RiskyRisk;
    RiskyFraction1(i)=RiskyFraction;
	OverallRisk1(i) = OverallRisk;
	OverallReturn1(i) = OverallReturn;
end
global n
n=100;%数据分成的份数,即条形图的宽度
global x1 x2 x3 x4 x5 x6 S1 B1 F1 H1 OverallRisk1 OverallReturn1
       x1=min(S1):((max(S1)-min(S1))/n):max(S1);
       x2=min(B1):((max(B1)-min(B1))/n):max(B1);
       x3=min(F1):((max(F1)-min(F1))/n):max(F1);
       x4=min(H1):((max(H1)-min(H1))/n):max(H1);
       x5=min(OverallReturn1):((max(OverallReturn1)-min(OverallReturn1))/n):max(OverallReturn1);
       x6=min(OverallRisk1):((max(OverallRisk1)-min(OverallRisk1))/n):max(OverallRisk1);

handles.S= S1;
handles.B= B1;
handles.F= F1;
handles.H= H1;
handles.OverallRisk = OverallRisk;
handles.OverallReturn = OverallReturn;
guidata(hObject, handles);

function pushbutton2_Callback(hObject, eventdata, handles)%退出界面

function popupmenu1_Callback(hObject, eventdata, handles)%下拉菜单
% %% 频率图绘制
global n
global x1 x2 x3 x4 x5 x6 S1 B1 F1 H1 OverallRisk1 OverallReturn1
vari=get(handles.popupmenu1,'Value');
switch vari
    case 1
        figure
        S2=hist(S1,n+1);
        bar(x1,S2,'b')
        title('股票')
    case 2
        figure
        B2=hist(B1,n+1);
        bar(x2,B2,'b')
        title('债券')
    case 3   
        figure
        F2=hist(F1,n+1);
        bar(x3,F2,'b')
        title('基金')
    case 4
        figure
        H2=hist(H1,n+1);
        bar(x4,H2,'b')
        title('房产')
    case 5
        figure
        Oturn2=hist(OverallReturn1,n+1);
        bar(x5,Oturn2,'b')
        title('收益')
    case 6
        figure
        OverallRisk2=hist(OverallRisk1,n+1);
        bar(x6,OverallRisk2,'b')
        title('风险')
end
function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%

function img_CreateFcn(hObject, eventdata, handles)%画图








