URL='https://cad.onshape.com/documents/356b4257f3b7c8a3608bb72e/w/3c4966532a9961155f24c200/e/b0a5fd3aef46958d70e87bf6';
Ruta='D:\Datos Fredy\Programacion\Matlab\SIMMECHANICS\Ensamblaje';
XML=smexportonshape(URL, 'FolderPath', Ruta);
Nombrearchivo=strcat(Ruta,'\',XML);
smimport(Nombrearchivo);