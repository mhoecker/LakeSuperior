function unixdate = mat2unixdate(matdate)
 matofunix0 = datenum(1970,1,1);
 unixpermat = 24*3600;
 unixdate = (matdate.-matofunix0).*unixpermat;
end%function
