function myKeyPressFunction(src,evnt)
 global keyEvent;
 keyEvent=evnt,
 if strcmp(keyEvent.Key,'leftarrow'),
     disp('The reply is left');
 end;
