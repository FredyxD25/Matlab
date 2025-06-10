% En el cmd iniciar las terminales de MATLAB con
% matlab -nodesktop -nosplash
% En la consola fija el directorio con cd. Ej.
% cd('D:\Datos Fredy\Programacion\Matlab\SIMMECHANICS');

% Iniciar servidor
server = tcpserver("0.0.0.0", 2000);
disp("Servidor esperando conexión...");

while true
    
    % Esperar conexión
    try
        while server.NumBytesAvailable < 4
            pause(0.05);
        end
    catch
        clear server
    end

    % Leer tamaño del archivo
    tam_bytes = read(server, 4, 'uint8');
    tam_archivo = typecast(uint8(tam_bytes), 'uint32');
    
    % Leer el archivo de audio
    datos = uint8.empty;
    while numel(datos) < tam_archivo
        if server.NumBytesAvailable > 0
            datos = [datos; read(server, server.NumBytesAvailable, 'uint8')];
        end
        pause(0.05);
    end
    
    % Guardar archivo recibido
    nombre_audio = 'audio_recibido.wav';
    fid = fopen(nombre_audio, 'w');
    fwrite(fid, datos, 'uint8');
    fclose(fid);
    disp("Archivo recibido. Procesando comando...");
    
    nombre_audio = 'audio_recibido.wav';

    % Reconocer comando con MFCC + DTW
    [y_rec, Fs_rec] = audioread(nombre_audio);
    comando = reconocer_comando(nombre_audio);
    
    disp(['Comando detectado: ' comando]);
    try
        switch comando
            case 'Arriba.wav'
                set_param('Ensamblaje1/Z_MOV', 'Value', num2str(0.1));
                
            case 'Abajo.wav'
                set_param('Ensamblaje1/Z_MOV', 'Value', num2str(-0.1));
                
            case 'Adelante.wav'
                set_param('Ensamblaje1/Y_MOV', 'Value', num2str(-0.1));
                
            case 'Atras.wav'
                set_param('Ensamblaje1/Y_MOV', 'Value', num2str(0.1));
                
            case 'Izquierda.wav'
                set_param('Ensamblaje1/X_MOV', 'Value', num2str(-0.2));
                
            case 'Derecha.wav'
                set_param('Ensamblaje1/X_MOV', 'Value', num2str(0));

        end
    catch ME
        % Captura cualquier error que ocurra, por ejemplo, si el modelo no está abierto
        warning(['Error al aplicar el comando a Simulink: ', ME.message]);
        disp('Asegúrate de que el modelo "Ensamblaje1" esté abierto y los bloques existan.');
    end
    
end