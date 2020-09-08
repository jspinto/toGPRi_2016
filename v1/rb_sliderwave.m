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

function rb_sliderwave
global r_info r_A r_screen r_window_wave_axes r_wsl r_t1;
r_wb=waitbar(0.5,"Please, wait.\n","windowstyle","modal","name","toGPRi","numbertitle","off",...
  "color",[0.85,0.85,0.82],"position",[r_screen(3)/2-150,r_screen(4)/2-50,300,100]);
r_window_wave=figure("visible","off","position",[660,200,300,600],"name","Wavelets","numbertitle","off");
r_window_wave_axes=axes("parent",r_window_wave,"layer","top");
r_wave=plot(r_window_wave_axes,r_A(:,1),"linewidth",2.5,"color","blue");
grid minor;
view(90,90);
waitbar(0.9,r_wb);
r_wsl=uicontrol("style","slider","min",1,"max",size(r_A,2),...
  "sliderstep",[1 25]./(size(r_A,2)-1),"value",1,...
  "position",[20 20 120 20],"callback",@rfa_dial);
r_t1=uicontrol('style','text','string','1','Position',[225 20 60 20]);
set(r_window_wave,"visible","on");
close(r_wb);
endfunction

function rfa_dial
global r_A r_window_wave_axes r_wsl r_t1;
r_dial=round(get(r_wsl,"value"));
r_text_dial=num2str(r_dial);
r_wave=plot(r_window_wave_axes,r_A(:,r_dial),"linewidth",2.5,"color","blue");
grid(r_window_wave_axes,"minor","on");
view(r_window_wave_axes,90,90);
set(r_t1,"string",r_text_dial);
endfunction
