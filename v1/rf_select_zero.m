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

function rf_select_zero
global r_A r_info r_time r_window_radar r_colormap x_zero;
[r_m,r_n]=size(r_A);
r_first_arrival=inputdlg([{"Sample of first arrival: "}],"First sample",1,[{"0"}]);
if (isempty(r_first_arrival)~=1&&str2num(r_first_arrival{1})>0&&str2num(r_first_arrival{1})<=r_m),
  r_first_arrival=str2num(r_first_arrival{1});
  if(r_first_arrival>=1&r_first_arrival<=r_m),
    #We have modified the size of the matrix, so we draw r_window_radar again.
    ##Recalculating
    r_A(1:r_first_arrival,:)=[];
    r_time=r_time*(r_m/str2num(r_info{1}));
    #Displacing the matrix to cero.
    r_A=r_A-round(mean(mean(r_A)));
    delete(r_window_radar);
    rf_draw;
    set(r_window_radar,"visible","on");
    pause(0.05);
    #Var for config file
    x_zero=x_zero+r_first_arrival-1;
  else,
   warndlg("Invalid value.");
  endif
endif
return;
endfunction
