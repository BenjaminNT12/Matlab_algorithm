function saveVideoAsMp4(frames, frameRate, fileName)
% frames: matriz de imágenes a guardar en el video
% frameRate: tasa de cuadros por segundo del video
% fileName: nombre del archivo de video a guardar (sin la extensión)

% Crear objeto VideoWriter
writerObj = VideoWriter([fileName, '.mp4'], 'MPEG-4');

% Establecer la tasa de cuadros por segundo del video
writerObj.FrameRate = frameRate;

% Abrir el objeto VideoWriter para escribir el video
open(writerObj);

% Escribir cada cuadro en el objeto VideoWriter
for i = 1:size(frames, 4)
    writeVideo(writerObj, frames(:,:,:,i));
end

% Cerrar el objeto VideoWriter
close(writerObj);
end