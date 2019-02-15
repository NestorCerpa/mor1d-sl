function [Wh,fh,fch] = get_other_ffields(phib,cb,phih,ch,par)

    Q = par.Q;
    n = par.n;

    %----------% Fluctuating Solid velocity %----------%
    %   \hat{W} = \cal{Q} (\bar{[phi}^n \hat{\phi} - n \hat{\phi}\bar{\phi}^(n-1)*(1-\bar{\phi}))
    %
    Wh = Q * (phib.^n .* phih - n * phih .* phib.^(n-1) .* (1-phib));
    
    %----------% Fluctuating melt flux %----------% 
    Wb = 1 - Q .* (phib.^n.*(1-phib)); % \bar{W}
    fh = phib.*phih + Wb .* phih;

    %----------% Fluctuating chemical flux %----------% 
    fb = 1 - (1-phib).*Wb;
    fch = cb.*fh + fb.*ch;
    
end