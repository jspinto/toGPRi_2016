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

function rf_mgain
global r_A r_window_radar r_info r_window_radar_axes r_colormap r_time r_screen;
[r_m,r_n]=size(r_A);
r_c_sample_mgain=inputdlg({"Start sample: ","End sample: ","Direct factor: "},"Manual gain",1,{"1","","1"});
if (isempty(r_c_sample_mgain)~=1&&isempty(r_c_sample_mgain{1})~=1&&isempty(r_c_sample_mgain{2})~=1&&...
  isempty(r_c_sample_mgain{3})~=1&&str2num(r_c_sample_mgain{1})>0&&str2num(r_c_sample_mgain{1})<=r_m&&...
  str2num(r_c_sample_mgain{2})>str2num(r_c_sample_mgain{1})&&str2num(r_c_sample_mgain{2})<=r_m&&...
  str2num(r_c_sample_mgain{3})>0),
    r_sample_mgain_start=str2num(r_c_sample_mgain{1});
    r_sample_mgain_end=str2num(r_c_sample_mgain{2});
    r_mgain=str2num(r_c_sample_mgain{3});
    #Direct gain.
    r_wbf=waitbar(0.2,"Processing!\n","windowstyle","modal","name","toGPRi","numbertitle","off","color",[0.85,0.85,0.82],...
    "position",[r_screen(3)/2-150,r_screen(4)/2-50,300,100]);
    pause(0.1);
    waitbar(0.4,r_wbf);
    pause(0.1);
    waitbar(0.6,r_wbf);
    pause(0.1);
    r_A(r_sample_mgain_start:r_sample_mgain_end,:)=r_A(r_sample_mgain_start:r_sample_mgain_end,:)*r_mgain;
    waitbar(0.8,r_wbf);
    pause(0.1);
    waitbar(1,r_wbf);
    pause(0.2);
    close(r_wbf);
    #Drawing
    rf_draw;
endif
return;
endfunction
