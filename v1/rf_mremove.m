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

function rf_mremove
global r_A r_window_radar r_window_radar_axes r_colormap r_time r_screen;
[r_m,r_n]=size(r_A);
r_select_mremove=inputdlg({"Percentage: "},"Percentage on each side of the mean values",1,{"0"});
if (isempty(r_select_mremove)~=1&&str2num(r_select_mremove{1})>0&&str2num(r_select_mremove{1})<=100),
  r_mremove=str2num(r_select_mremove{1});
  #Removing noise.
  #NOT!: r_pos=find(r_memin>r_A(:)<r_memax); r_A(r_pos,:)=0;
  r_wbf=waitbar(0.2,"Processing!\n","windowstyle","modal","name","toGPRi","numbertitle","off","color",[0.85,0.85,0.82],...
  "position",[r_screen(3)/2-150,r_screen(4)/2-50,300,100]);
  pause(0.2);
  waitbar(0.4,r_wbf);
  pause(0.1);
  r_mepmax=mean(max(r_A))*r_mremove/100;
  r_mepmin=mean(min(r_A))*r_mremove/100;
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
    for r_A_f=(1:r_m),
       if(r_mepmin < r_A(r_A_f,r_A_c) && r_mepmax > r_A(r_A_f,r_A_c)),
        r_A(r_A_f,r_A_c)=0;
       endif
    end
  end
  waitbar(1,r_wbf);
  pause(0.2);
  close(r_wbf);
  #Drawing
  rf_draw;
endif
return;
endfunction
