client = tcpclient("127.0.0.1", 2000);
disp("Conectado al servidor.");

while true
    %Leer del teclado
    entrada = input("Escriba mensaje ('salir' para terminar): ", 's');
    writeline(client, entrada);
    %Comparar con el texto salir
    if strcmpi(strtrim(entrada), "salir")
        break;
    end
    %Espera a que el cliente responda
    pause(0.1);
    if client.NumBytesAvailable > 0
        respuesta = readline(client);
        disp(respuesta);
    end
end

%Finaliza la conexión
clear client
disp("Conexión cerrada desde el cliente.");