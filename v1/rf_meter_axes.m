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

function rf_meter_axes 
global r_A r_info r_time r_window_radar r_colormap r_window_radar_axes r_h r_v r_rfma;
r_rfma=1;
r_string_h=num2str(r_h);
r_string_v=num2str(r_v);
r_vh=inputdlg([{"Average velocity (cm/ns): "}],"Velocity",1,[{r_string_v}]);
if (isempty(r_vh)~=1&&str2num(r_vh{1})>0),
  r_v=str2num(r_vh{1});
  r_h=str2num(r_info{11})*100;
  [r_m,r_n]=size(r_A);
  ##Velocity divided by 2 (local)
  r_vl=r_v/2
  ##Deleting.
  delete(r_window_radar);
  ##Drawing again.
  rf_draw;
  ##Drawing the axes again.
  set(r_window_radar_axes,"xlabel","meters","xtick",[0,r_n*0.2,r_n*0.4,...
  r_n*0.6,r_n*0.8,r_n],"xticklabel",{"0";...
  num2str(r_n*0.002*r_h,"%.2f");...
  num2str(r_n*0.004*r_h,"%.2f");...
  num2str(r_n*0.006*r_h,"%.2f");...
  num2str(r_n*0.008*r_h,"%.2f");...
  num2str(r_n*0.01*r_h,"%.2f")},"ylabel","meters","ytick",[0,r_m*0.2,r_m*0.4,...
  r_m*0.6,r_m*0.8,r_m],"yticklabel",{"0";...
  num2str(r_time*r_m*0.002*r_vl,"%.2f");...
  num2str(r_time*r_m*0.004*r_vl,"%.2f");...
  num2str(r_time*r_m*0.006*r_vl,"%.2f");...
  num2str(r_time*r_m*0.008*r_vl,"%.2f");...
  num2str(r_time*r_m*0.01*r_vl,"%.2f")});
  pause(0.05);
endif
return;
endfunction
