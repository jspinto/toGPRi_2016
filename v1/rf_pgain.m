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

function rf_pgain
global r_A r_window_radar r_info r_window_radar_axes r_colormap r_time r_screen;
[r_m,r_n]=size(r_A);
r_select_pgain=inputdlg({"Sample: ","Linear factor: ","Exponential factor: "},"Gain recovery",1,{"1","0","0"});
if (isempty(r_select_pgain)~=1&&isempty(r_select_pgain{1})~=1&&isempty(r_select_pgain{2})~=1&&...
  isempty(r_select_pgain{3})~=1&&str2num(r_select_pgain{1})>0&&str2num(r_select_pgain{1})<=r_m),
  r_sample_pgain=str2num(r_select_pgain{1});
  r_lgain=str2num(r_select_pgain{2});
  r_egain=str2num(r_select_pgain{3});
  #Progressive gain.
  r_wbf=waitbar(0.2,"Processing!\n","windowstyle","modal","name","toGPRi","numbertitle","off","color",[0.85,0.85,0.82],...
  "position",[r_screen(3)/2-150,r_screen(4)/2-50,300,100]);
  pause(0.2);
  r_time_factor=r_time/1000;
  for r_A_c=(1:r_n),
    r_sum=0,
    if (r_A_c==ceil(r_n/3)),
      waitbar(0.4,r_wbf);
    endif
    if (r_A_c==ceil(r_n/2)),
      waitbar(0.6,r_wbf);
    endif
    if (r_A_c==(ceil(2*r_n/3))),
      waitbar(0.8,r_wbf);
    endif
    for r_A_f=(r_sample_pgain:r_m),
        r_sum=r_sum+1, 
        r_A(r_A_f,r_A_c)=r_A(r_A_f,r_A_c)*...
        ((r_lgain*r_time_factor*r_sum)+(e^(r_egain*r_time_factor*r_sum)));
    endfor
  endfor
  waitbar(1,r_wbf);
  pause(0.2);
  close(r_wbf);
  #Drawing
  rf_draw;
endif
return;
endfunction
