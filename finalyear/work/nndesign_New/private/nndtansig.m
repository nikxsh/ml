function a = nndtansig(n)
a = 2 ./ (1 + exp(-2*n)) - 1;
i = find(~isfinite(a));
a(i) = sign(n(i));
