 angleNow = readAngle(11);
  angleNow2 = readAngle(12);
  angleNow6 = readAngle(16);


% go right
if(state == 1)
    %angleNow = readAngle(11);
    deltaAngle = (output(1)-2.5)*20  ;
     speedNow = (output(1)-2.5)*13 ;
   goalAngle = angleNow-deltaAngle;
    if(goalBeforeError < angleNow)
angleNow = goalBeforeError;
end;
   if(goalAngle <1500)
        goalAngle = 1500;
   elseif(goalAngle >3000)
        goalAngle = 3000;
    else
    goalBeforeError = goalAngle;
   end;
   if speedNow >100
       speedNow =100;
   end;
    angleNow = setServo(speedNow,goalAngle,11);
    %angleNow = setServo(speedNow,angleNow-deltaAngle,11);
elseif(state == 0) %go left
        deltaAngle = (output(1)-2.5)*20  ;
     speedNow = (output(1)-2.5)*13 ;  
     goalAngle = angleNow+deltaAngle;
   if(goalAngle >3000)
        goalAngle = 3000;
   elseif(goalAngle <1500)
        goalAngle = 1500;
   end;
      if speedNow >100
       speedNow =100;
   end;
   angleNow = setServo(speedNow,goalAngle,11);
    %
    %angleNow = setServo(speedNow,angleNow+deltaAngle,11);
    
elseif(state == 5) % go down
    
     deltaAngle = (output2(1)-4.5)*15  ;
     speedNow = (output2(1)-4.5)*10 ;
     
     
    goalAngle = angleNow2+deltaAngle;
    if (goalAngle<goalBeforeError6)
        goalAngle= goalBeforeError6;
    end;
    
     if(goalAngle>2500)
         
        goalAngle = 2500
     elseif(goalAngle<1900)
         
        goalAngle = 1900
     else 
         goalBeforeError6 = goalAngle;
    end;
    
    if speedNow>70
        speedNow =70
    end;
    if speedNow<11&&goalAngle ==2500
        goalAngle = goalBeforeError6;
    end;
    angleNow2 = setServo(speedNow,goalAngle,12);
    
elseif(state == 6) %go up
     deltaAngle = (output2(1)-4.5)*15  ;
     speedNow = (output2(1)-4.5)*10 ;
    
    goalAngle = angleNow2-deltaAngle;
    if (goalAngle>goalBeforeError6)
        goalAngle= goalBeforeError6;
    end;
    if(goalAngle<1800)
        goalAngle = 1800
    elseif(goalAngle>2500)
        goalAngle = 2500
    else 
        goalBeforeError6 = goalAngle;
    end;
       if speedNow >100
       speedNow =100;
   end;
       if speedNow<11&&goalAngle == 1800;
        goalAngle = goalBeforeError6;
    end;
    angleNow2 = setServo(speedNow,goalAngle,12);
    
elseif(state == 9)
    goalAngle = angleNow6+35
    if goalBeforeError6>goalAngle
        goalAngle = goalBeforeError6;
    end;
     if(goalAngle>2700)
        goalAngle = 2700
     elseif(goalAngle<1600)
        goalAngle = 1600
      else
         goalBeforeError6 = goalAngle;
    end;

    angleNow6 = setServo(30,goalAngle,16);
    
elseif(state == 10)
   goalAngle = angleNow6-35
      if goalBeforeError6<goalAngle
        goalAngle = goalBeforeError6;
    end;
     if(goalAngle>2700)
        goalAngle = 2700
     elseif(goalAngle<1600)
        goalAngle = 1600
     else
         goalBeforeError6 = goalAngle;
    end;

    angleNow6 = setServo(35,goalAngle,16);
%     
    angleNow6 = setServo(20,goalAngle,16);
elseif(state == 8)
    setServo(20,1950,17);
    setServo(20,1900,16);
    setServo(20,2800,11);
    setServo(20,1600,17);
end;

changeState = 1;
   