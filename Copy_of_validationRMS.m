%% Statistical Analysis
%supress this if you do not want it
clear, clc, close all

%% Data for the 0kg
data1=load('5sec_grip_0kg_1_Adriana.mat');
data2=load('5sec_grip_0kg_2_Adriana.mat');
data3=load('5sec_grip_0kg_3_Adriana.mat');

%% Data for the 2kg
data4=load('5sec_grip_2kg_1_Adriana.mat');
data5=load('5sec_grip_2kg_2_Adriana.mat');
data6=load('5sec_grip_2kg_3_Adriana.mat');

%% Data for the 4kg
data7=load('5sec_grip_4kg_1_Adriana.mat');
data8=load('5sec_grip_4kg_2_Adriana.mat');
data9=load('5sec_grip_4kg_3_Adriana.mat');

%% Data for the 6kg
data10=load('5sec_grip_6kg_1_Adriana.mat');
data11=load('5sec_grip_6kg_2_Adriana.mat');
data12=load('5sec_grip_6kg_3_Adriana.mat');

%% Data for the 8kg
data13=load('5sec_grip_8kg_1_Adriana.mat');
data14=load('5sec_grip_8kg_2_Adriana.mat');
data15=load('5sec_grip_8kg_3_Adriana.mat');

%% Data for 10kg
data16=load('5sec_grip_10kg_3_Adriana.mat');
data17=load('5sec_grip_10kg_3_Adriana.mat');
data18=load('5sec_grip_10kg_3_Adriana.mat');

%% Find the peaks for each dataset and calculate RMS
dataSetArray=[data1.data,data2.data,data3.data,data4.data,data5.data,data6.data,data7.data,data8.data,data9.data,data10.data,data11.data,data12.data,data13.data,data14.data,data15.data,data16.data,data17.data,data18.data];

%scale down the EMG data
dataSetArray = dataSetArray - 512;

%second way to scale down
% baseline = (dataSetArray(:,1)+dataSetArray(:,2)+dataSetArray(:,3))./3
% dataSetArray = dataSetArray - baseline


%Data 1
   y1_peaks= findpeaks(dataSetArray(:,1));
   yVector1= y1_peaks;  
   rmsValue1= rms(y1_peaks);
%Data 2
   y2_peaks= findpeaks(dataSetArray(:,2));
   yVector2= y2_peaks;  
   rmsValue2= rms(y2_peaks);
%Data 3
   y3_peaks= findpeaks(dataSetArray(:,3));
   yVector3= y3_peaks;  
   rmsValue3= rms(y3_peaks);
%Data 4
   y4_peaks= findpeaks(dataSetArray(:,4));
   yVector4= y4_peaks;  
   rmsValue4= rms(y4_peaks);
%Data 5
   y5_peaks= findpeaks(dataSetArray(:,5));
   yVector5= y5_peaks;  
   rmsValue5= rms(y5_peaks);
%Data 6
   y6_peaks= findpeaks(dataSetArray(:,6));
   yVector6= y6_peaks;  
   rmsValue6= rms(y6_peaks);
%Data 7
   y7_peaks= findpeaks(dataSetArray(:,7));
   yVector7= y7_peaks;  
   rmsValue7= rms(y7_peaks);
%Data 8
   y8_peaks= findpeaks(dataSetArray(:,8));
   yVector8= y8_peaks;  
   rmsValue8= rms(y8_peaks);
%Data 9
   y9_peaks= findpeaks(dataSetArray(:,9));
   yVector9= y9_peaks;  
   rmsValue9= rms(y9_peaks);
%Data 10
   y10_peaks= findpeaks(dataSetArray(:,10));
   yVector10= y10_peaks;  
   rmsValue10= rms(y10_peaks);
%Data 11
   y11_peaks= findpeaks(dataSetArray(:,11));
   yVector11= y11_peaks;  
   rmsValue11= rms(y11_peaks);
%Data 12
   y12_peaks= findpeaks(dataSetArray(:,12));
   yVector12= y12_peaks;  
   rmsValue12= rms(y12_peaks);
%Data 13
   y13_peaks= findpeaks(dataSetArray(:,13));
   yVector13= y13_peaks;  
   rmsValue13= rms(y13_peaks);
%Data 14
   y14_peaks= findpeaks(dataSetArray(:,14));
   yVector14= y14_peaks;  
   rmsValue14= rms(y14_peaks);
%Data 15
   y15_peaks= findpeaks(dataSetArray(:,15));
   yVector15= y15_peaks;  
   rmsValue15= rms(y15_peaks);
