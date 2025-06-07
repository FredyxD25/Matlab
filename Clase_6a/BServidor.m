%Este servidor solo admite una conexión activa por puerto
server = tcpserver("0.0.0.0", 2000);
disp("Servidor esperando mensajes...");

while true
    if server.NumBytesAvailable > 0
        msg = readline(server);
        disp("Cliente dice: " + msg);
        %Espera mensaje del cliente
        if strcmpi(strtrim(msg), "salir")
            writeline(server, "Conexión finalizada por el cliente.");
            disp("Fin de conexión.");
            break;
        else
            %pone el mensaje enviado en mayuscula
            respuesta = upper(msg);
            writeline(server, "Servidor responde: " + respuesta);
        end
    end
    pause(0.1);
end

clear server;