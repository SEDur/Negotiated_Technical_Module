function data=saveExp (freq1,freq2,stimValues,result,resultbis,type,subject)

    data.Freq1=freq1;
    data.Freq2=freq2;  
    data.StimValues=stimValues;
    data.Results1=result;
    data.Results2=resultbis;
    data.Type=type;
    data.Subject=subject;
    newFileName=sprintf('%s_%s_%d_%d', data.Subject, data.Type, data.Freq1, data.Freq2); 
    save(newFileName,'data');
    
end