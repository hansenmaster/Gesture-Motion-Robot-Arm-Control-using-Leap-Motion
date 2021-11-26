clc
close all;
clearvars -except changeState goalBeforeError goalBeforeError2 goalBeforeError6;


%DEFINE FUZZY STRUCT CONTROL FOR JOINT1 AND JOINT2
Fuzzy_AI_Project
Fuzzy_AI_Project2



%% Leapmotion???[??????
[version]=matleap_version;
fprintf('matleap version %d.%d',version(1),version(2));
fprintf('\n');
frame_id=-1;
frames=0;
%posHand = zeros(1,3);

while (1)

    f=matleap_frame;
    for i=1:length(f.hands)
        frames=frames+1;
        %frames
        palm_normal(frames,1)=f.hands(i).palm_normal(1,1); %????x?????x???
        palm_normal(frames,2)=f.hands(i).palm_normal(1,3); %y??
        palm_normal(frames,3)=f.hands(i).palm_normal(1,2); %z??
        x=palm_normal(frames,1);
        y=palm_normal(frames,2);
        z=palm_normal(frames,3);
        palm_normal_anglezy=atan2d(z,y);

        if palm_normal_anglezy<0
            palm_normal_anglezy=-palm_normal_anglezy;
        else
        end
        pitch = palm_normal_anglezy;
        if f.hands(1).is_left==1
            hand(frames,1)=1; %hand?1?????,0????
            %disp ('left')
        elseif f.hands(1).is_right==1
            hand(frames,1)=0;
            %disp ('right')
        end
        
        grab_strength=f.hands(1).grab_strength;
        stabilized_palm_position=f.hands(1).stabilized_palm_position;        
        grab = grab_strength;
        
  
        
        pos = stabilized_palm_position;
        pause(0.1)
        

        
        %map output for joint1
        output = evalfis([pos(1)], Control);
        %map output2 for joint2
        output2 = evalfis([pos(2)], Control2);
        %define state for robot movement
        Control_AI_Project
        %execute the movement
        moveRobot;
        
        save('20161114-10-16')
    end
end