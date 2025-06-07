% Servidor TCP - espera conexión del cliente
% La ip 0.0.0.0 escucha todas las interfaces locales
server = tcpserver("0.0.0.0", 2000, 'ConnectionChangedFcn', @(src,~)disp("Cliente conectado."));
disp("Esperando conexión en el puerto 2000...");
%Esperar mientras llega un dato del cliente
while true
    if server.NumBytesAvailable > 0
        data = readline(server);
        disp("Mensaje recibido: " + data);
        break
    end
    pause(0.1);
end

%Cerrar la conexión
clear server
