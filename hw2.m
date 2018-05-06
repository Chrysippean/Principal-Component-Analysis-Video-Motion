%% Daniel Nguyen, AMATH 482
% Assignment 2

clear all;
close all;
clc;

load('cam1_1.mat')
load('cam1_2.mat')
load('cam1_3.mat')
load('cam1_4.mat')
load('cam2_1.mat')
load('cam2_2.mat')
load('cam2_3.mat')
load('cam2_4.mat')
load('cam3_1.mat')
load('cam3_2.mat')
load('cam3_3.mat')
load('cam3_4.mat')

%find a way to truncate all in loop later
%b = vidFrames1_1(47:434,:,:,:);
%%
v1_1 = [];
for i = 1:length(vidFrames1_1(1,1,1,:))
    v = rgb2gray(vidFrames1_1(:,:,:,i));
    v1_1(:,:,i) = v;
end
v1_1 = uint8(v1_1);
for i = 1:length(v1_1(1,1,:))
    v = v1_1(:,:,i);
    v(v<200) = 0;
    v1_1(:,:,i) = v;
end
xy1_1 = [];
for i = 1:length(v1_1(1,1,:))
    frame = v1_1(:,:,i);
    x = [];
    for j = 1:length(frame(1,:))
       indices_x = find(frame(:,j), length(frame(:,1)), 'first');
       avg_index_x = sum(indices_x)/length(indices_x);
       x = [x avg_index_x];
    end
    x(isnan(x)) = 0;
    x_val = sum(x)/length(x);
    y = [];
    for k = 1:length(frame(:,1))
       indices_y = find(frame(k,:), length(frame(1,:)), 'first');
       avg_index_y = sum(indices_y)/length(indices_y);
       y = [y avg_index_y];
    end
    y(isnan(y)) = 0;
    y_val = sum(y)/length(y);
    xy = [x_val; y_val];
    xy1_1 = [xy1_1 xy];
end 

%%

v2_1 = [];
for i = 1:length(vidFrames2_1(1,1,1,:))
    v = rgb2gray(vidFrames2_1(:,:,:,i));
    v2_1(:,:,i) = v;
end
v2_1 = uint8(v2_1);
for i = 1:length(v2_1(1,1,:))
    v = v2_1(:,:,i);
    v(v<225) = 0;
    v2_1(:,:,i) = v;
end
xy2_1 = [];
for i = 1:length(v2_1(1,1,:))
    frame = v2_1(:,:,i);
    x = [];
    for j = 1:length(frame(1,:))
       indices_x = find(frame(:,j), length(frame(:,1)), 'first');
       avg_index_x = sum(indices_x)/length(indices_x);
       x = [x avg_index_x];
    end
    x(isnan(x)) = 0;
    x_val = sum(x)/length(x);
    y = [];
    for k = 1:length(frame(:,1))
       indices_y = find(frame(k,:), length(frame(1,:)), 'first');
       avg_index_y = sum(indices_y)/length(indices_y);
       y = [y avg_index_y];
    end
    y(isnan(y)) = 0;
    y_val = sum(y)/length(y);
    xy = [x_val; y_val];
    xy2_1 = [xy2_1 xy];
end

%%

v3_1 = [];
for i = 1:length(vidFrames3_1(1,1,1,:))
    v = rgb2gray(vidFrames3_1(:,:,:,i));
    v3_1(:,:,i) = v;
end
v3_1 = uint8(v3_1);
for i = 1:length(v3_1(1,1,:))
    v = v3_1(:,:,i);
    v(v<225) = 0;
    v3_1(:,:,i) = v;
end
xy3_1 = [];
for i = 1:length(v3_1(1,1,:))
    frame = v3_1(:,:,i);
    x = [];
    for j = 1:length(frame(1,:))
       indices_x = find(frame(:,j), length(frame(:,1)), 'first');
       avg_index_x = sum(indices_x)/length(indices_x);
       x = [x avg_index_x];
    end
    x(isnan(x)) = 0;
    x_val = sum(x)/length(x);
    y = [];
    for k = 1:length(frame(:,1))
       indices_y = find(frame(k,:), length(frame(1,:)), 'first');
       avg_index_y = sum(indices_y)/length(indices_y);
       y = [y avg_index_y];
    end
    y(isnan(y)) = 0;
    y_val = sum(y)/length(y);
    xy = [x_val; y_val];
    xy3_1 = [xy3_1 xy];
