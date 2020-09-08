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

#{
The data are loaded by means of rb_star.m. rb_menu.m brings about a new figure with the work menus.
#}

function rb_menu
global r_screen;
r_window_menu=figure("color",[0.9 0.9 0.9],"position",[r_screen(3)*0.2-25,r_screen(4)*0.3-25,300,410],...
"name","toGPRi - Menu","menubar","none","numbertitle","off");
r_window_menu_panel=uipanel("parent",r_window_menu,"title","BUILDER MENU","titleposition","centertop",...
"fontsize",14,"fontweight","demi","backgroundcolor",[0.9 0.9 0.9],"position",[.10,.10,.80,.80]);
r_button_geommetry=uicontrol("parent",r_window_menu_panel,"style","pushbutton",...
"position",[25,250,190,50],"backgroundcolor",[0.9 0.9 0.9],"foregroundcolor","blue","fontsize",14,...
"string","Check geometries","callback",@r2_rad_geometry);
r_button_filters=uicontrol("parent",r_window_menu_panel,"style","pushbutton",...
"position",[25,190,190,50],"backgroundcolor",[0.9 0.9 0.9],"foregroundcolor","blue","fontsize",14,...
"string","Consecutive filters","callback",@r2_context_filters);
r_button_matrix=uicontrol("parent",r_window_menu_panel,"style","pushbutton",...
"position",[25,130,190,50],"backgroundcolor",[0.9 0.9 0.9],"foregroundcolor","blue","fontsize",14,...
"string","Build 3D matrix","callback",@r3_matrix);
r_button_image=uicontrol("parent",r_window_menu_panel,"style","pushbutton",...
"position",[25,70,190,50],"backgroundcolor",[0.9 0.9 0.9],"foregroundcolor","blue","fontsize",14,...
"string","Set up XYZ files","callback",@r3_xyz);
r_button_image=uicontrol("parent",r_window_menu_panel,"style","pushbutton",...
"position",[25,10,190,50],"backgroundcolor",[0.9 0.9 0.9],"foregroundcolor","blue","fontsize",14,...
"string","Draw rasters","callback",@r3_draw_img);
return;
endfunction
