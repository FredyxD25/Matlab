
function robotic_arm_client()
    % Configuración de grabación
    Fs = 44100; % Frecuencia de muestreo
    nBits = 16;  % Resolución
    canales = 1; % Mono
    
    % Menú de comandos disponibles
    disp('Comandos disponibles:');
    disp('1. Arriba');
    disp('2. Abajo');
    disp('3. Izquierda');
    disp('4. Derecha');
    disp('5. Adelante');
    disp('6. Atrás');
    disp('Presione cualquier tecla y luego Enter para grabar...');
    
    while true
        input('', 's'); % Esperar entrada del usuario
        
        % Grabar 3 segundos de audio
        recObj = audiorecorder(Fs, nBits, canales);
        disp('Grabando... (3 segundos)');
        recordblocking(recObj, 3);
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
end