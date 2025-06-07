% Grabar audio
recObj = audiorecorder(44100, 16, 1);
disp('Grabando comando (3 segundos)...');
recordblocking(recObj, 3);

% Guardar como .wav
nombreArchivo = 'comando.wav';
audiowrite(nombreArchivo, getaudiodata(recObj), 44100);
disp("Audio guardado como '" + nombreArchivo + "'");

% Leer bytes del archivo
fid = fopen(nombreArchivo, 'r');
audioBytes = fread(fid, '*uint8');
fclose(fid);
tam = uint32(length(audioBytes));

% Enviar al servidor
client = tcpclient("127.0.0.1", 2000);
write(client, typecast(tam, 'uint8'));  % Tamaño (4 bytes)
write(client, audioBytes);              % Contenido del .wav
disp("Audio enviado correctamente.");
clear client