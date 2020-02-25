in = input("Enter floating point number: ");
decpart = dec2bin(floor(in));
in = in-floor(in);
n = -1;
floatpart = [];
while in~=0 || in>eps
    if in - 2^n < 0 
        floatpart = [floatpart '0'];
    else
        floatpart = [floatpart '1'];
        in = in - 2^n;
    end
    n = n - 1;
end
bin = [decpart '.' floatpart];
disp(bin)