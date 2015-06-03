%-----------convert mat data to leveldb / lmdb--------
% 1:convert .mat file to binary file
% 2:use cpp convert file to convert binary file to leveldb or lmdb

clear
clc

addpath(genpath('/home/young/caffe-master-test/Young/dataConvert'));

% procssing the training data
%load('train_32x32.mat'); % X-4D image data, y: label data

load test_32x32.mat

test_data = uint8(zeros(length(y), 3073));
%%
%test_batch
for p = 1:length(y)
    label = uint8(y(p));
    image = X(:,:,:,p);
    R = image(:,:,1)';
    G = image(:,:,2)';
    B = image(:,:,3)';
    test_data(p,:) = [label R(:)' G(:)' B(:)'];
end;

T = test_data';
fid = fopen('test_batch.bin', 'w');
fwrite(fid, T(:),'uint8');
fclose(fid);

fileID = fopen('test_batch.bin', 'r')
A = fread(fileID);
fclose(fileID)

%%
%train_batch
load train_32x32.mat
train_data = uint8(zeros(length(y), 3073));

for p = 1:length(y)
    label = uint8(y(p));
    image = X(:,:,:,p);
    R = image(:,:,1)';
    G = image(:,:,2)';
    B = image(:,:,3)';
    train_data(p,:) = [label R(:)' G(:)' B(:)'];
end;


T = train_data';
fid = fopen('train_batch.bin', 'w');
fwrite(fid, T(:),'uint8');
fclose(fid);

% fileID = fopen('train_batch.bin', 'r')
% A = fread(fileID);
% fclose(fileID)