%Data 16
   y16_peaks= findpeaks(dataSetArray(:,16));
   yVector16= y16_peaks;  
   rmsValue16= rms(y16_peaks);
%Data 17
   y17_peaks= findpeaks(dataSetArray(:,17));
   yVector17= y17_peaks;  
   rmsValue17= rms(y17_peaks);
%Data 18
   y18_peaks= findpeaks(dataSetArray(:,18));
   yVector18= y18_peaks;  
   rmsValue18= rms(y18_peaks);
%% Making plots for data (We may not need this but I just made it to visualize things)
%This compares all the RMS values across all trials
rmsValueTotal=[rmsValue1,rmsValue2,rmsValue3,rmsValue4,rmsValue5,rmsValue6,rmsValue7,rmsValue8,rmsValue9,rmsValue10,rmsValue11,rmsValue12,rmsValue13,rmsValue14,rmsValue15,rmsValue16,rmsValue17,rmsValue18];
figure
plot(1:18, rmsValueTotal,'-o','MarkerIndices',1:18)
title('RMS Values for Force Values in Each Trial')
xlabel('Trial Number')
ylabel('RMS Values')

%This is the average for each trial plotted
average1_3= mean(rmsValueTotal(1:3));
average4_6= mean(rmsValueTotal(4:6));
average7_9= mean(rmsValueTotal(7:9));
average10_12= mean(rmsValueTotal(10:12));
average13_15= mean(rmsValueTotal(13:15));
average16_18= mean(rmsValueTotal(16:18));
averageTotal=[average1_3,average4_6,average7_9,average10_12,average13_15,average16_18];

figure
Weight = [0:2:10]; %X axis
RMSvalue = averageTotal;    %y axis
linearModel = 10.15*Weight +11.3; %linear model found by app

plot(Weight, averageTotal,'r*') %plot measured data
hold on
plot(Weight,linearModel,'k-')   %plot the linear fit

title('Average of Force Trials')
xlabel('Weight (kg)')
ylabel('RMS (mV)')
xticks([0 2 4 6 8 10])
xticklabels({'0','2','4','6','8','10'})
legend('measured','linear model')
axis([-0.5,10.5,0,110])

%% ANOVA Test
%This will be the ANOVA test to compare the RMS values in each trial (not averaged)
%This one includes the noise, I wanted to keep this because the p-value
%shows that there are not significant changes when the noise is still
%present
[p,tbl,stats] = anova1(dataSetArray);

%Since after using findpeaks() the data sets are now longer the same size,
%I cannot use anova. I chose the smallest number of datapoints so that we
%could compare values. That is 1249.
y1_peaksAdjust= y1_peaks(1:1249,:);
y2_peaksAdjust= y2_peaks(1:1249,:);
y3_peaksAdjust=y3_peaks(1:1249,:);
y4_peaksAdjust=y4_peaks(1:1249,:);
y5_peaksAdjust=y5_peaks(1:1249,:);
y6_peaksAdjust=y6_peaks(1:1249,:);
y7_peaksAdjust=y7_peaks(1:1249,:);
y8_peaksAdjust=y8_peaks(1:1249,:);
y9_peaksAdjust=y9_peaks(1:1249,:);
y10_peaksAdjust=y10_peaks(1:1249,:);
y11_peaksAdjust=y11_peaks(1:1249,:);
y12_peaksAdjust=y12_peaks(1:1249,:);
y13_peaksAdjust=y13_peaks(1:1249,:);
y14_peaksAdjust=y14_peaks(1:1249,:);
y15_peaksAdjust=y15_peaks(1:1249,:);
y16_peaksAdjust=y16_peaks(1:1249,:);
y17_peaksAdjust=y17_peaks(1:1249,:);
y18_peaksAdjust=y18_peaks(1:1249,:);
AdjustArray=[y1_peaksAdjust,y2_peaksAdjust,y3_peaksAdjust,y4_peaksAdjust,y5_peaksAdjust,y6_peaksAdjust,y7_peaksAdjust,y8_peaksAdjust,y9_peaksAdjust,y10_peaksAdjust,y11_peaksAdjust,y12_peaksAdjust,y13_peaksAdjust,y14_peaksAdjust,y15_peaksAdjust,y16_peaksAdjust,y17_peaksAdjust,y18_peaksAdjust];
[pAdj,tbl_Adj,stats_Adj] = anova1(AdjustArray);
%When you run this it shows that it is significant