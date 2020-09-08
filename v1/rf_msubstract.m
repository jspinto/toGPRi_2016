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

function rf_msubstract
global r_A r_window_radar r_window_radar_axes r_colormap r_time r_screen;
r_ms_percent_str=inputdlg({"Percentage: "},"Average trace substract",1,{"100"});
if (isempty(r_ms_percent_str)~=1&&str2num(r_ms_percent_str{1})>0&&str2num(r_ms_percent_str{1})<=100),
  r_ms_percent=str2num(r_ms_percent_str{1});
  if (r_ms_percent>100||r_ms_percent<=0),
    return;
  endif
  r_wbf=waitbar(0.2,"Processing!\n","windowstyle","modal","name","toGPRi","numbertitle","off","color",[0.85,0.85,0.82],...
  "position",[r_screen(3)/2-150,r_screen(4)/2-50,300,100]);
  pause(0.2);
  waitbar(0.4,r_wbf);
  pause(0.1);
  r_B=r_A;
  [r_m,r_n]=size(r_A);
  for r_A_c=(1:r_n),
    if (r_A_c==(ceil(r_n/3))),
      waitbar(0.4,r_wbf);
    endif
    if (r_A_c==(ceil(r_n/2))),
      waitbar(0.6,r_wbf);
    endif
    if (r_A_c==(ceil(2*r_n/3))),
      waitbar(0.8,r_wbf);
    endif
    r_ms_range=floor((r_n/100)*r_ms_percent);
    p=r_A_c-round(r_ms_range);
    q=r_A_c+round(r_ms_range);
    if (p<1),
      p=1;
    endif
    if (q>r_n),
      q=r_n;
    endif
    r_A_c_mean=mean(r_A(:,p:q)')';
    r_B(:,r_A_c)=r_B(:,r_A_c)-r_A_c_mean;
  endfor
  r_A=r_B;
  clear r_B;
  waitbar(1,r_wbf);
  pause(0.2);
  close(r_wbf);
  #Drawing
  rf_draw;
endif
return;
endfunction
