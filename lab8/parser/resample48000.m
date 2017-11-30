function [] = resample8000(filename)
info = audioinfo(filename)
Fs = info.SampleRate;
[p,q] = rat(8000/Fs,0.0001); 
[y fs] = audioread(filename);
out = resample(y,p,q);
[pathstr,name,ext] = fileparts(filename);
audiowrite([name '8000.wav'],out,8000);
end


    