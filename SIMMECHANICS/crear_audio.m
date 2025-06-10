% Configuración común para todos los archivos
Fs = 44100;       % Frecuencia de muestreo (44.1 kHz)
nBits = 16;        % Resolución (16 bits)
canales = 1;       % Mono
duracion = 10;      % Duración de cada grabación en segundos (2 segundos)

% Lista de comandos a grabar
comandos = {
    'comando_arriba.wav', ... 
    'comando_abajo.wav', ...
    'comando_izquierda.wav',... 
    'comando_derecha.wav', ...
    'comando_adelante.wav', ...
    'comando_atras.wav', ...
    'comando_centro.wav'
};

% Nombres mostrados al usuario
nombres_comandos = {
    'ARRIBA', ...
    'ABAJO', ...
    'IZQUIERDA', ...
    'DERECHA', ...
    'ADELANTE', ...
    'ATRÁS', ...
    'CENTRO'
};

disp('=== GRABADOR DE COMANDOS DE VOZ ===');
disp('Vas a grabar los 6 comandos necesarios para el sistema.');
disp('Asegúrate de tener un micrófono conectado y listo.');
disp('Habla claramente cuando se indique.');
disp('-----------------------------------');

for i = 1:length(comandos)
    % Crear objeto para grabación
    recorder = audiorecorder(Fs, nBits, canales);
    
    % Mensaje para el usuario
    fprintf('\nPreparado para grabar el comando: %s\n', nombres_comandos{i});
    disp('Presiona cualquier tecla para comenzar a grabar...');
    pause;
    
    % Grabar audio
    disp(['Grabando durante ' num2str(duracion) ' segundos...']);
    recordblocking(recorder, duracion);
    disp('Grabación completada.');
    %{
    % Reproducir lo grabado para verificación
    disp('Reproduciendo lo grabado...');
    play(recorder);
    pause(duracion + 0.5); % Esperar a que termine la reproducción
    %}
    % Preguntar si aceptar la grabación
    opcion = input('¿La grabación es buena? (s/n): ', 's');
    
    while lower(opcion) ~= 's'
        disp('Vamos a intentarlo de nuevo...');
        fprintf('\nPreparado para grabar el comando: %s\n', nombres_comandos{i});
        disp('Presiona cualquier tecla para comenzar a grabar...');
        pause;
        
        disp(['Grabando durante ' num2str(duracion) ' segundos...']);
        recordblocking(recorder, duracion);
        disp('Grabación completada.');
        
        disp('Reproduciendo lo grabado...');
        play(recorder);
        pause(duracion + 0.5);
        
        opcion = input('¿La grabación es buena? (s/ n): ', 's');
    end
    
    % Obtener los datos de audio
    audioData = getaudiodata(recorder);
    
    % Guardar el archivo WAV
    audiowrite(comandos{i}, audioData, Fs);
    disp(['Archivo guardado como: ' comandos{i}]);
    disp('-----------------------------------');
end

disp('¡Todos los comandos han sido grabados y guardados!');
disp('Archivos creados:');
disp(comandos');