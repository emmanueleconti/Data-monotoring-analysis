function nota = findnote(x)
lista_freq = [16.35,17.32,18.35,19.45,20.6,21.83,23.12,24.5,25.96,27.5,29.14,30.87];
lista_note = {'DO','DO#','RE','RE#','MI','FA','FA#','SOL','SOL#','LA','LA#','SI'};
trasformata = fft(x,44100);
modulo = abs(trasformata);
plot(modulo)
[picco,frequenza] = max(modulo);
frequenza = frequenza - 1;
while frequenza >= 31.785
    frequenza = frequenza/2;
end
diff = lista_freq - frequenza;
diff = abs(diff);
[val,pos] = min(diff);
posnota = lista_note(pos);
nota = char(posnota);
end