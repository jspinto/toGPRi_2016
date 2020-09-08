#{
This file is part of toGPRi tools v1.

toGPRi 0.1 is free software: you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of the License, or (at your
option) any later version.

toGPRi 0.1 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
License for more details.

You should have received a copy of the GNU General Public License along with toGPRi 0.1. If not, see
<http://www.gnu.org/licenses/>.

Copyright 2016 Javier Sanjurjo Pinto.
#}

function rf_samples_fine
global r_A r_info r_time r_window_radar r_colormap r_window_radar_axes;
[r_m,r_n]=size(r_A);
r_fh=25;
r_fv=25;
r_fhv=inputdlg([{"Vertical lines: ","Horizontal lines: "}],"Grid",1,[{"25",...
 "25"}]);
if (isempty(r_fhv)~=1&&isempty(r_fhv{1})~=1&&isempty(r_fhv{2})~=1&&str2num(r_fhv{1})>0&&str2num(r_fhv{2})>0&&...
  str2num(r_fhv{1})<=(r_m/2)&&str2num(r_fhv{2})<=(r_n/2)),
  r_fv=str2num(r_fhv{1});
  r_fh=str2num(r_fhv{2});
  delete(r_window_radar);
  rf_draw;
  set(r_window_radar_axes,"ylabel","samples","xlabel","traces",...
   "ytick",(0:round(r_m/r_fh):r_m),"xtick",(0:round(r_n/r_fv):r_n),...
   "yticklabelmode","auto");
  grid minor;
  set(r_window_radar,"visible","on");
  pause(0.05);
endif
return;
endfunction
