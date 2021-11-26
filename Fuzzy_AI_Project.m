Control=newfis('Robot Arm Base');

%% Input
Control=addvar(Control,'input','PosX',[-150 150]);
Control=addmf(Control,'input',1,'left','gaussmf',[60 -150]);
Control=addmf(Control,'input',1,'idle','gaussmf',[50 0]);
Control=addmf(Control,'input',1,'right','gaussmf',[60 150]);    

%% Output 1
Control=addvar(Control,'output','Velocity',[0 10]);
Control=addmf(Control,'output',1,'stop','gaussmf',[2 0]);
Control=addmf(Control,'output',1,'move','gaussmf',[2.5 10]);
% Control=addmf(Control,'output',1,'slow','gaussmf',[1 3]);
% Control=addmf(Control,'output',1,'medium','gaussmf',[1 6.5]);
% Control=addmf(Control,'output',1,'fast','gaussmf',[1 10]);

%% Output 2
Control=addvar(Control,'output','Direction',[0 10]);
Control=addmf(Control,'output',2,'left','trapmf',[0 0 3 5]);
Control=addmf(Control,'output',2,'right','trapmf',[5 7 10 10]);
%Control=addmf(Control,'output',2,'none','trapmf',[3 4 6 7]);

%% Rules
ruleList=[ ...
1 2 1 1 1 
2 1 0 1 1
3 2 2 1 1];
Control=addrule(Control,ruleList);
%showfis(a);
%showrule(a);
%output = evalfis([ 3 1 1], a)   