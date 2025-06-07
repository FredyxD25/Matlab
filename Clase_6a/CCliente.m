% Grabar 3 segundos de audio
% 44.1kHz, 16-bit, mono
recObj = audiorecorder(44100, 16, 1);
disp('Grabando 3 segundos...');
recordblocking(recObj, 3);

filename = 'audio_cliente.wav';
audiowrite(filename, getaudiodata(recObj), 44100);

% Leer archivo y tamaño
fileID = fopen(filename, 'r');
audioBytes = fread(fileID, '*uint8');
fclose(fileID);
tam = uint32(length(audioBytes));

% Conectarse y enviar
client = tcpclient("127.0.0.1", 2000);
write(client, typecast(tam, 'uint8'));  % Enviar tamaño
write(client, audioBytes);              % Enviar contenido

clear client
disp("Archivo enviado.");