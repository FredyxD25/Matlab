function mfccs = extraer_mfcc(archivo)
    [y, Fs] = audioread(archivo);
    % Crear una ventana de Hamming de 25 milisegundos
    win = hamming(round(0.025*Fs), 'periodic');  
    % hamming: genera una ventana suavizada para minimizar discontinuidades entre marcos

    % Calcular el salto entre ventanas (hop size) de 10 milisegundos
    hop = round(0.010*Fs);  

    % Calcular los coeficientes cepstrales en frecuencias de Mel (MFCC)
    mfccs = mfcc(y, Fs, ...
        'Window', win, ...                          % Aplica la ventana de Hamming a cada marco
        'OverlapLength', round(length(win)-hop), ...% Define la superposición entre marcos
        'NumCoeffs', 13, ...                        % Número de coeficientes a extraer por marco
        'LogEnergy', 'Ignore');                      
end

