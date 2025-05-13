% Dentro del bloque "Interpreted MATLAB Function"
function u = func(x)
    persistent data_to_send;
    if isempty(data_to_send)
        data_to_send = [];
    end
    % 'x' es la entrada al bloque
    data_to_send = [data_to_send; x]; % Acumula los datos
    assignin('base', 'simulink_data', data_to_send); % Asigna al workspace base
    % Alternativamente, para escribir a un archivo:
    % save('datos_simulink.mat', 'x');
    u = x; % La salida del bloque (si la necesitas)
end