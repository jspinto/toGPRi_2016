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
rb_start.m let to open a .rad file and read the basic radargram data. After that, opens the corresponding
rd3 file and call the function to draw.
#}

function rb_start
#Only works with tq toolkit.
graphics_toolkit qt;
#To avoid problems with pager.
PAGER("less > /dev/null");
#A "clear" to erase all the data.
clear;
#Screen size.
global r_screen=get(0,'ScreenSize');
#Figure and menus.
r_window_load=figure("visible","on","name","toGPRi #1","numbertitle","off","color",[0.9 0.9 0.9],...
 "menubar","none","position",[r_screen(3)*0.3,r_screen(4)*0.25,r_screen(3)*0.35,r_screen(4)*0.5]);
r_window_load_uimenu_1=uimenu("label","Menu","parent",r_window_load);
uimenu(r_window_load_uimenu_1,"label","Load .rad file (2D)","accelerator","l","callback",@rb_load);
uimenu(r_window_load_uimenu_1,"label","Builder and rasters menu","accelerator","b","callback",@rb_menu);
uimenu(r_window_load_uimenu_1,"label","View figure","accelerator","f","callback",@rb_load_ofig);
pause(0.5);
uicontrol(r_window_load,"style","text","position", [20 290 600 100],"horizontalalignment","center","backgroundcolor",...
 [0.9 0.9 0.9],"fontweight","bold","fontsize",80,"foregroundcolor","blue","fontangle","oblique","string","toGPRi");
pause(0.5);
uicontrol(r_window_load,"style","text","position", [20,10,600,100],"horizontalalignment","left","backgroundcolor",...
 [0.9 0.9 0.9],"fontweight","bold","fontsize",10,"string",...
 "\'Tiny Octave ground-penetrating radar integration of tools\' v1 is free software (GPL3)\n and is a part\
 of my PhD in Cultural Heritage Protection at Universidade de Vigo.\n 2016-17, Javier Sanjurjo Pinto.\
 jsanjurjo@jspinto.net");
 pause(0.5);
uicontrol(r_window_load,"style","text","position", [20,100,400,100],"horizontalalignment","left","backgroundcolor",...
 [0.9 0.9 0.9],"fontweight","bold","fontsize",16,"string",...
 " ctrl+l: load gpr .rd3 profile. \n ctrl+b: builder menu. \n ctrl+f: load Octave figure.");
#Global vars.
##r_h is the distance between traces in cm., r_v is the average velocity in cm/ns.
##r_aspect_hr and r_aspect_vr are needed values for the aspect ratio on the basis samples:traces/1:1.
global r_h=10 r_v=10 r_aspect_hr=1 r_aspect_vr=1;
endfunction



