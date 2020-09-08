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

function rf_select_contrast
global r_A r_info r_time r_window_radar r_s_contrast r_window_radar_axes;
r_select_contrast={"4","8","16","32","64","128","256","512","1024","2048"};
r_con=menu("Select contrast:",r_select_contrast);
r_s_contrast=strcat("(",r_select_contrast{r_con},")");
delete(r_window_radar);
rf_draw;
set(r_window_radar,"visible","on");
pause(0.05);
return;
endfunction
