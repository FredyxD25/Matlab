% En el cmd iniciar las terminales de MATLAB con
% matlab -nodesktop -nosplash
% En la consola fija el directorio con cd. Ej.
% cd('D:\Datos Fredy\Programacion\Matlab\SIMMECHANICS');

% Configuración de grabación
Fs = 44100; % Frecuencia de muestreo
nBits = 16;  % Resolución
canales = 1; % Mono

while true
    % Menú de comandos disponibles
    disp('Comandos disponibles:');
    disp('1. Arriba');
    disp('2. Abajo');
    disp('3. Izquierda');
    disp('4. Derecha');
    disp('5. Adelante');
    disp('6. Atrás');
    disp('Presione cualquier tecla y luego Enter para grabar...');
    
    input('', 's'); % Esperar entrada del usuario
    
    % Grabar 4 segundos de audio
    recObj = audiorecorder(Fs, nBits, canales);
    disp('Grabando... (4 segundos)');
    recordblocking(recObj, 4);
    disp('Grabación completada.');
    
    % Guardar archivo temporal
    filename = 'audio_cliente.wav';
    audiowrite(filename, getaudiodata(recObj), Fs);
    
    % Leer y enviar archivo
    fileID = fopen(filename, 'r');
    audioBytes = fread(fileID, '*uint8');
    fclose(fileID);
    tam = uint32(length(audioBytes));
    
    % Conectar y enviar
    client = tcpclient("127.0.0.1", 2000);
    write(client, typecast(tam, 'uint8'));  % Tamaño
    write(client, audioBytes);              % Contenido
    
    clear client
    disp("Comando enviado al servidor.");
end
