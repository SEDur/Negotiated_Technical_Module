
set = [1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3];
rep = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5];

levels = [0,2.37,-4,0.4,-5,1.4,0.5,-1,0.4,5.6,1.2,-2.3,2.7,0.2,0.7];
errors = [7.01, 3.1, 7.6, 8.5, 1.2, 19.9, 6.3, 4.4, 14.2, 1.3, 6.9, 3.2, 10, 8.1, 7.3];

levels2 = [0, -4, 1.99, -1.7, -4.05, -5.3, -0.2, 0.8, -1.9, -3.2, -0.1, -0.11, 1.91, -0.7, 0.55];
errors2 = [19.813, 1.3, 12.1999, 31.53, 11.66, 5.7, 5.63, 4.7, 29.94, 1.6, 22.59, 10.89, 13.09, 7.8, 1.4];

levels3 = [0,1.5,0.5,1.1,-1.7,-3.3,2.8,-4.9,-1.3,3.6,-4,0.9,2.7,-0.3,0.07];
errors3 = [12.9,9.2,19.4,14.3,17.6,24.8,16.3,4.8,16.4,5.4,11.2,3.7,4.4,16.3,9.2];

levels4 = [0,-5.3,1.2,0.8,1.6,2.9,-5.8, -2.4, -0.07, 2.0, -2.2, -5, -2.4, -2.1, -1];
errors4 = [17.3,2.7,17.6,19,13.3,21.1,12.2,1.9,5.4, 7.9, 2.5, 11.1, 7.9, 8.5, 7.1];

levels5 = [0, 1.5 , -2.2 , -2.4 ,-5.1 , -1.0 , -4.4 , -3.5 , -1, -1.6, -5.9, 1.4, -3.0, 0.0 , 0.3];
errors5 = [9.8, 6.7, 4.0, 9.9, 9.2, 13.2, 9.5, 8.4, 10.9, 9.7, 0.9, 6.0, 4.8, 3.7, 3.4  ];

terrors = [errors; errors2; errors3; errors4; errors5];
figure();
scatter( levels, errors);
hold on;
scatter( levels2, errors2);
scatter( levels3, errors3);
scatter( levels4, errors4);
scatter( levels5, errors5);
legend('sample1', 'sample 2', 'sample 3', 'sample 4', 'sample 5');
figure();
boxplot(terrors,'notch','on');