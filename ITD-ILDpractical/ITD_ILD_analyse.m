function [result,resultbis] = analyse(stim,responses)    
    
    x=stim.toTest(find(stim.frequencies==1))';
    y=responses(find(stim.frequencies==1))';
    
    for i=1:size((stim.stimValues),2)
        result(1,i)=sum(y(find(x==stim.stimValues(i))));
    end 
    

    xbis=stim.toTest(find(stim.frequencies==0))';
    ybis=responses(find(stim.frequencies==0))';
    
    for i=1:size((stim.stimValues),2)
        resultbis(1,i)=sum(ybis(find(xbis==stim.stimValues(i))));
    end
    
    
    result=[result',ones(numel(result),1)* stim.numRepeats];
    resultbis=[resultbis',ones(numel(resultbis),1)* stim.numRepeats];
    
end