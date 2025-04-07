function interfaz_audio()
    % Cargar el audio
    [audioData, Fs] = audioread('audio.mp3');

    % Crear figura
    fig = uifigure('Name', 'Control de Audio', 'Position', [100 100 450 350]);

    % Datos compartidos
    data.original = audioData;
    data.Fs = Fs;
    data.volumen = 1.0;
    data.panning = 0; % centro
    data.currentAudio = aplicar_efectos(audioData, 1.0, 0);
    data.player = audioplayer(data.currentAudio, Fs);

    % Guardar botón en data para acceso dentro del callback
    data.btnPause = [];

    % Guardar datos en appdata
    setappdata(fig, 'audioData', data);

    % Botón Reproducir
    uibutton(fig, 'Text', 'Reproducir', ...
        'Position', [50 250 100 40], ...
        'ButtonPushedFcn', @(btn, event) reproducir_audio(fig));

    % Botón Pausar / Reanudar
    btnPause = uibutton(fig, 'Text', 'Pausar', ...
        'Position', [170 250 100 40], ...
        'ButtonPushedFcn', @(btn, event) toggle_pause(fig));
    data.btnPause = btnPause;

    % Actualizar data con el botón
    setappdata(fig, 'audioData', data);

    % Botón Terminar
    uibutton(fig, 'Text', 'Terminar', ...
        'Position', [290 250 100 40], ...
        'ButtonPushedFcn', @(btn,event) stop_audio(fig));

    % Slider de Volumen
    uilabel(fig, 'Text', 'Volumen:', 'Position', [50 190 60 22]);
    uislider(fig, ...
        'Position', [120 200 280 3], ...
        'Limits', [0 1.5], ...
        'Value', 1.0, ...
        'ValueChangedFcn', @(sld,event) ajustar_volumen(fig, sld));

    % Slider de Panning
    uilabel(fig, 'Text', 'Panning:', 'Position', [50 130 60 22]);
    uislider(fig, ...
        'Position', [120 140 280 3], ...
        'Limits', [-1 1], ...
        'MajorTicks', [-1 0 1], ...
        'MajorTickLabels', {'Izq','Centro','Der'}, ...
        'Value', 0, ...
        'ValueChangedFcn', @(sld,event) ajustar_panning(fig, sld));
end

function reproducir_audio(fig)
    data = getappdata(fig, 'audioData');
    play(data.player);
end

function toggle_pause(fig)
    data = getappdata(fig, 'audioData');
    if isplaying(data.player)
        pause(data.player);
        data.btnPause.Text = 'Reanudar';
    else
        resume(data.player);
        data.btnPause.Text = 'Pausar';
    end
    setappdata(fig, 'audioData', data);
end

function stop_audio(fig)
    data = getappdata(fig, 'audioData');
    stop(data.player);
    data.btnPause.Text = 'Pausar';
    setappdata(fig, 'audioData', data);
end

function ajustar_volumen(fig, slider)
    data = getappdata(fig, 'audioData');
    data.volumen = slider.Value;
    pos = get(data.player, 'CurrentSample');
    if isplaying(data.player)
        stop(data.player);
    end
    data.currentAudio = aplicar_efectos(data.original, data.volumen, data.panning);
    data.player = audioplayer(data.currentAudio, data.Fs);
    setappdata(fig, 'audioData', data);
    play(data.player, [pos size(data.currentAudio,1)]);
end

function ajustar_panning(fig, slider)
    data = getappdata(fig, 'audioData');
    data.panning = slider.Value;
    pos = get(data.player, 'CurrentSample');
    if isplaying(data.player)
        stop(data.player);
    end
    data.currentAudio = aplicar_efectos(data.original, data.volumen, data.panning);
    data.player = audioplayer(data.currentAudio, data.Fs);
    setappdata(fig, 'audioData', data);
    play(data.player, [pos size(data.currentAudio,1)]);
end

function audioMod = aplicar_efectos(audio, volumen, panning)
    y = audio * volumen;
    if size(y,2) == 1
        y = [y, y]; % convertir a estéreo
    end
    izquierda = 0.5 * (1 - panning);
    derecha   = 0.5 * (1 + panning);
    y(:,1) = y(:,1) * izquierda * 2;
    y(:,2) = y(:,2) * derecha * 2;
    audioMod = y;
end
