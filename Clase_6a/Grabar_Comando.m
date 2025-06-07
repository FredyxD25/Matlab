function Grabar_Comando(nombreComando)

    if nargin < 1
        nombreComando = input('Escriba un comando (ej: hola): ', 's');
    end

    fs = 44100;            % Frecuencia de muestreo
    duracion = 3;          % Duración en segundos
    canal = 1;             % Mono
    bits = 16;             % Resolución

    recObj = audiorecorder(fs, bits, canal);
    disp("Prepare el lugar de la grabación");
    pause(1);
    disp("Grabando...");
    recordblocking(recObj, duracion);
    disp("Grabación finalizada.");

    % Guardar archivo
    y = getaudiodata(recObj);
    carpeta = "comandos";
    if ~exist(carpeta, 'dir')
        mkdir(carpeta);
    end
    archivo = fullfile(carpeta, nombreComando + ".wav");
    audiowrite(archivo, y, fs);
    disp("Archivo guardado como: " + archivo);
end
