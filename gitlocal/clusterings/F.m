function [ff,ppre,rrecall,fstd,index_pre,index_recall,index_f,sumn] = F( inx,gnd,k )
%F ���� ���༯inx���˹���ע�� gnd ��ȫ��Fֵ
% ����ÿ���˹���ע�� gnd_i:F��gnd_i��= max_j {F��gnd_i��inx_j��} 
% ȫ�� Fֵ��F= Sigma{ ratio_i * F(gnd_i) };
%   Detailed explanation goes her
if (size(inx,1)==1 )
    inx = inx';
end
if (size(gnd,1)==1)
    gnd = gnd';
end
f=[];
pre=[];
recall=[];
index_pre=[];
index_recall=[];
index_f=[];
[sortinx,inx] = sort(inx,'descend');
[sortgnd,gnd] = sort(gnd,'descend');
i=0; j=1;
while j<length(sortgnd)
   stop = true;
   temp = sortgnd(j);
   s = [gnd(j)];
   while stop && j<length(sortgnd)
      j=j+1; 
     if temp == sortgnd(j)
        s = [s gnd(j)];
     else
        stop =false;
     end
   end
     i = i+1;
[ f(i),pre(i),recall(i),index_pre(i),index_recall(i),index_f(i),sumn]...
 = f_P(sortinx,inx,s,length(s)); 
end
ff = sum(f)/k;
ppre = sum(pre)/k;
rrecall = sum(recall)/k;
fstd= std(f);
end
% if (size(inx,1)==1 )
%     inx = inx';
% end
% if (size(gnd,1)==1)
%     gnd = gnd';
% end
% [sortinx,inx] = sort(inx,'descend');
% [sortgnd,gnd] = sort(gnd,'descend');
% f=[];
% pre=[];
% recall=[];
% i=0; j=1;
% while j<length(sortgnd)
%    stop = true;
%    temp = sortgnd(j);
%    s = [gnd(j)];
%    while stop && j<length(sortgnd)
%       j=j+1; 
%      if temp == sortgnd(j)
%         s = [s gnd(j)];
%      else
%         stop =false;
%      end
%    end
%      i = i+1;
%     [ f(i),pre(i),recall(i)] =f_P(sortinx,inx,s,length(s));
%      
% end
% ff = sum(f)/k;
% ppre = sum(pre)/k;
% rrecall = sum(recall)/k;
% fstd= sstd(f,ff);
% end
% function [stds] = sstd(ff, mean)
% s = (ff-mean).^2;
% [m,n]=size(ff);
%  nn=max(m,n);
%  s = s/nn;
%  sums = sum(s);
%  stds =sqrt(sums);

