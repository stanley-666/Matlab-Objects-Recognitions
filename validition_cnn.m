function validition_cnn
load googlenet_matlab.mat 
net = googlenet_Train;
imd1 = imageDatastore('.\validation\TESTIMG','IncludeSubfolders', true);  %% image path
file = imd1.Files;

%% image order reset
t = size(file);
numofimgs = t(1,1);
numofoutput = fix(numofimgs/16) + 1 ;
file=cellstr(string(file'));
imd1.Files=file;
idx =sort(randperm(numel(file),numofimgs));

%% validation
inputSize = [224 224 3];
augimdsValidation = augmentedImageDatastore(inputSize,imd1, 'ColorPreprocessing','gray2rgb');

[YPred,probs] = classify(googlenet_Train,augimdsValidation);

part = fix(numofimgs/16) + 1 ;

h1 = figure('name','validation image with accurcy & label');
for i = 1 : part
for j=1:16
    P = subplot(4,4,j,'replace');
    th = j+16*(i-1) ;
    I = readimage(imd1,idx(th));
    imshow(I);
    label1 = YPred(idx(th));
    title(string(label1) + newline+'accuracy '+ num2str(100* max(probs(th,:)),'%0.002f')+"%");
    if th == numofimgs
        break
    end
end
  pause(1)
end
end

