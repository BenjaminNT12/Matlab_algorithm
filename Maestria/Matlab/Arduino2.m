
function AnV = Arduino2(pin,val)
clear all port;
a = arduino('COM4','Mega2560','Libraries','Adafruit/MotorShieldV2');
while 1
    AnV=readVoltage(a,'A1')
    if(pin == 1)
        writePWMDutyCycle(a,'D10',AnV/255);
    else
        writePWMDutyCycle(a,'D11',AnV/255);    
    end
end
































% configurePin(a,'A8','DigitalOutput');
% configurePin(a,'A9','DigitalOutput');
% configurePin(a,'A10','DigitalOutput');
% configurePin(a,'A11','DigitalOutput');
% for i=1:2
%     NumSpinDown(50,0.002,a);
%     NumSpinUp(50,0.002,a);
%     writeDigitalPin(a,'A8' ,1); % 0001
%     writeDigitalPin(a,'A9' ,0);
%     writeDigitalPin(a,'A10',0);
%     writeDigitalPin(a,'A11',0);
%     pause(x);
%     writeDigitalPin(a,'A8' ,1); % 0011
%     writeDigitalPin(a,'A9' ,1);
%     writeDigitalPin(a,'A10',0);
%     writeDigitalPin(a,'A11',0);
%     pause(x);
%     writeDigitalPin(a,'A8' ,0); % 0010
%     writeDigitalPin(a,'A9' ,1);
%     writeDigitalPin(a,'A10',0);
%     writeDigitalPin(a,'A11',0);
%     pause(x);
%     writeDigitalPin(a,'A8' ,0); % 0110
%     writeDigitalPin(a,'A9' ,1);
%     writeDigitalPin(a,'A10',1);
%     writeDigitalPin(a,'A11',0);
%     pause(x);
%     writeDigitalPin(a,'A8' ,0); % 0100
%     writeDigitalPin(a,'A9' ,0);
%     writeDigitalPin(a,'A10',1);
%     writeDigitalPin(a,'A11',0);
%     pause(x);
%     writeDigitalPin(a,'A8' ,0); % 1100
%     writeDigitalPin(a,'A9' ,0);
%     writeDigitalPin(a,'A10',1);
%     writeDigitalPin(a,'A11',1);
%     pause(x);
%     writeDigitalPin(a,'A8' ,0); % 1000
%     writeDigitalPin(a,'A9' ,0);
%     writeDigitalPin(a,'A10',0);
%     writeDigitalPin(a,'A11',1);
%     pause(x);
%     writeDigitalPin(a,'A8' ,1); % 1001
%     writeDigitalPin(a,'A9' ,0);
%     writeDigitalPin(a,'A10',0);
%     writeDigitalPin(a,'A11',1);
%     pause(x);    
% end