t=linspace(0,2,44100);
sol=sin(2*pi*392*t);
si=sin(2*pi*493.88*t);
la=sin(2*pi*440*t);
soundsc(la,8000);
findnote(sol)
findnote(si)
findnote(la)