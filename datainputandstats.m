close all;

set = [1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3];
rep = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5];

levels = [0,2.37,-4,0.4,-5, 1.4,0.5,-1,0.4,-5.6,1.2,-2.3,2.7,0.2,0.7];
errors = [7.01, 3.1, 7.6, 8.5, 1.2, 19.9, 6.3, 4.4, 14.2, 1.3, 6.9, 3.2, 10, 8.1, 7.3];

levels2 = [0, -4, 1.99, -1.7, -4.05, -5.3, -0.2, 0.8, -1.9, -3.2, -0.1, -0.11, 1.91, -0.7, 0.55];
errors2 = [19.813, 1.3, 12.1999, 31.53, 11.66, 5.7, 5.63, 4.7, 29.94, 1.6, 22.59, 10.89, 13.09, 7.8, 1.4];

levels3 = [0,1.5,0.5,1.1,-1.7,-3.3,2.8,-4.9,-1.3,-3.6,-4,0.9,2.7,-0.3,0.07];
errors3 = [12.9,9.2,19.4,14.3,17.6,24.8,16.3,4.8,16.4,5.4,11.2,3.7,4.4,16.3,9.2];

levels4 = [0,-5.3,1.2,0.8,1.6,2.9,-5.8, -2.4, -0.07, 2.0, -2.2, -5, -2.4, -2.1, -1];
errors4 = [17.3,2.7,17.6,19,13.3,21.1,12.2,1.9,5.4, 7.9, 2.5, 11.1, 7.9, 8.5, 7.1];

levels5 = [0, 1.5 , -2.2 , -2.4 ,-5.1 , -1.0 , -4.4 , -3.5 , -1, -1.6, -5.9, 1.4, -3.0, 0.0 , 0.3];
errors5 = [9.8, 6.7, 4.0, 9.9, 9.2, 13.2, 9.5, 8.4, 10.9, 9.7, 0.9, 6.0, 4.8, 3.7, 3.4  ];

levels6 = [0, -5.9, -3.65, 1, -5.7, 0.17, 1.1, 1.1, -5.8, 1.8, 2.2, -4, 2.2, 2.65, -0.4];
errors6 = [13.2, 10.39, 10.9, 13.89, 6.8, 5.9, 5.35, 0.599, 8.5, 2.0, 12, 3.9, 2.5, 7.58, 7.39];

levels7 = [0, -0.5, 2.3, -1.2 0.6, -3.7, -1.5, 1.7, -4.9, -5.5, 0.29, 0.6, -1.9, -1, -3.9];
errors7 = [3.1, 13.3, 8.4, 6.2, 6.2, 1.23, 5.5, 2.9, 8.8, 16.76, 1.5, 4.4, 5.3, 10.2, 9.8];

levels8 = [0, 1.74, -0.2, -4.1, -1.9, -0.1, -0.9, -5.8, 0.5, 1.0, -0.4, 1.2, 1.5, -0.3, 1.0];
errors8 = [19.1, 12.9, 34.5, 16.2, 15.4, 12.5, 8.7, 25.8, 4.2, 14.8, 3.8, 7.5, 2.1, 19.6, 1.2];

somedata = [levels, levels2, levels3, levels4, levels5, levels6, levels7; errors, errors2, errors3, errors4, errors5, errors6, errors7];

room1data = [levels(1,1:5),levels2(1,1:5),levels3(1,1:5),levels4(1,1:5),levels5(1,1:5),levels6(1,1:5),levels7(1,1:5);...
    errors(1,1:5),errors2(1,1:5),errors3(1,1:5),errors4(1,1:5),errors5(1,1:5),errors6(1,1:5),errors7(1,1:5)];

room2data = [levels(1,6:10),levels2(1,6:10),levels3(1,6:10),levels4(1,6:10),levels5(1,6:10),levels6(1,6:10),levels7(1,6:10);...
    errors(1,6:10),errors2(1,6:10),errors3(1,6:10),errors4(1,6:10),errors5(1,6:10),errors6(1,6:10),errors7(1,6:10)];

room3data = [levels(1,11:15),levels2(1,11:15),levels3(1,11:15),levels4(1,11:15),levels5(1,11:15),levels6(1,11:15),levels7(1,11:15);...
    errors(1,11:15),errors2(1,11:15),errors3(1,11:15),errors4(1,11:15),errors5(1,11:15),errors6(1,11:15),errors7(1,11:15)];

[Y,I]=sort(somedata(1,:));
sorteddata = somedata(:,I); 
sorteddatasmoothed = [sorteddata(1,:) ; sorteddata(2,:) + (sum(sorteddata(2,:)/length(sorteddata)))];

