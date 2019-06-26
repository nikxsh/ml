%#1. C4.5

%Quinlan, J. R. 1993. C4.5: Programs for Machine Learning.
%Morgan Kaufmann Publishers Inc.

% 决策树是如何工作的
% 决策树一般都是自上而下的来生成的。
% 选择分割的方法有好几种，但是目的都是一致的：对目标类尝试进行最佳的分割。
% 从根到叶子节点都有一条路径，这条路径就是一条“规则”。
% 决策树可以是二叉的，也可以是多叉的。
% 对每个节点的衡量：
% 1)        通过该节点的记录数
% 2)        如果是叶子节点的话，分类的路径
% 3)        对叶子节点正确分类的比例。
% 有些规则的效果可以比其他的一些规则要好。
% 
% 由于ID3算法在实际应用中存在一些问题，于是Quilan提出了C4.5算法，严格上说C4.5只能是ID3的一个改进算法。相信大家对ID3算法都很.熟悉了，这里就不做介绍。
%     C4.5算法继承了ID3算法的优点，并在以下几方面对ID3算法进行了改进：
%     1) 用信息增益率来选择属性，克服了用信息增益选择属性时偏向选择取值多的属性的不足；
%     2) 在树构造过程中进行剪枝；
%     3) 能够完成对连续属性的离散化处理；
%     4) 能够对不完整数据进行处理。
%     C4.5算法有如下优点：产生的分类规则易于理解，准确率较高。其缺点是：在构造树的过程中，需要对数据集进行多次的顺序扫描和排序，因而导致算法的低效。此外，C4.5只适合于能够驻留于内存的数据集，当训练集大得无法在内存容纳时程序无法运行。
function D = C4_5(train_features, train_targets, inc_node, region)

% Classify using Quinlan's C4.5 algorithm

% Inputs:

%  features - Train features

% targets     - Train targets

% inc_node    - Percentage of incorrectly assigned samples at a node

% region     - Decision region vector: [-x x -y y number_of_points]

%

% Outputs

% D   - Decision sufrace

%NOTE: In this implementation it is assumed that a feature vector with fewer than 10 unique values (the parameter Nu)

%is discrete, and will be treated as such. Other vectors will be treated as continuous

[Ni, M]  = size(train_features);

inc_node    = inc_node*M/100;

Nu          = 10;

%For the decision region

N           = region(5);

mx          = ones(N,1) * linspace (region(1),region(2),N);

my          = linspace (region(3),region(4),N)' * ones(1,N);

flatxy      = [mx(:), my(:)]';

%Preprocessing

%[f, t, UW, m]      = PCA(train_features, train_targets, Ni, region);

%train_features  = UW * (train_features - m*ones(1,M));;

%flatxy          = UW * (flatxy - m*ones(1,N^2));;

%Find which of the input features are discrete, and discretisize the corresponding

%dimension on the decision region

discrete_dim = zeros(1,Ni);

for i = 1:Ni,

   Nb = length(unique(train_features(i,:)));

   if (Nb <= Nu),

      %This is a discrete feature

      discrete_dim(i) = Nb;

      [H, flatxy(i,:)] = high_histogram(flatxy(i,:), Nb);

   end

end

%Build the tree recursively

disp('Building tree')

tree        = make_tree(train_features, train_targets, inc_node, discrete_dim, max(discrete_dim), 0);

%Make the decision region according to the tree

disp('Building decision surface using the tree')

targets  = use_tree(flatxy, 1:N^2, tree, discrete_dim, unique(train_targets));

D     = reshape(targets,N,N);

%END

function targets = use_tree(features, indices, tree, discrete_dim, Uc)

%Classify recursively using a tree

targets = zeros(1, size(features,2));

if (tree.dim == 0)

   %Reached the end of the tree

   targets(indices) = tree.child;

   return

end

       

%This is not the last level of the tree, so:

%First, find the dimension we are to work on

dim = tree.dim;

dims= 1:size(features,1);

%And classify according to it

