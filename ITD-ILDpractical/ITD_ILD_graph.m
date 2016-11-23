function graph(data)

figure('name',sprintf('%s: %s', data.Subject, data.Type));
subplot(2,1,1);
% data.Results gives counts of "left" responses.
% Here we plot %right
proportionRightResponses1=(data.Results1(:,2)-data.Results1(:,1))./data.Results1(:,2);
proportionRightResponses2=(data.Results2(:,2)-data.Results2(:,1))./data.Results2(:,2);

pccorrect=proportionRightResponses1*100; 
plot(data.StimValues, pccorrect,'b^','Markersize',8, 'MarkerFaceColor','b');
set(gca,'fontname','arial','fontsize',12);
hold on
[b,dev,stats] = glmfit(data.StimValues, [data.Results1(:,2)-data.Results1(:,1),data.Results1(:,2)], 'binomial','link','probit');
xmin=min(data.StimValues);
xmax=max(data.StimValues);
xstep=(xmax-xmin)/100;
fittedXvals=xmin:xstep:xmax;
[yhat, yhatMin, yhatMax]=glmval(b,fittedXvals,'probit', stats);
title(sprintf('%s-%s-%d Hz', data.Subject, data.Type,  data.Freq1));
plot(fittedXvals, yhat*100, 'linewidth',2)
plot(fittedXvals, (yhat+yhatMax)*100, 'b--', 'linewidth',1)
plot(fittedXvals, (yhat-yhatMin)*100, 'b--','linewidth',1)
if data.Type == 'ILD', 
    xlabel('ILD [Right ear - Left ear intensity, dB]'); 
    set(gca,'xtick',[-5:1:5]);
end
if data.Type == 'ITD', 
    xlabel('ITD [Left ear - Right ear onset time, ms]'); 
    set(gca,'xtick',[-4:1:4]/10);
end
ylim([-5 105])
xlim([xmin xmax])
set(gca,'ytick',[-100:25:100]);
ylabel('% "right" responses')
grid on

subplot(2,1,2);
pccorrect=proportionRightResponses2*100; 
plot(data.StimValues, pccorrect, 'ro','Markersize',8, 'MarkerFaceColor','r')
set(gca,'fontname','arial','fontsize',12);
hold on;
[b,dev,stats] = glmfit(data.StimValues,[data.Results2(:,2)-data.Results2(:,1),data.Results2(:,2)], 'binomial','link','probit');
[yhat, yhatMin, yhatMax]=glmval(b,fittedXvals,'probit', stats);
plot(fittedXvals, yhat*100,'r', 'linewidth',2)
plot(fittedXvals, (yhat+yhatMax)*100, 'r--', 'linewidth',1)
plot(fittedXvals, (yhat-yhatMin)*100, 'r--','linewidth',1)
ylim([-5 105])
xlim([xmin xmax])
set(gca,'ytick',[-100:25:100]);
if data.Type == 'ILD', 
    xlabel('ILD [Right ear - Left ear intensity, dB]'); 
    set(gca,'xtick',[-5:1:5]);
end
if data.Type == 'ITD', 
    xlabel('ITD [Left ear - Right ear onset time, ms]'); 
    set(gca,'xtick',[-4:1:4]/10);
end
ylabel('% "right" responses')
title(sprintf('%s-%s-%d Hz', data.Subject, data.Type,  data.Freq2));
grid on;
set(gcf,'pos',[  360   164   556   534]);
