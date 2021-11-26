function y = setServo(speed,angle,ID)
y = 0;
    if(ID == 14)
        tolerate = 30;
    else
        tolerate = 15;
    end;
   calllib('dynamixel','dxl_write_word',ID,32,speed);  
    r1=angle;
    y1 =int32(calllib('dynamixel','dxl_read_word',ID,36)); %36 is register for angle position

    while (y1>=r1+tolerate || y1<=r1-tolerate)
   calllib('dynamixel','dxl_write_word',ID,30,r1); %30 is register for targeted position
   y1 = int32(calllib('dynamixel','dxl_read_word',ID,36));
    end 
y = 1;
end

