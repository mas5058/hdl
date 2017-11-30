fid=fopen('MyFile.txt','w');
data = audioread('knightni.wav');
data = data(:,1);
data = data * 1000
data = round(data);
for i = 1:16383
    fprintf(fid,'%i : %i2;\n', i,data(i));
    i
end