end

%%
min_len = min([length(xy1_1(1,:)) length(xy2_1(1,:)) length(xy3_1(1,:))]);
xy1 = [xy1_1(:,1:min_len); xy2_1(:,1:min_len); xy3_1(:,1:min_len)];

xy1_new = xy1;
for i = 1:length(xy1_new(:,1))
   mean_val = mean(xy1_new(i,:));
   xy1_new(i,:) = xy1_new(i,:) - mean_val;
   max_val = max(xy1_new(i,:));
   xy1_new(i,:) = xy1_new(i,:) / max_val;
end
[u1,s1,v1] = svd(xy1_new,'econ');

xy1_recon = u1(:,1)*s1(1,1)*v1(:,1).';

%%

v1_2 = [];
for i = 1:length(vidFrames1_2(1,1,1,:))
    v = rgb2gray(vidFrames1_2(:,:,:,i));
    v1_2(:,:,i) = v;
end
v1_2 = uint8(v1_2);
for i = 1:length(v1_2(1,1,:))
    v = v1_2(:,:,i);
    v(v<220) = 0;
    v1_2(:,:,i) = v;
end
xy1_2 = [];
for i = 1:length(v1_2(1,1,:))
    frame = v1_2(:,:,i);
    x = [];
    for j = 1:length(frame(1,:))
       indices_x = find(frame(:,j), length(frame(:,1)), 'first');
       avg_index_x = sum(indices_x)/length(indices_x);
       x = [x avg_index_x];
    end
    x(isnan(x)) = 0;
    x_val = sum(x)/length(x);
    y = [];
    for k = 1:length(frame(:,1))
       indices_y = find(frame(k,:), length(frame(1,:)), 'first');
       avg_index_y = sum(indices_y)/length(indices_y);
       y = [y avg_index_y];
    end
    y(isnan(y)) = 0;
    y_val = sum(y)/length(y);
    xy = [x_val; y_val];
    xy1_2 = [xy1_2 xy];
end 

%%

v2_2 = [];
for i = 1:length(vidFrames2_2(1,1,1,:))
    v = rgb2gray(vidFrames2_2(:,:,:,i));
    v2_2(:,:,i) = v;
end
v2_2 = uint8(v2_2);
for i = 1:length(v2_2(1,1,:))
    v = v2_2(:,:,i);
    v(v<240) = 0;
    v2_2(:,:,i) = v;
end
xy2_2 = [];
for i = 1:length(v2_2(1,1,:))
    frame = v2_2(:,:,i);
    x = [];
    for j = 1:length(frame(1,:))
       indices_x = find(frame(:,j), length(frame(:,1)), 'first');
       avg_index_x = sum(indices_x)/length(indices_x);
       x = [x avg_index_x];
    end
    x(isnan(x)) = 0;
    x_val = sum(x)/length(x);
    y = [];
    for k = 1:length(frame(:,1))
       indices_y = find(frame(k,:), length(frame(1,:)), 'first');
       avg_index_y = sum(indices_y)/length(indices_y);
       y = [y avg_index_y];
    end
    y(isnan(y)) = 0;
    y_val = sum(y)/length(y);
    xy = [x_val; y_val];
    xy2_2 = [xy2_2 xy];
end 

%%

v3_2 = [];
for i = 1:length(vidFrames3_2(1,1,1,:))
    v = rgb2gray(vidFrames3_2(:,:,:,i));
    v3_2(:,:,i) = v;
end
v3_2 = uint8(v3_2);
for i = 1:length(v3_2(1,1,:))
    v = v3_2(:,:,i);
    v(v<240) = 0;
    v3_2(:,:,i) = v;
