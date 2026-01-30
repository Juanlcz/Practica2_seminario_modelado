clear; clc;
% Simulación Péndulo Invertido
% x_c = 0, x_c_p = 0, alpha = 1 grado, alpha_p = 0

T = [0 10]; % Tiempo de simulación

%Condiciones inciales
alpha0 = 1 * (pi/180); %Convertimos 1 grado a radianes
x0 = [0; 0; alpha0; 0];% [pos. del carro; vel. del carro; angulo del pendulo; vel. angular] 

% Llamar al ODE
[t, x] = ode45(@Pendulo, T, x0);



% Graficar Resultados
figure(1) % Crea o selecciona la ventana 1

subplot(2,2,1) % Fila 1, Columna 1
plot(t, x(:,1))
%significado de (:,1):
%":" es le dice a mat que recorra la simulacion de iicio a fin
% "," separador entre filas y columnas
% "1" dx(1) la posicion del carro, la 1ra columan tiene la posicion

ylabel('Posición Carro (m)'); grid on; title('Estado 1: Xc');

subplot(2,2,2) % Fila 1, Columna 2
plot(t, x(:,2))
ylabel('Velocidad Carro (m/s)'); grid on; title('Estado 2: Xc-punto');

subplot(2,2,3) % Fila 2, Columna 1
plot(t, x(:,3))
ylabel('Ángulo (rad)'); grid on; title('Estado 3: \alpha');

subplot(2,2,4) % Fila 2, Columna 2
plot(t, x(:,4))
ylabel('Velocidad Angular (rad/s)'); grid on; title('Estado 4: \alpha-punto');


figure(2) % Crea una ventana 
plot(t, x) % 'x' sin especificar columna, grafica las 4 de un solo golpe
grid on;
title('Todos los Estados Juntos');
xlabel('Tiempo (s)');
legend('Xc', 'Xc-punto', '\alpha', '\alpha-punto'); 