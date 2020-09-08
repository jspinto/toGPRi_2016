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

function r2_context_filters
#Only works with tq toolkit.
graphics_toolkit qt;
#To avoid problems with pager.
PAGER("less > /dev/null");
clear;
r_screen=get(0,'ScreenSize');
#Display.
r_f=figure("name","toGPRi - Filters","menubar","none","color",[0.9 0.9 0.9],"numbertitle","off",...
  "position",[r_screen(3)*0.2,r_screen(4)*0.3,1230,425]);
a1=uicontrol("parent",r_f,"string","Time zero","style","togglebutton","backgroundcolor",[0.9 0.9 0.9],...
  "foregroundcolor","blue","fontsize",14,"horizontalalignment","left","position",[10 360 200 35]);
a2=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[220 360 55 35]);
a3=uicontrol("parent",r_f,"string","Sample","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[285 360 150 35]);
b1=uicontrol("parent",r_f,"string","Gain recovery","style","togglebutton","backgroundcolor",[0.9 0.9 0.9],...
  "foregroundcolor","blue","fontsize",14,"horizontalalignment","left","position",[10 260 200 35]);
b2=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[220 260 55 35]);
b3=uicontrol("parent",r_f,"string","Sample","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[285 260 150 35]);
b4=uicontrol("parent",r_f,"string","0","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[425 260 55 35]);
b5=uicontrol("parent",r_f,"string","Lineal factor","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[490 260 150 35]);
b6=uicontrol("parent",r_f,"string","0","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[650 260 55 35]);
b7=uicontrol("parent",r_f,"string","Exponential factor","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[715 260 150 35]);
c1=uicontrol("parent",r_f,"string","Direct gain","style","togglebutton","backgroundcolor",[0.9 0.9 0.9],...
  "foregroundcolor","blue","fontsize",14,"horizontalalignment","left","position",[10 210 200 35],"value",0);
c2=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[220 210 55 35]);
c3=uicontrol("parent",r_f,"string","From sample","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[285 210 150 35]);
c4=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[425 210 55 35]);
c5=uicontrol("parent",r_f,"string","To sample","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[490 210 150 35]);
c6=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[650 210 55 35]);
c7=uicontrol("parent",r_f,"string","Factor","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[715 210 150 35]);
d1=uicontrol("parent",r_f,"string","Horizontal smooth","style","togglebutton","backgroundcolor",[0.9 0.9 0.9],...
  "foregroundcolor","blue","fontsize",14,"horizontalalignment","left","position",[10 110 200 35],"value",0);
d2=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[220 110 55 35]);
d3=uicontrol("parent",r_f,"string","From sample","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[285 110 150 35]);
d4=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[425 110 55 35]);
d5=uicontrol("parent",r_f,"string","To sample","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[490 110 150 35]);
d6=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[650 110 55 35]);
d7=uicontrol("parent",r_f,"string","From trace","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[715 110 150 35]);
d8=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[875 110 55 35]);
d9=uicontrol("parent",r_f,"string","To trace","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[940 110 150 35]);
d10=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[1100 110 55 35]);
d11=uicontrol("parent",r_f,"string","%","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[1165 110 150 35]);
e1=uicontrol("parent",r_f,"string","Vertical smooth","style","togglebutton","backgroundcolor",[0.9 0.9 0.9],...
  "foregroundcolor","blue","fontsize",14,"horizontalalignment","left","position",[10 160 200 35],"value",0);
e2=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[220 160 55 35]);
e3=uicontrol("parent",r_f,"string","From sample","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[285 160 150 35]);
e4=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[425 160 55 35]);
e5=uicontrol("parent",r_f,"string","To sample","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[490 160 150 35]);
e6=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[650 160 55 35]);
e7=uicontrol("parent",r_f,"string","From trace","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[715 160 150 35]);
e8=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[875 160 55 35]);
e9=uicontrol("parent",r_f,"string","To trace","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[940 160 150 35]);
e10=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[1100 160 55 35]);
e11=uicontrol("parent",r_f,"string","%","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[1165 160 150 35]);
f1=uicontrol("parent",r_f,"string","toGPRi","style","togglebutton","backgroundcolor",[0.9 0.9 0.9],...
  "foregroundcolor","blue","fontsize",14,"horizontalalignment","left","position",[913 310 200 35]); 
g1=uicontrol("parent",r_f,"string","Remove noise","style","togglebutton","backgroundcolor",[0.9 0.9 0.9],...
  "foregroundcolor","blue","fontsize",14,"horizontalalignment","left","position",[10 60 200 35]);
g2=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[220 60 55 35]);
g3=uicontrol("parent",r_f,"string"," %","style","text","backgroundcolor",[0.9 0.9 0.9],...
"fontsize",12,"horizontalalignment","left","position",[285 60 150 35]);
h1=uicontrol("parent",r_f,"string","Topography","style","togglebutton","backgroundcolor",[0.9 0.9 0.9],...
  "foregroundcolor","blue","fontsize",14,"horizontalalignment","left","position",[10 10 200 35],"value",0);
h2=uicontrol("parent",r_f,"string"," The pattern of the .txt files must be the same.","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[220 10 500 35]);
s1=uicontrol("parent",r_f,"string","START","style","pushbutton","backgroundcolor",[0.8 0.8 0.8],...
  "foregroundcolor","blue","fontangle","oblique","fontsize",16,"horizontalalignment","left",...
  "position",[525 50 100 35],"callback",@rfa_filters);
z1=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[785 50 55 35]);
z2=uicontrol("parent",r_f,"string","Max. samples","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[850 50 150 35]);
x1=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[1010 50 55 35]);
x2=uicontrol("parent",r_f,"string","Max. traces","style","text","backgroundcolor",[0.9 0.9 0.9],...
  "fontsize",12,"horizontalalignment","left","position",[1075 50 150 35]);
flo=uicontrol("parent",r_f,"string","Fliplr odd","style","togglebutton","backgroundcolor",[0.9 0.9 0.9],...
  "foregroundcolor","blue","fontsize",14,"horizontalalignment","left","position",[900 360 100 35],"value",0);
fle=uicontrol("parent",r_f,"string","Fliplr even","style","togglebutton","backgroundcolor",[0.9 0.9 0.9],...
  "foregroundcolor","blue","fontsize",14,"horizontalalignment","left","position",[1025 360 100 35],"value",0);
smt1=uicontrol("parent",r_f,"string","Substract mean tr.","style","togglebutton","backgroundcolor",[0.9 0.9 0.9],...
  "foregroundcolor","blue","fontsize",14,"horizontalalignment","left","position",[10 310 200 35],"value",0);
smt2=uicontrol("parent",r_f,"string","1","style","edit","backgroundcolor","white",...
  "fontsize",14,"position",[220 310 55 35]);
smt3=uicontrol("parent",r_f,"string"," %","style","text","backgroundcolor",[0.9 0.9 0.9],...
"fontsize",12,"horizontalalignment","left","position",[285 310 150 35]); 
#Data to function.
guidata(r_f,[a2,b2,b4,b6,c2,c4,c6,d2,d4,d6,d8,d10,e2,e4,e6,e8,e10,g2,a1,b1,c1,d1,e1,f1,g1,h1,z1,x1,flo,fle,smt2,smt1]);
endfunction

function rfa_filters
handles=guidata(gcf);
for(i=1:32),
  i_str=num2str(i);
  eval(strcat("i",i_str,"=get(handles(",i_str,"),\"string\")"));
  eval(strcat("i",i_str,"=str2num(i",i_str,")"));
endfor
if(i1<1||i2<1||i3<0||i4<0||i5<1||i6<1||i7<1||i8<1||i9<1||i10<1||i11<1||i12<1||i13<1||i14<1||i15<1||...
  i16<1||i17<1||i18<0),
  errordlg("At least one invalid value.");
else,
  r_dir=uigetdir;
  r_pattern=inputdlg([{"Pattern before: ","Number since: ","Number to: ","Pattern after: "}],...
  "Profiles",1,[{"","","",".rd3"}]);
  if (isempty(r_pattern)~=1&&isempty(r_pattern{1})~=1&&isempty(r_pattern{2})~=1&&...
  isempty(r_pattern{3})~=1&&isempty(r_pattern{4})~=1),
    r_pattern_num_s=str2num(r_pattern{2});
    r_pattern_num_t=str2num(r_pattern{3});
    k=1;
    l=(r_pattern_num_t-r_pattern_num_s)+1;
    #For topo.
    r_h1_v=get(handles(26),"value");
    if(r_h1_v==1),
      r_vh=inputdlg([{"Distance between traces (cm): ","Average velocity (cm/ns): "}],"Pass",1,[{"10","10"}]);
      r_h=str2num(r_vh{1});
      r_v=str2num(r_vh{2});
    endif
    r_wb=waitbar(0,"Processing profiles.","color",[0.85,0.85,0.82]); 
    for(j=r_pattern_num_s:r_pattern_num_t),
      waitbar(0.1,r_wb,strcat("Processing profile",{" "},num2str(k),{" "},"of",{" "},num2str(l)));
      r_profile=fullfile(r_dir,strcat(r_pattern{1},num2str(j),r_pattern{4}));
      #Opening the .rad file.
      rad_file=strrep(r_profile,".rd3",".rad");
      fid=fopen(strcat(rad_file),'r');
      #Reading the .rad file and the numerical data (not all numbers, loaded as strings).
      r_info=rot90(textread(rad_file,"%*s %s","delimiter",":"));
      #r_info{1}: number of samples,r_info{19}: time window,r_info{23}: number of traces.
      r_time=(str2num(r_info{19})/str2num(r_info{1}));
      #Now the data are in r_info (1x38).
      fclose(fid);
      fid=fopen(strcat(r_profile),'r');
      r_A=fread(fid,[str2num(r_info{1}),str2num(r_info{23})],'short');
      fclose(fid);
      #Displacing the matrix to zero.
      r_A=r_A-round(mean(mean(r_A)));
      
      #Geometries 1.
      [r_m,r_n]=size(r_A);
      if (i11>r_n),
        i11=r_n;
      endif
      if (i16>r_n),
        i16=r_n;
      endif
      
      #FLIPS, CUT, FILTERS AND GAINS
      
      ##Fliplr
      r_flo_v=get(handles(29),"value");
      if(r_flo_v==1),
        if (rem(k,2)~=0),
          r_A=fliplr(r_A);
          waitbar(0.08,r_wb);
        endif
      endif
      r_fle_v=get(handles(30),"value");
      if(r_fle_v==1),
        if (rem(k,2)==0),
          r_A=fliplr(r_A);
          waitbar(0.12,r_wb);
        endif
      endif
      
      ##Zero
      r_a1_v=get(handles(19),"value");
      if(r_a1_v==1),
        [r_m,r_n]=size(r_A);
        r_A(1:i1,:)=[];
        #r_time=r_time*(r_m/str2num(r_info{1}));
        r_A=r_A-round(mean(mean(r_A))); 
      endif
      waitbar(0.15,r_wb);
      
      ##Substract mean 
      r_bp1_v=get(handles(32),"value");
      if(r_bp1_v==1), 
        r_B=r_A; 
        [r_m,r_n]=size(r_A);
        r_aca=ceil(r_n/3);
        r_acb=ceil(r_n/2);
        r_acc=ceil(2*r_n/3);
        
        for r_A_c=(1:r_n),
          r_ms_range=floor((r_n/100)*i31);
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
            if (r_A_c==r_aca),
              waitbar(0.20,r_wb);
            endif
            if (r_A_c==r_acb),
              waitbar(0.23,r_wb);
            endif
            if (r_A_c==r_acc),
              waitbar(0.26,r_wb);
          endif
        endfor
        r_A=r_B;
        clear r_B;
      endif
         
      ##Gain
      r_b1_v=get(handles(20),"value");
      if(r_b1_v==1),
        [r_m,r_n]=size(r_A);
        r_time=r_time*(r_m/str2num(r_info{1}));
        r_time_factor=r_time/1000;
        for r_A_c=(1:r_n),
          r_sum=0,
          for r_A_f=(i2:r_m),
            r_sum=r_sum+1, 
            r_A(r_A_f,r_A_c)=r_A(r_A_f,r_A_c)*...
            ((i3*r_time_factor*r_sum)+(e^(i4*r_time_factor*r_sum)));
          endfor
        endfor
      endif
      waitbar(0.3,r_wb);
      
      ##Direct gain
      r_c1_v=get(handles(21),"value");  
      if(r_c1_v==1),
        r_A(i5:i6,:)=r_A(i5:i6,:)*i7;
      endif
      waitbar(0.4,r_wb);
       
      ##Vertical smooth
      r_e1_v=get(handles(23),"value");
      if(r_e1_v==1),
        r_vsm_factor=i17/100;
        for j=(i15:i16),
          r_B=r_A(i13:i14,j);
          r_B_pos=r_B(r_B>0);
          r_B_neg=r_B(r_B<0);
          r_v_pos_mean=mean(r_B_pos);
          r_v_neg_mean=mean(r_B_neg);
          for i=(i13:i14),
            if (r_A(i,j)>r_v_pos_mean),
             r_A(i,j)=r_A(i,j)-(r_vsm_factor*(r_A(i,j)-r_v_pos_mean));
            elseif (r_A(i,j)<r_v_pos_mean&&r_A(i,j)>0),
             r_A(i,j)=r_A(i,j)+(r_vsm_factor*(r_v_pos_mean-r_A(i,j)));
            elseif (r_A(i,j)>r_v_neg_mean&&r_A(i,j)<0),
              r_A(i,j)=r_A(i,j)+(r_vsm_factor*(r_v_neg_mean-r_A(i,j)));
            elseif (r_A(i,j)<r_v_neg_mean),
              r_A(i,j)=r_A(i,j)-(r_vsm_factor*(r_A(i,j)-r_v_neg_mean));
            endif
          endfor
        endfor
      endif
      waitbar(0.5,r_wb);
      
      ##Horizontal smooth
      r_d1_v=get(handles(22),"value");
      if(r_d1_v==1),
        r_hsm_factor=i12/100;
        for i=(i8:i9),
          r_B=r_A(i,i10:i11);
          r_B_pos=r_B(r_B>0);
          r_B_neg=r_B(r_B<0);
          r_h_pos_mean=mean(r_B_pos);
          r_h_neg_mean=mean(r_B_neg);
          for j=(i10:i11),
            if (r_A(i,j)>r_h_pos_mean),
             r_A(i,j)=r_A(i,j)-(r_hsm_factor*(r_A(i,j)-r_h_pos_mean));
            elseif (r_A(i,j)<r_h_pos_mean&&r_A(i,j)>0),
             r_A(i,j)=r_A(i,j)+(r_hsm_factor*(r_h_pos_mean-r_A(i,j)));
            elseif (r_A(i,j)>r_h_neg_mean&&r_A(i,j)<0),
              r_A(i,j)=r_A(i,j)+(r_hsm_factor*(r_h_neg_mean-r_A(i,j)));
            elseif (r_A(i,j)<r_h_neg_mean),
              r_A(i,j)=r_A(i,j)-(r_hsm_factor*(r_A(i,j)-r_h_neg_mean));
            endif
          endfor
        endfor
      endif
      waitbar(0.6,r_wb);
          
      ##Noise
      r_g1_v=get(handles(25),"value");
      if(r_g1_v==1),
        [r_m,r_n]=size(r_A);
        r_mepmax=mean(max(r_A))*i18/100;
        r_mepmin=mean(min(r_A))*i18/100;
        for r_A_c=(1:r_n),
          for r_A_f=(1:r_m),
            if(r_mepmin < r_A(r_A_f,r_A_c) && r_mepmax > r_A(r_A_f,r_A_c)),
              r_A(r_A_f,r_A_c)=0;
            endif
          endfor
        endfor
      endif
      waitbar(0.7,r_wb);
      
      ##Topo
      r_h1_v=get(handles(26),"value");
      if(r_h1_v==1),
        #Opening the .txt topo file.
        topo_file=strrep(fullfile("/home/user00/Documentos/doutorado/gpr/octave/togpri3/work/probas/P1.txt"),".rd3",".txt");
        fid=fopen(strcat(topo_file),'r'); 
        #Reading the .txt file and the numerical data.
        [r_hypso_1,r_hypso_2,r_hypso_3]=textread(topo_file,"%f %f %f");
        fclose(fid);
        [r_m,r_n]=size(r_A);
        r_hypso_3=floor(r_hypso_3*100/((r_v/2)*r_time)); #to samples
        r_hypso_3=rot90(r_hypso_3);
        r_hypso_1=floor(r_hypso_1/(r_h/100));
        if r_hypso_1(1)==0;
          r_hypso_1(1)=1;
        endif
        r_hypso_1=rot90(r_hypso_1);
        r_hypso_3_rng=max(r_hypso_3)-min(r_hypso_3);
        r_hypso_1_max=max(r_hypso_1);
        if r_hypso_1_max>r_n,
          r_C=zeros(r_m+r_hypso_3_rng,r_hypso_1_max);
          r_A(:,r_n+1:r_hypso_1_max)=0;
        else,
          r_C=zeros(r_m+r_hypso_3_rng,r_n);
        endif
        r_hypso_3=abs(r_hypso_3-max(r_hypso_3));
        [r_hypso_m,r_hypso_n]=size(r_hypso_3);
        r_hypso_1(r_hypso_n+1)=r_n;
        r_hypso_3(r_hypso_n+1)=r_hypso_3(r_hypso_n);
        for tp=(1:r_hypso_n),
          if r_hypso_3(tp)<r_hypso_3(tp+1),
            for tq=(r_hypso_1(tp):(r_hypso_1(tp+1)-1)),
              ts=(r_hypso_3(tp+1)-r_hypso_3(tp))/(r_hypso_1(tp+1)-r_hypso_1(tp));
              tk=r_hypso_3(tp)+floor(ts*(tq-r_hypso_1(tp)+1));
              for tl=(1:r_m),
                r_C(tl+tk,tq)=r_A(tl,tq);
              endfor
            endfor
          elseif r_hypso_3(tp)>r_hypso_3(tp+1),
            for tq=(r_hypso_1(tp):(r_hypso_1(tp+1)-1)),
              ts=(r_hypso_3(tp)-r_hypso_3(tp+1))/(r_hypso_1(tp+1)-r_hypso_1(tp));
              tk=r_hypso_3(tp)-floor(ts*(tq-r_hypso_1(tp)+1));
              for tl=(1:r_m),
                r_C(tl+tk,tq)=r_A(tl,tq);
              endfor
            endfor
          else,
            for tq=(r_hypso_1(tp):(r_hypso_1(tp+1)-1)),
              tk=r_hypso_3(tp);
              for tl=(1:r_m),
                r_C(tl+tk,tq)=r_A(tl,tq);
              endfor
            endfor
          endif
        endfor
        r_A=r_C;
        clear r_C;
      endif
      waitbar(0.8,r_wb);
      #END OF FILTERS
      
      #Geometries 2.
      if(r_m<i27),
        r_m=i27;
      endif  
      if(r_n<i28),
        r_n=i28;
      endif
      r_A=resize(r_A,r_m,r_n);
       waitbar(0.9,r_wb);
      r_proc=strrep(r_profile,".rd3",".gpr");
      r_save=strcat("save -binary",{" "},r_proc," r_A");
      eval(r_save);
      waitbar(1,r_wb);
      pause(0.25);
      k=k+1;
    endfor
    close(r_wb);
    warndlg("Processing finished.");
  endif
endif
return;
endfunction