end
xy3_2 = [];
for i = 1:length(v3_2(1,1,:))
    frame = v3_2(:,:,i);
    x = [];
    for j = 1:length(frame(1,:))
       indices_x = find(frame(:,j), length(frame(:,1)), 'first');
       avg_index_x = sum(indices_x)/length(indices_x);
       x = [x avg_index_x];
    end
    x(isnan(x)) = 0;
    x_val = sum(x)/length(x);
    y = [];
    for k = 1:length(frame(:,1))
       indices_y = find(frame(k,:), length(frame(1,:)), 'first');
       avg_index_y = sum(indices_y)/length(indices_y);
       y = [y avg_index_y];
    end
    y(isnan(y)) = 0;
    y_val = sum(y)/length(y);
    xy = [x_val; y_val];
    xy3_2 = [xy3_2 xy];
end

%%
min_len = min([length(xy1_2(1,:)) length(xy2_2(1,:)) length(xy3_2(1,:))]);
xy2 = [xy1_2(:,1:min_len); xy2_2(:,1:min_len); xy3_2(:,1:min_len)];

xy2_new = xy2;
for i = 1:length(xy2_new(:,1))
   mean_val = mean(xy2_new(i,:));
   xy2_new(i,:) = xy2_new(i,:) - mean_val;
   max_val = max(xy2_new(i,:));
   xy2_new(i,:) = xy2_new(i,:) / max_val;
end

[u2,s2,v2] = svd(xy2_new,'econ');

xy2_recon = u2(:,1)*s2(1,1)*v2(:,1).';

%%

v1_3 = [];
for i = 1:length(vidFrames1_3(1,1,1,:))
    v = rgb2gray(vidFrames1_3(:,:,:,i));
    v1_3(:,:,i) = v;
end
v1_3 = uint8(v1_3);
for i = 1:length(v1_3(1,1,:))
    v = v1_3(:,:,i);
    v(v<235) = 0;
    v1_3(:,:,i) = v;
end
xy1_3 = [];
for i = 1:length(v1_3(1,1,:))
    frame = v1_3(:,:,i);
    x = [];
    for j = 1:length(frame(1,:))
       indices_x = find(frame(:,j), length(frame(:,1)), 'first');
       avg_index_x = sum(indices_x)/length(indices_x);
       x = [x avg_index_x];
    end
    x(isnan(x)) = 0;
    x_val = sum(x)/length(x);
    y = [];
    for k = 1:length(frame(:,1))
       indices_y = find(frame(k,:), length(frame(1,:)), 'first');
       avg_index_y = sum(indices_y)/length(indices_y);
       y = [y avg_index_y];
    end
    y(isnan(y)) = 0;
    y_val = sum(y)/length(y);
    xy = [x_val; y_val];
    xy1_3 = [xy1_3 xy];
end 

%%

v2_3 = [];
for i = 1:length(vidFrames2_3(1,1,1,:))
    v = rgb2gray(vidFrames2_3(:,:,:,i));
    v2_3(:,:,i) = v;
end
v2_3 = uint8(v2_3);
for i = 1:length(v2_3(1,1,:))
    v = v2_3(:,:,i);
    v(v<240) = 0;
    v2_3(:,:,i) = v;
end
xy2_3 = [];
for i = 1:length(v2_3(1,1,:))
    frame = v2_3(:,:,i);
    x = [];
    for j = 1:length(frame(1,:))
       indices_x = find(frame(:,j), length(frame(:,1)), 'first');
       avg_index_x = sum(indices_x)/length(indices_x);
       x = [x avg_index_x];
    end
    x(isnan(x)) = 0;
    x_val = sum(x)/length(x);
    y = [];
    for k = 1:length(frame(:,1))
       indices_y = find(frame(k,:), length(frame(1,:)), 'first');
       avg_index_y = sum(indices_y)/length(indices_y);
       y = [y avg_index_y];
    end
    y(isnan(y)) = 0;
    y_val = sum(y)/length(y);
    xy = [x_val; y_val];
    xy2_3 = [xy2_3 xy];
end 

%%

v3_3 = [];
for i = 1:length(vidFrames3_3(1,1,1,:))
    v = rgb2gray(vidFrames3_3(:,:,:,i));
    v3_3(:,:,i) = v;
