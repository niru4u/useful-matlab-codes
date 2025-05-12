function create_nc_3d(data,time,lon1,lat1,outfile)

% system(sprintf('rm %s',outfile));
% Creating NETCDF FILES
fillvalue = -999.0;
if isfile('tmp.nc'), delete(sprintf('%s','tmp.nc'));end

nccreate('tmp.nc','lat','Dimensions',{'lat' length(lat1)},'Format','netcdf4','FillValue',fillvalue);
ncwriteatt('tmp.nc', 'lat', 'standard_name', 'latitude');
ncwriteatt('tmp.nc', 'lat', 'long_name', 'latitude');
ncwriteatt('tmp.nc', 'lat', 'units', 'degrees north');
ncwriteatt('tmp.nc', 'lat', '_CoordinateAxisType', 'Lat');

nccreate('tmp.nc','lon','Dimensions',{'lon' length(lon1)},'Format','netcdf4','FillValue',fillvalue);
ncwriteatt('tmp.nc', 'lon', 'standard_name', 'longitude');
ncwriteatt('tmp.nc', 'lon', 'long_name', 'longitude');
ncwriteatt('tmp.nc', 'lon', 'units', 'degrees north');
ncwriteatt('tmp.nc', 'lon', '_CoordinateAxisType', 'Lon');

nccreate('tmp.nc','time','Dimensions',{'time' length(time)},'Format','netcdf4','FillValue',fillvalue);
ncwriteatt('tmp.nc', 'time', 'long_name', 'Time variable');
ncwriteatt('tmp.nc', 'time', 'units', sprintf('days since %s',datestr(time(1,1),31)));
ncwriteatt('tmp.nc', 'time', '_CoordinateAxisType', 'Time');

nccreate('tmp.nc','data','datatype','single','Dimensions',{'lon' length(lon1) ...
    'lat' length(lat1) 'time' length(time)},'Format','netcdf4','FillValue',fillvalue);
ncwriteatt('tmp.nc', 'data', 'standard_name', 'Zonal Wind');
ncwriteatt('tmp.nc', 'data', 'long_name', 'Zonal Wind');
ncwriteatt('tmp.nc', 'data', 'units', 'ms^-^1');

if length(time)>1
    del_time=diff(time);
    dys = (0:length(time)-1)*del_time(1,1);
else
    dys = (0:length(time)-1);
end

ncwrite('tmp.nc','lat',lat1);
ncwrite('tmp.nc','lon',lon1);
ncwrite('tmp.nc','time',dys);
ncwrite('tmp.nc','data',data);
new_file = outfile;
system(sprintf('cdo -f nc copy %s %s','tmp.nc',new_file));
system(sprintf('rm %s','tmp.nc'));

end