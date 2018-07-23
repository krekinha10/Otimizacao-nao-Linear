function [StepCorrection NFC IterSC] = StepCorrection(Iter,x,delta,s,Epsi,f)
k = 0;
Size = length(x);
H = eye(Size);
[G IterG1] = Gradiente(f,x,delta);
IterGT = IterG1;
IterLST = 0;
while (K<Iter) && (norm(G)> delta)
    dk = -H*G;
    [alpha IterLS] = LinearSearch(x,G,s,Epsi,f);
    x = x';
    xk = x + alpha*dk;
    [Gk IterG2] = Gradiente(f,xk',delta);
    Vk = xk - x;
    Rk = Gk - G;
    G = Gk;
    x =  xk';
    H = H + (((Vk-H*Rk)*(Vk-H*Rk)')/(Rk'*Vk - Rk'*H*Rk));
    k = k+1;
    IterGT = IterGT + IterG2;
    IterLST = IterLST + IterLS;
    fprintf('|NFC = %6.0f %6.0f |\t',K);
    fprintf('Point = %6.7f %6.7f |\t',x);
    fprintf('\n');
end
StepCorrection = x;
NFC = (IterGT + IterLST);
IterSC = k;


