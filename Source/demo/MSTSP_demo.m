% ******************************************************************************
% * Version: 1.0
% * Last modified on: 28 May, 2018
% * Developers: Ting Huang
% *      email: cshting@mail.scut.edu.cn
% * ****************************************************************************

% Demonstration file on how to evaluate the benchmark suite of MSTSP

clear;
clc;
MSTSP_NAME = { 'simple1_9', 'simple2_10', 'simple3_10', 'simple4_11', 'simple5_12', 'simple6_12', ...
    'geometry1_10', 'geometry2_12', 'geometry3_10', 'geometry4_10', 'geometry5_10', 'geometry6_15', ...
    'composite1_28','composite2_34','composite3_22','composite4_33','composite5_35','composite6_39','composite7_42','composite8_45', ...
    'composite9_48','composite10_55','composite11_59','composite12_60','composite13_66'};
MSTSP_PATH = '../Results2/';
%MSTSP_PATH = '../Results2/';
CITY_SIZE = [9	10	10	11	12	12	10	12	10	10	10	15	28	34	22	33	35	39	42	45	48	55	59	60	66];
Max_FEs = [60000*ones(1,12) 1200000*ones(1,13)]; 
NP = 100;

for index = 1:25
    alg_solution = load(strcat(MSTSP_PATH,  char(MSTSP_NAME(index)), '_RUN_49.alg_solution')) + 1;
    %for j = 1 :NP
    %    alg_solution(j, :) = randperm(CITY_SIZE(index));
    %end
    % fprintf('%d alg_solution 数组的内容：\n',index);
%for i = 1:size(alg_solution, 1)
%    fprintf('%d: ', i);
%   for j = 1:size(alg_solution, 2)
%        fprintf('%d ', alg_solution(i, j));
%    end
%    fprintf('\n');
%end
    [Fbeta, DI] = MSTSP_measure(alg_solution, index);
    fprintf('%dth MSTSP: F_beta = %f, DI = %f\n', index,Fbeta, DI);
end