[Y, I] = sort(room1data(1,:));
sortedroom1data = room1data(:,I);

[Y, I] = sort(room2data(1,:));
sortedroom2data = room1data(:,I);

[Y, I] = sort(room1data(1,:));
sortedroom3data = room3data(:,I);

edges = [-6, -5, -4, -3, -2, -1, 0, 1, 2, 3];
datadisc = discretize(sorteddatasmoothed(1,:),edges);
i1 = 1;
i2 = 1;
i3 = 1;
i4 = 1;
i5 = 1;
i6 = 1;
i7 = 1;
i8 = 1;
i9 = 1;
lumpeddata = zeros(9,20);
lumpedlevels = zeros(9,20);
for i = 1 : length(sorteddatasmoothed)
    if(datadisc(i) == 1)
            lumpeddata(1,i1) = sorteddatasmoothed(2,i);
            lumpedlevels(1,i1) = datadisc(i);
            i1 = i1 + 1;
    elseif(datadisc(i)== 2)
            lumpeddata(2,i2) = sorteddatasmoothed(2,i);
            lumpedlevels(2,i2) = datadisc(i);
            i2 = i2 + 1;
    elseif(datadisc(i) == 3)
            lumpeddata(3,i3) = sorteddatasmoothed(2,i);
            lumpedlevels(3,i3) = datadisc(i);
            i3 = i3 + 1;
    elseif(datadisc(i) == 4)
            lumpeddata(4,i4) = sorteddatasmoothed(2,i);
            lumpedlevels(4,i4) = datadisc(i);
            i4 = i4 + 1;
    elseif(datadisc(i) == 5)
            lumpeddata(5,i5) = sorteddatasmoothed(2,i);
            lumpedlevels(5,i5) = datadisc(i);
            i5 = i5 + 1;
    elseif(datadisc(i) == 6)
            lumpeddata(6,i6) = sorteddatasmoothed(2,i);
            lumpedlevels(6,i6) = datadisc(i);
            i6 = i6 + 1;
    elseif(datadisc(i) == 7)
            lumpeddata(7,i7) = sorteddatasmoothed(2,i);
            lumpedlevels(7,i7) = datadisc(i);
            i7 = i7 + 1;
    elseif(datadisc(i) == 8)
            lumpeddata(8,i8) = sorteddatasmoothed(2,i);
            lumpedlevels(8,i8) = datadisc(i);
            i8 = i8 + 1;
    elseif(datadisc(i) == 9)
            lumpeddata(9,i9) = sorteddatasmoothed(2,i);
            lumpedlevels(9,i9) = datadisc(i);
            i9 = i9 + 1;
    end
end
figure();
plot(sorteddata(1,:),sorteddata(2,:));
ylabel('Localisation Error (degrees)');
xlabel('Diffuse Reverb Gain (dB)');
title('sorteddata');

figure();
plot(sorteddatasmoothed(1,:),sorteddatasmoothed(2,:));
ylabel('Localisation Error (degrees)');
xlabel('Diffuse Reverb Gain (dB)');
terrors = [errors; errors2; errors3; errors4; errors5];
title('smoothed sorteddata');

figure();
scatter( levels, errors);
hold on;
scatter( levels2, errors2);
scatter( levels3, errors3);
scatter( levels4, errors4);
scatter( levels5, errors5);
scatter( levels6, errors6);
scatter( levels7, errors7);
legend('sample1', 'sample 2', 'sample 3', 'sample 4', 'sample 5', 'sample6', 'sample7');
title('raw scatter');
hold off;
figure();

scatter( errors, levels);
hold on;
scatter( errors2, levels2);
scatter( errors3, levels3);
scatter( errors4, levels4);
scatter( errors5, levels5);
scatter( errors6, levels6);
scatter( errors7, levels7);
legend('sample1', 'sample 2', 'sample 3', 'sample 4', 'sample 5', 'sample6', 'sample7');
hold off;
figure();
subplot(1,3,1);
scatter(room1data(1,:), room1data(2,:));
ylabel('Localisation Error (degrees)');
xlabel('Diffuse Reverb Gain (dB)');
title('data for room 1');
subplot(1,3,2);
scatter(room2data(1,:), room2data(2,:));
ylabel('Localisation Error (degrees)');
xlabel('Diffuse Reverb Gain (dB)');
title('data for room 2');
subplot(1,3,3);
scatter(room3data(1,:), room3data(2,:));
ylabel('Localisation Error (degrees)');
xlabel('Diffuse Reverb Gain (dB)');
title('data for room 3');


% figure();
% boxplot(lumpeddata, lumpedlevels,'notch','on');