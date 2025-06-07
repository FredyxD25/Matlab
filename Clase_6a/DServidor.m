server = tcpserver("0.0.0.0", 2000);
disp("Servidor esperando conexión...");

% Leer los 4 bytes iniciales (tamaño del archivo)
while server.NumBytesAvailable < 4
    pause(0.05);
end
tam_bytes = read(server, 4, 'uint8');
tam_archivo = typecast(uint8(tam_bytes), 'uint32');

% Leer el archivo
datos = uint8.empty;
while numel(datos) < tam_archivo
    if server.NumBytesAvailable > 0
        datos = [datos; read(server, server.NumBytesAvailable, 'uint8')];
    end
    pause(0.05);
end

% Guardar archivo
nombre = 'audio_recibido.wav';
fid = fopen(nombre, 'w');
fwrite(fid, datos, 'uint8');
fclose(fid);
disp("Archivo recibido.");

% Reconocer comando con MFCC + DTW
[y, Fs] = audioread(nombre);
comando = reconocer_comando(nombre);
disp("Comando reconocido: " + upper(comando));
clear server

