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

function rb_info
global r_info_cat r_screen r_A;
r_window_info=figure("visible","on","position",[r_screen(3)/2-175,r_screen(4)/2-250,400,625],...
"color",[0.85,0.85,0.82],"name","toGPRi - Info","menubar","none","numbertitle","off");
r_window_info_panel=uipanel("parent",r_window_info,"titleposition","centertop","fontsize",12,...
"backgroundcolor","white","position",[.10,.15,.80,.75]);
r_info_c_s=num2str(size(r_A,1));
r_info_c_t=num2str(size(r_A,2));
r_info_c_st=strcat(...
"\n\n",{" "},"CURRENT GEOMETRY:\n\n",
{" "},"Samples:",{" "},r_info_c_s,{"   "},"Traces:",{" "},r_info_c_t,"\n","\n"...
);
r_window_info_text=uicontrol("parent",r_window_info_panel,"style","text","position",[.10,.10,600,450],...
"backgroundcolor","white","horizontalalignment","left","verticalalignment","middle","fontsize",12,"string",strcat(r_info_cat,r_info_c_st,"\n"));
return;
endfunction
