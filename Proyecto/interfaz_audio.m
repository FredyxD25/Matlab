function interfaz_audio()
    % Cargar el audio desde archivo
    [audioData, Fs] = audioread('audio.mp3');

    % Crear la ventana principal de la interfaz
    fig = uifigure('Name', 'Control de Audio', 'Position', [100 100 450 350]);

    % Inicializar estructura para guardar todos los datos necesarios
    data.original = audioData;     % Audio original
    data.Fs = Fs;                  % Frecuencia de muestreo
    data.volumen = 1.0;           % Volumen inicial
    data.panning = 0;             % Panning inicial (0 = centro)
    data.currentAudio = aplicar_efectos(audioData, 1.0, 0); % Aplicar efectos iniciales
    data.player = audioplayer(data.currentAudio, Fs);      % Crear el reproductor de audio

    % Inicializar el botón de pausa como vacío, se define luego
    data.btnPause = [];

    % Guardar la estructura 'data' como appdata asociada a la figura
    setappdata(fig, 'audioData', data);

    % Crear botón Reproducir
    uibutton(fig, 'Text', 'Reproducir', ...
        'Position', [50 250 100 40], ...
        'ButtonPushedFcn', @(btn, event) reproducir_audio(fig));

    % Crear botón Pausar / Reanudar
    btnPause = uibutton(fig, 'Text', 'Pausar', ...
        'Position', [170 250 100 40], ...
        'ButtonPushedFcn', @(btn, event) toggle_pause(fig));
    data.btnPause = btnPause; % Guardar referencia al botón

    % Volver a guardar 'data' actualizado con el botón de pausa
    setappdata(fig, 'audioData', data);

    % Crear botón Terminar (detener audio)
    uibutton(fig, 'Text', 'Terminar', ...
        'Position', [290 250 100 40], ...
        'ButtonPushedFcn', @(btn,event) stop_audio(fig));

    % Crear etiqueta y slider de volumen
    uilabel(fig, 'Text', 'Volumen:', 'Position', [50 190 60 22]);
    uislider(fig, ...
        'Position', [120 200 280 3], ...
        'Limits', [0 1.5], ...
        'Value', 1.0, ...
        'ValueChangedFcn', @(sld,event) ajustar_volumen(fig, sld));

    % Crear etiqueta y slider de panning
    uilabel(fig, 'Text', 'Panning:', 'Position', [50 130 60 22]);
    uislider(fig, ...
        'Position', [120 140 280 3], ...
        'Limits', [-1 1], ...
        'MajorTicks', [-1 0 1], ...
        'MajorTickLabels', {'Izq','Centro','Der'}, ...
        'Value', 0, ...
        'ValueChangedFcn', @(sld,event) ajustar_panning(fig, sld));
end

% Función para reproducir el audio actual
function reproducir_audio(fig)
    data = getappdata(fig, 'audioData');
    play(data.player);
end

% Función para pausar o reanudar el audio
function toggle_pause(fig)
    data = getappdata(fig, 'audioData');
    if isplaying(data.player)
        pause(data.player);              % Si está sonando, pausa
        data.btnPause.Text = 'Reanudar'; % Cambiar texto del botón
    else
        resume(data.player);            % Si está pausado, reanuda
        data.btnPause.Text = 'Pausar';  % Cambiar texto del botón
    end
    setappdata(fig, 'audioData', data); % Actualizar datos
end

% Función para detener completamente el audio
function stop_audio(fig)
    data = getappdata(fig, 'audioData');
    stop(data.player);                  % Detiene el reproductor
    data.btnPause.Text = 'Pausar';      % Reinicia texto del botón
    setappdata(fig, 'audioData', data); % Actualizar datos
end

% Función que ajusta el volumen y reinicia reproducción desde posición actual
function ajustar_volumen(fig, slider)
    data = getappdata(fig, 'audioData');
    data.volumen = slider.Value;                   % Nuevo valor de volumen
    pos = get(data.player, 'CurrentSample');       % Posición actual del audio
    if isplaying(data.player)
        stop(data.player);                         % Detener reproducción previa
    end
    data.currentAudio = aplicar_efectos(data.original, data.volumen, data.panning);
    data.player = audioplayer(data.currentAudio, data.Fs); % Nuevo reproductor
    setappdata(fig, 'audioData', data);            % Actualizar datos
    play(data.player, [pos size(data.currentAudio,1)]); % Reproducir desde donde iba
end

% Función que ajusta el panning (izquierda-derecha) del audio
function ajustar_panning(fig, slider)
    data = getappdata(fig, 'audioData');
    data.panning = slider.Value;                   % Nuevo valor de panning
    pos = get(data.player, 'CurrentSample');       % Posición actual
    if isplaying(data.player)
        stop(data.player);                         % Detener antes de aplicar cambios
    end
    data.currentAudio = aplicar_efectos(data.original, data.volumen, data.panning);
    data.player = audioplayer(data.currentAudio, data.Fs); % Nuevo reproductor
    setappdata(fig, 'audioData', data);            % Guardar cambios
    play(data.player, [pos size(data.currentAudio,1)]); % Reanudar desde la posición
end

% Función que aplica el volumen y panning al audio original
function audioMod = aplicar_efectos(audio, volumen, panning)
    y = audio * volumen;       % Escalar audio por volumen
    if size(y,2) == 1
        y = [y, y];            % Convertir a estéreo si es mono
    end
    % Calcular factor para cada canal
    izquierda = 0.5 * (1 - panning);   % panning -1 → más a la izquierda
    derecha   = 0.5 * (1 + panning);   % panning  1 → más a la derecha
    y(:,1) = y(:,1) * izquierda * 2;   % Canal izquierdo
    y(:,2) = y(:,2) * derecha * 2;     % Canal derecho
    audioMod = y;                      % Audio modificado
end