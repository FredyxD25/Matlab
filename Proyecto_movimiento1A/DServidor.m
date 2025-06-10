function robotic_arm_server()
    % Comandos de referencia y sus acciones correspondientes
    comandos = {'Arriba', 'Abajo', 'Izquierda', 'Derecha', 'Adelante', 'Atras'};
    archivos_referencia = {
        'comando_arriba.wav', 
        'comando_abajo.wav', 
        'comando_izquierda.wav', 
        'comando_derecha.wav', 
        'comando_adelante.wav', 
        'comando_atras.wav'
    };
    
    % Valores de control para Simulink (ángulos o posiciones)
    valores_simulink = [90, -90, -45, 45, 45, -45]; % Valores correspondientes a cada comando
    
    % Iniciar servidor
    server = tcpserver("0.0.0.0", 2000);
    disp("Servidor esperando conexión...");
    
    while true
        % Esperar conexión
        while server.NumBytesAvailable < 4
            pause(0.05);
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
        nombre = 'audio_recibido.wav';
        fid = fopen(nombre, 'w');
        fwrite(fid, datos, 'uint8');
        fclose(fid);
        disp("Archivo recibido. Procesando comando...");

        % Procesar audio y detectar comando
        comando_detectado = procesar_audio(nombre, archivos_referencia, comandos);
        disp(["comando", comando_detectado]);
        
        if ~isempty(comando_detectado)
            % Encontrar índice del comando
            idx = find(strcmp(comandos, comando_detectado));
            
            if ~isempty(idx)
                % Obtener valor correspondiente para Simulink
                valor = valores_simulink(idx);
                
                % Enviar comando a Simulink
                %enviar_a_simulink(comando_detectado, valor);
            end
        end
    end
    
    clear server
end

function comando = procesar_audio(nombre_audio, archivos_ref, comandos)
    % Cargar audio recibido
    [y_rec, Fs_rec] = audioread(nombre_audio);
    
    % Comparar con cada comando de referencia
    mejor_coincidencia = 0;
    mejor_indice = 0;
    umbral = 0.01; % Umbral de similitud
    
    for i = 1:length(archivos_ref)
        [y_ref, Fs_ref] = audioread(archivos_ref{i});
        
        if Fs_ref ~= Fs_rec
            y_ref = resample(y_ref, Fs_rec, Fs_ref);
        end
        
        len_ref = length(y_ref);
        len_rec = length(y_rec);
        
        if len_ref > len_rec
            y_rec = [y_rec; zeros(len_ref - len_rec, 1)];
        elseif len_rec > len_ref
            y_ref = [y_ref; zeros(len_rec - len_ref, 1)];
        end
        
        correlacion = xcorr(y_rec, y_ref);
        max_corr = max(correlacion);
        norm_corr = max_corr / sqrt(sum(y_rec.^2) * sum(y_ref.^2));
        
        if norm_corr > mejor_coincidencia
            mejor_coincidencia = norm_corr;
            mejor_indice = i;
        end
    end
    
    if mejor_coincidencia > umbral
        comando = comandos{mejor_indice};
        disp(['Comando detectado: ' comando]);
        switch comando
            case 'Arriba'
                set_param('Assembly1/Articulacion1', 'Value', num2str(90));
                set_param('Assembly1/Articulacion2', 'Value', num2str(30));
                set_param('Assembly1/Articulacion3', 'Value', num2str(-30));
            case 'Abajo'
                set_param('Assembly1/Articulacion1', 'Value', num2str(135));
                set_param('Assembly1/Articulacion2', 'Value', num2str(30));
                set_param('Assembly1/Articulacion3', 'Value', num2str(60));
            case 'Adelante'
                set_param('Assembly1/Articulacion3', 'Value', num2str(0));
            case 'Atras'
                set_param('Assembly1/Articulacion3', 'Value', num2str(0));
            case 'Izquierda'
                set_param('Assembly1/Articulacion2', 'Value', num2str(90));
                
            case 'Derecha'
                set_param('Assembly1/Articulacion2', 'Value', num2str(-90));
                
            
        end
    else
        comando = '';
        disp('Comando no reconocido');
    end
end

