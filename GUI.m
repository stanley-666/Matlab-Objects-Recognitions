clc,clear all,close all;
[filename,path] = uigetfile('*.jpg');
if isequal(filename,0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(path,filename)]);
   validition_cnn ;
end