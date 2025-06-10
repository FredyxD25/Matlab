function comando = reconocer_comando(audio_recibido)
    carpeta = 'comandos/';
    archivos = dir(fullfile(carpeta, '*.wav'));

    if isempty(archivos)
        error('No se encontraron archivos .wav en la carpeta comandos/');
    end

    mfcc_test = extraer_mfcc(audio_recibido);
    menor_distancia = inf;
    comando = 'no reconocido';
    %Ajustar
    umbral = 1200; 

    for i = 1:length(archivos)
        archivo_base = fullfile(carpeta, archivos(i).name);
        mfcc_base = extraer_mfcc(archivo_base);
        % Calcula la distancia de alineación dinámica (DTW) 
        % entre dos secuencias de características MFCC
        dist = dtw(mfcc_test', mfcc_base');

        fprintf("Distancia a '%s': %.2f\n", archivos(i).name, dist);

        if dist < menor_distancia
            menor_distancia = dist;
            mejor_archivo = archivos(i).name;
        end
    end

    if menor_distancia < umbral
        comando = mejor_archivo;
    end
end

