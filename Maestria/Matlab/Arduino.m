puerto=serial('COM5')
puerto.BaudRate=9600
fopen(puerto);
while(1){
    v = fscanf(puerto,'%d');
    plot(v);
end