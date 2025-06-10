function aplicarComandoSimulink()
    comando = 'Derecha' 
    try
        switch comando
            case 'Arriba'
                set_param('Ensamblaje1/Z_MOV', 'Value', num2str(0.1));
                
            case 'Abajo'
                set_param('Ensamblaje1/Z_MOV', 'Value', num2str(-0.1));
                
            case 'Adelante'
                set_param('Ensamblaje1/Y_MOV', 'Value', num2str(-0.1));
                
            case 'Atras'
                set_param('Ensamblaje1/Y_MOV', 'Value', num2str(0.1));
                
            case 'Izquierda'
                set_param('Ensamblaje1/X_MOV', 'Value', num2str(-0.2));
                
            case 'Derecha'
                set_param('Ensamblaje1/X_MOV', 'Value', num2str(0));
                
            case 'Centro'
                set_param('Ensamblaje1/X_MOV', 'Value', num2str(-0.1));
                set_param('Ensamblaje1/Y_MOV', 'Value', num2str(0));
                set_param('Ensamblaje1/Z_MOV', 'Value', num2str(0));
                
            otherwise
                % Opcional: Manejar casos donde el comando no es reconocido
                disp(['Comando "' comando '" no reconocido. No se aplicó ningún movimiento.']);
        end
    catch ME
        % Captura cualquier error que ocurra, por ejemplo, si el modelo no está abierto
        warning(['Error al aplicar el comando a Simulink: ', ME.message]);
        disp('Asegúrate de que el modelo "Ensamblaje1" esté abierto y los bloques existan.');
    end
end