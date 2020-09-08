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
rf_draw.m brings about the 2D matrix and results in the image (the figure has the menus to call the
different working functions).
#}

function rf_draw
global r_A r_window_radar r_window_radar_figure r_window_radar_axes r_time r_screen r_info r_colormap ...
 r_aspect_hr r_aspect_vr r_rfma r_s_contrast;
close all;
if (r_rfma==0),
  rf_meter_axes;
  else,
  r_wb=waitbar(0.1,"Drawing!\n","windowstyle","modal","name","toGPRi","numbertitle","off",...
  "color",[0.85,0.85,0.82],"position",[r_screen(3)/2-150,r_screen(4)/2-50,300,100]);
  r_window_radar=figure("visible","off","name","toGPRi - RADARGRAM","numbertitle","off",...
  "position",[r_screen(3)*0.1,r_screen(4)*0.1,r_screen(3)*0.8,r_screen(4)*0.8]);
  r_window_radar_axes=axes("parent",r_window_radar);
  r_time=(str2num(r_info{19})/str2num(r_info{1}));
  waitbar(0.2,r_wb);
  [r_m,r_n]=size(r_A);
  set(r_window_radar_axes,"ylabel","nanoseconds",...
  "ytick",[0,r_m*0.2,r_m*0.4,r_m*0.6,r_m*0.8,r_m],...
  "yticklabel",{"0";...
  num2str(round(r_time*r_m*0.2));...
  num2str(round(r_time*r_m*0.4));...
  num2str(round(r_time*r_m*0.6));...
  num2str(round(r_time*r_m*0.8));...
  num2str(round(r_time*r_m))},...
  "xlabel","traces","xtick",(0:round(r_n/5):r_n));
  waitbar(0.3,r_wb);
  pause(0.05);
  waitbar(0.4,r_wb);
  pause(0.05);
  waitbar(0.5,r_wb);
  pause(0.05);
  waitbar(0.6,r_wb);
  pause(0.05);
  waitbar(0.7,r_wb);
  pause(0.05);
  mid="WAITING FOR FIGURE!\n";
  waitbar(0.8,r_wb,mid);
  pause(0.05);
  r_window_radar_uimenu_1=uimenu("label","Display","parent",r_window_radar);
  uimenu(r_window_radar_uimenu_1,"label","Colormap","accelerator","k","callback",@rf_select_colormap);
  uimenu(r_window_radar_uimenu_1,"label","Number of colors","accelerator","q","callback",@rf_select_contrast);
  uimenu(r_window_radar_uimenu_1,"label","Redraw","accelerator","j","callback",@rf_draw);
  r_window_radar_uimenu_2=uimenu("label","A-scan","parent",r_window_radar);
  uimenu(r_window_radar_uimenu_2,"label","Waveform slider","accelerator","u","callback",@rb_sliderwave);
  r_window_radar_uimenu_3=uimenu("label","B-scan settings","parent",r_window_radar);
  uimenu(r_window_radar_uimenu_3,"label","Time-zero","accelerator","z","callback",@rf_select_zero);
  r_window_radar_uimenu_3_sub_1=uimenu(r_window_radar_uimenu_3,"label","Filter and gain settings");
  uimenu(r_window_radar_uimenu_3_sub_1,"label","Subtract mean trace","accelerator","b","callback",@rf_msubtract);
  uimenu(r_window_radar_uimenu_3_sub_1,"label","Gain recovery","accelerator","g","callback",@rf_pgain);
  uimenu(r_window_radar_uimenu_3_sub_1,"label","Window constant gain","accelerator","e","callback",@rf_mgain);
  uimenu(r_window_radar_uimenu_3_sub_1,"label","Vertical smoothing","accelerator","v","callback",@rf_vsmooth);
  uimenu(r_window_radar_uimenu_3_sub_1,"label","Horizontal smoothing","accelerator","h","callback",@rf_hsmooth);
  uimenu(r_window_radar_uimenu_3_sub_1,"label","Remove noise","accelerator","s","callback",@rf_mremove);
  uimenu(r_window_radar_uimenu_3,"label","Topography","accelerator","t","callback",@rf_hypso);
  uimenu(r_window_radar_uimenu_3,"label","Reset geometry and filters","accelerator","r","callback",@rf_original);
  r_window_radar_uimenu_8=uimenu("label","Info","parent",r_window_radar);
  uimenu(r_window_radar_uimenu_8,"label","Radargram info","accelerator","i","callback",@rb_info);
  r_window_radar_uimenu_9=uimenu("label","Axes","parent",r_window_radar);
  uimenu(r_window_radar_uimenu_9,"label","Height and weight","accelerator","x","callback",@rf_meter_axes);
  uimenu(r_window_radar_uimenu_9,"label","Samples and traces (fine grid)","accelerator","f","callback",@rf_samples_fine);
  uimenu(r_window_radar_uimenu_9,"label","Time and traces","accelerator","m","callback",@rf_draw);
  uimenu(r_window_radar_uimenu_9,"label","Axes ratio","accelerator","o","callback",@rf_ratio);
  r_window_radar_uimenu_10=uimenu("label","Save","parent",r_window_radar);
  uimenu(r_window_radar_uimenu_10,"label","Save Octave binary","accelerator","B","callback",@rb_save);
  uimenu(r_window_radar_uimenu_10,"label","Save Octave figure","accelerator","F","callback",@rb_save_ofig);
  uimenu(r_window_radar_uimenu_10,"label","Save TIFF image","accelerator","T","callback",@rf_tiff);
  #Resulting in the radargram image.
  surface(r_A,"facecolor","interp","edgecolor","none","parent",r_window_radar_axes);
  set(r_window_radar_axes,"ydir","reverse","outerposition",[0,0,1,1],"fontsize",16);
  waitbar(0.9,r_wb);
  colormap(eval(strcat(r_colormap,r_s_contrast)));
  r_finished="FIGURE FINISHED.\n";
  waitbar(1,r_wb,r_finished);
  #Visible figure.
  set(r_window_radar_axes,"dataaspectratio",[r_aspect_vr,r_aspect_hr,1],"layer","top");
  set(r_window_radar,"visible","on");
  pause(0.05);
  close(r_wb);
endif
return;
endfunction

