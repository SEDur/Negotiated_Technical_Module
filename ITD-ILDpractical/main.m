function main (type,subject,freq1,freq2)

    numRepeats=8; % how many times do you want each of them presented?

    if type == 'ILD', % which ILD values do you want to test, in dB?
        stimValues=[-5 -2 -1 1 2 5]; 
    end 
    if type == 'ITD', % which ITD values do you want to test, in ms?
        stimValues=[-0.3 -0.1 -0.05 0.05 0.1 0.3]; 
    end 

    global handle_choose numTrialsEdit stim;

    choose; %open figure 'choose'
    numTrialsEdit=findobj(get(handle_choose,'children'),'tag','numTrials');
    totalTrialsEdit=findobj(get(handle_choose,'children'),'tag','TotalTrials');
    
    
    toneAmp=0.3;
    toTest=[];
    frequencies=[];
    
    for ii=1:numRepeats, toTest=[toTest stimValues]; end;   % insert values to be tested in a matrix, size(matrix)=numel(stimValues)*numRepeats
    frequencies=[zeros(size(toTest)) ones(size(toTest))];   % 1->1st frequency and 0->2nd frequency, size(frequencies)=2*size(matrix)
    toTest=[toTest toTest]; % numel(stimValues)*numRepeats values for each frequencies
    mixMatrix=randperm(length(toTest));  % shuffle
    stim.stimValues=stimValues;
    stim.toTest=toTest(mixMatrix);  % random values
    stim.frequencies=frequencies(mixMatrix); % random frequencies
    
    stim.fs=48000;   % sample frequency
    stim.duration = 0.4; % seconds
    stim.numRepeats=numRepeats;
    numSamples=round(stim.fs*stim.duration);
    time=(1:numSamples)/stim.fs;
    tone=sin(2*pi*freq1*time)*toneAmp;  % pure tone
    tonebis=sin(2*pi*freq2*time)*toneAmp;
    stim.tone1=tone.*hanning(length(tone))';  % hamming window
    stim.tone2=tonebis.*hanning(length(tonebis))';
    
    set(totalTrialsEdit,'string',num2str(length(toTest)));
    if type == 'ILD', [responses] = test_ILD; end
    if type == 'ITD', [responses] = test_ITD; end
    close(handle_choose);
    if isempty(responses), 
        return;
    end;
    [result,resultbis] = ITD_ILD_analyse(stim,responses);
    data=saveExp(freq1,freq2,stim.stimValues,result,resultbis,type,subject);
    ITD_ILD_graph(data); 
    
end