end
v3_3 = uint8(v3_3);
for i = 1:length(v3_3(1,1,:))
    v = v3_3(:,:,i);
    v(v<235) = 0;
    v3_3(:,:,i) = v;
end
xy3_3 = [];
for i = 1:length(v3_3(1,1,:))
    frame = v3_3(:,:,i);
    x = [];
    for j = 1:length(frame(1,:))
       indices_x = find(frame(:,j), length(frame(:,1)), 'first');
       avg_index_x = sum(indices_x)/length(indices_x);
       x = [x avg_index_x];
    end
    x(isnan(x)) = 0;
    x_val = sum(x)/length(x);
    y = [];
    for k = 1:length(frame(:,1))
       indices_y = find(frame(k,:), length(frame(1,:)), 'first');
       avg_index_y = sum(indices_y)/length(indices_y);
       y = [y avg_index_y];
    end
    y(isnan(y)) = 0;
    y_val = sum(y)/length(y);
    xy = [x_val; y_val];
    xy3_3 = [xy3_3 xy];
end 

%%

min_len = min([length(xy1_3(1,:)) length(xy2_3(1,:)) length(xy3_3(1,:))]);
xy3 = [xy1_3(:,1:min_len); xy2_3(:,1:min_len); xy3_3(:,1:min_len)];

xy3_new = xy3;
for i = 1:length(xy3_new(:,1))
   mean_val = mean(xy3_new(i,:));
   xy3_new(i,:) = xy3_new(i,:) - mean_val;
   max_val = max(xy3_new(i,:));
   xy3_new(i,:) = xy3_new(i,:) / max_val;
end

[u3,s3,v3] = svd(xy3_new,'econ');

xy3_recon = u3(:,1)*s3(1,1)*v3(:,1).';

%%

v1_4 = [];
for i = 1:length(vidFrames1_4(1,1,1,:))
    v = rgb2gray(vidFrames1_4(:,:,:,i));
    v1_4(:,:,i) = v;
end
v1_4 = uint8(v1_4);
for i = 1:length(v1_4(1,1,:))
    v = v1_4(:,:,i);
    v(v<200) = 0;
    v1_4(:,:,i) = v;
end
xy1_4 = [];
for i = 1:length(v1_4(1,1,:))
    frame = v1_4(:,:,i);
    x = [];
    for j = 1:length(frame(1,:))
       indices_x = find(frame(:,j), length(frame(:,1)), 'first');
       avg_index_x = sum(indices_x)/length(indices_x);
       x = [x avg_index_x];
    end
    x(isnan(x)) = 0;
    x_val = sum(x)/length(x);
    y = [];
    for k = 1:length(frame(:,1))
       indices_y = find(frame(k,:), length(frame(1,:)), 'first');
       avg_index_y = sum(indices_y)/length(indices_y);
       y = [y avg_index_y];
    end
    y(isnan(y)) = 0;
    y_val = sum(y)/length(y);
    xy = [x_val; y_val];
    xy1_4 = [xy1_4 xy];
end 

%%

v2_4 = [];
for i = 1:length(vidFrames2_4(1,1,1,:))
    v = rgb2gray(vidFrames2_4(:,:,:,i));
    v2_4(:,:,i) = v;
end
v2_4 = uint8(v2_4);
for i = 1:length(v2_4(1,1,:))
    v = v2_4(:,:,i);
    v(v<240) = 0;
    v2_4(:,:,i) = v;
end
xy2_4 = [];
for i = 1:length(v2_4(1,1,:))
    frame = v2_4(:,:,i);
    x = [];
    for j = 1:length(frame(1,:))
       indices_x = find(frame(:,j), length(frame(:,1)), 'first');
       avg_index_x = sum(indices_x)/length(indices_x);
       x = [x avg_index_x];
    end
    x(isnan(x)) = 0;
    x_val = sum(x)/length(x);
    y = [];
    for k = 1:length(frame(:,1))
       indices_y = find(frame(k,:), length(frame(1,:)), 'first');
       avg_index_y = sum(indices_y)/length(indices_y);
       y = [y avg_index_y];
    end
    y(isnan(y)) = 0;
    y_val = sum(y)/length(y);
    xy = [x_val; y_val];
    xy2_4 = [xy2_4 xy];
