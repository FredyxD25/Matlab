% En el cmd iniciar las terminales de MATLAB con
% matlab -nodesktop -nosplash
% En la consola fija el directorio con cd. Ej.
% cd('D:\Datos Fredy\Programacion\Matlab\Clase_6a');
% Cliente TCP - se conecta al servidor
% IP local del servidor
client = tcpclient("127.0.0.1", 2000); 
mensaje = "Hola mundo";
writeline(client, mensaje);
clear client