if (discrete_dim(dim) == 0),

   %Continuous feature

   in    = indices(find(features(dim, indices) <= tree.split_loc));

   targets  = targets + use_tree(features(dims, :), in, tree.child(1), discrete_dim(dims), Uc);

   in    = indices(find(features(dim, indices) >  tree.split_loc));

   targets  = targets + use_tree(features(dims, :), in, tree.child(2), discrete_dim(dims), Uc);

else

   %Discrete feature

   Uf    = unique(features(dim,:));

 for i = 1:length(Uf),

    in       = indices(find(features(dim, indices) == Uf(i)));

      targets = targets + use_tree(features(dims, :), in, tree.child(i), discrete_dim(dims), Uc);

   end

end

   

%END use_tree

function tree = make_tree(features, targets, inc_node, discrete_dim, maxNbin, base)

%Build a tree recursively

[Ni, L]         = size(features);

Uc              = unique(targets);

tree.dim      = 0;

%tree.child(1:maxNbin) = zeros(1,maxNbin);

tree.split_loc    = inf;

if isempty(features),

   return

end

%When to stop: If the dimension is one or the number of examples is small

if ((inc_node > L) | (L == 1) | (length(Uc) == 1)),

   H     = hist(targets, length(Uc));

   [m, largest]  = max(H);

   tree.child   = Uc(largest);

   return

end

%Compute the node's I

for i = 1:length(Uc),

    Pnode(i) = length(find(targets == Uc(i))) / L;

end

Inode = -sum(Pnode.*log(Pnode)/log(2));

%For each dimension, compute the gain ratio impurity

%This is done separately for discrete and continuous features

delta_Ib    = zeros(1, Ni);

split_loc = ones(1, Ni)*inf;

for i = 1:Ni,

   data = features(i,:);

   Nbins = length(unique(data));

   if (discrete_dim(i)),

      %This is a discrete feature

  P = zeros(length(Uc), Nbins);

      for j = 1:length(Uc),

         for k = 1:Nbins,

            indices  = find((targets == Uc(j)) & (features(i,:) == k));

            P(j,k)  = length(indices);

         end

      end

      Pk          = sum(P);

      P           = P/L;

      Pk          = Pk/sum(Pk);

      info        = sum(-P.*log(eps+P)/log(2));

      delta_Ib(i) = (Inode-sum(Pk.*info))/-sum(Pk.*log(eps+Pk)/log(2));

   else

      %This is a continuous feature

      P = zeros(length(Uc), 2);

     

      %Sort the features

      [sorted_data, indices] = sort(data);

      sorted_targets = targets(indices);

     

      %Calculate the information for each possible split

      I = zeros(1, L-1);

      for j = 1:L-1,

         for k =1:length(Uc),

            P(k,1) = length(find(sorted_targets(1:j)   == Uc(k)));

            P(k,2) = length(find(sorted_targets(j+1:end) == Uc(k)));

         end

         Ps  = sum(P)/L;

         P  = P/L;

         info = sum(-P.*log(eps+P)/log(2));

         I(j) = Inode - sum(info.*Ps);  

      end

      [delta_Ib(i), s] = max(I);

  split_loc(i) = sorted_data(s);     

   end

end

%Find the dimension minimizing delta_Ib

[m, dim] = max(delta_Ib);

dims  = 1:Ni;

tree.dim = dim;

%Split along the 'dim' dimension

Nf  = unique(features(dim,:));

Nbins = length(Nf);

if (discrete_dim(dim)),

   %Discrete feature

   for i = 1:Nbins,

      indices      = find(features(dim, :) == Nf(i));

      tree.child(i) = make_tree(features(dims, indices), targets(indices), inc_node, discrete_dim(dims), maxNbin, base);

   end

else

   %Continuous feature

   tree.split_loc  = split

loc(dim);

   indices1      = find(features(dim,:) <= split_loc(dim));

   indices2      = find(features(dim,:) > split_loc(dim));

   tree.child(1)  = make_tree(features(dims, indices1), targets(indices1), inc_node, discrete_dim(dims), maxNbin);

   tree.child(2)  = make_tree(features(dims, indices2), targets(indices2), inc_node, discrete_dim(dims), maxNbin);

end


