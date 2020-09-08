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

function rf_select_colormap
global r_A r_info r_time r_window_radar r_colormap r_window_radar_axes;
rf_s_select_colormap=colormap("list");
[rf_ssc_m, rf_ssc_n]=size(rf_s_select_colormap);
rf_s_select_colormap{1}="rf_crwb";
r_col=menu("Select a colormap",rf_s_select_colormap);
r_colormap=rf_s_select_colormap{r_col};
delete(r_window_radar);
rf_draw;
set(r_window_radar,"visible","on");
pause(0.05);
endfunction