end

%%

v3_4 = [];
for i = 1:length(vidFrames3_4(1,1,1,:))
    v = rgb2gray(vidFrames3_4(:,:,:,i));
    v3_4(:,:,i) = v;
end
v3_4 = uint8(v3_4);
for i = 1:length(v3_4(1,1,:))
    v = v3_4(:,:,i);
    v(v<200) = 0;
    v3_4(:,:,i) = v;
end
xy3_4 = [];
for i = 1:length(v3_4(1,1,:))
    frame = v3_4(:,:,i);
    x = [];
    for j = 1:length(frame(1,:))
       indices_x = find(frame(:,j), length(frame(:,1)), 'first');
       avg_index_x = sum(indices_x)/length(indices_x);
       x = [x avg_index_x];
    end
    x(isnan(x)) = 0;
    x_val = sum(x)/length(x);
    y = [];
    for k = 1:length(frame(:,1))
       indices_y = find(frame(k,:), length(frame(1,:)), 'first');
       avg_index_y = sum(indices_y)/length(indices_y);
       y = [y avg_index_y];
    end
    y(isnan(y)) = 0;
    y_val = sum(y)/length(y);
    xy = [x_val; y_val];
    xy3_4 = [xy3_4 xy];
end

%%

min_len = min([length(xy1_4(1,:)) length(xy2_4(1,:)) length(xy3_4(1,:))]);
xy4 = [xy1_4(:,1:min_len); xy2_4(:,1:min_len); xy3_4(:,1:min_len)];

xy4_new = xy4;
for i = 1:length(xy4_new(:,1))
   mean_val = mean(xy4_new(i,:));
   xy4_new(i,:) = xy4_new(i,:) - mean_val;
   max_val = max(xy4_new(i,:));
   xy4_new(i,:) = xy4_new(i,:) / max_val;
end

[u4,s4,v4] = svd(xy4_new,'econ');
xy4_recon = u4(:,1)*s4(1,1)*v4(:,1).';
%%

figure(1)
for i = 1:6
    subplot(3,2,i)
    plot(xy1_new(i,:)) 
    axis = '';
    if mod(i, 2) == 1
        axis = 'x-position';
    else
        axis = 'y-position';
    end 
    xlabel('Time') 
    ylabel(axis) 
end

figure(2)
for i = 1:6
    subplot(3,2,i)
    plot(xy2_new(i,:))
    axis = '';
    if mod(i, 2) == 1
        axis = 'x-position';
    else
        axis = 'y-position';
    end 
    xlabel('Time') 
    ylabel(axis) 
end

figure(3)
for i = 1:6
    subplot(3,2,i)
    plot(xy3_new(i,:)) 
    axis = '';
    if mod(i, 2) == 1
        axis = 'x-position';
    else
        axis = 'y-position'
    end 
    xlabel('Time') 
    ylabel(axis) 
end

figure(4)
for i = 1:6
    subplot(3,2,i)
    plot(xy4_new(i,:))
    axis = '';
    if mod(i, 2) == 1
        axis = 'x-position';
    else
        axis = 'y-position';
    end
    xlabel('Time') 
    ylabel(axis) 
end

figure(5)
subplot(4,1,1)
plot(v1(:,1))
xlabel('Time') 
ylabel('Position') 
subplot(4,1,2)
plot(v2(:,1)) 
xlabel('Time') 
ylabel('Position') 
subplot(4,1,3)
plot(v3(:,1))
xlabel('Time') 
ylabel('Position') 
subplot(4,1,4)
plot(v4(:,1))
xlabel('Time') 
ylabel('Position') 

figure(6)
subplot(4,1,1)
semilogy(diag(s1),'.')
xlabel('Singular Values') 
ylabel('Modes') 
subplot(4,1,2)
semilogy(diag(s2),'.') 
xlabel('Singular Values') 
ylabel('Modes') 
subplot(4,1,3)
semilogy(diag(s3),'.') 
xlabel('Singular Values') 
ylabel('Modes') 
subplot(4,1,4)
semilogy(diag(s4),'.') 
xlabel('Singular Values') 
ylabel('Modes') 
