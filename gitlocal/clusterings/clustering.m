function [idxL, f_value,pre,recall,f_std,index_pre,index_recall,index_f,sumn]...
    = clustering(U,Vo,gnd,K)
%CLUSTERING Summary of this function goes here
%   Detailed explanation goes here
    [ V ] = principlecoms( U,Vo,K );
%      V = D*V;%��ά��Ľ��
     V = normr(V);
%      D = diag(sum(W,2));
%      L = D-W;
%      [U,S,V] = svd(L);
%      V = U(:,N-K+1:N);
%      V = D*V;%��ά��Ľ��
    n = size(V,1);
    M = zeros(K,K,20);
    rand('state',123456789);
%ѡ20����ʼֵ for kmeans
 for i=1:size(M,3)
    inds = false(n,1);
    while sum(inds)<K
        j = ceil(rand()*n);
        inds(j) = true;
    end
    M(:,:,i) = V(inds,:);
 end

    idxL = kmeans(V,K,'replicates',20,'start',M);

    [f_value,pre,recall,f_std,index_pre,index_recall,index_f,sumn]...
        = F(idxL,gnd,K);
end




