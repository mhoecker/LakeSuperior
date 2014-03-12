function [tmat,tunix,wlvl] = waterlvlascii2netcdf(asciifile,ncfile,matfile)
 datmatrix = load('-ascii',asciifile);
 tmat = noaa2matdate(floor(datmatrix(:,1:5)));
 tunix = mat2unixdate(tmat);
 wlvl = datmatrix(:,6);
 if(nargin()==3)
  save('-7',matfile,'tmat','tunix','wlvl');
 end%if
 %write a netCDF maker here!
end%function

function matdate = noaa2matdate(ymdHM)
 Nt = length(ymdHM(:,1));
 matdate = zeros(1,Nt);
 for i=1:Nt
  %y = num2str(ymdHM(i,1),"%04i")
  %m = num2str(ymdHM(i,2),"%02i")
  %d = num2str(ymdHM(i,3),"%02i")
  %H = num2str(ymdHM(i,4),"%02i")
  %M = num2str(ymdHM(i,5),"%02i")
  y = ymdHM(i,1);
  m = ymdHM(i,2);
  d = ymdHM(i,3);
  H = ymdHM(i,4);
  M = ymdHM(i,5);
  matdate(i) = datenum(y,m,d,H,M);
 end%for
end%function
