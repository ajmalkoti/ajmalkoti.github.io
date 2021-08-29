% STEPS: 
% 1. Make textural file header (3200 bytes) (FORMAT: EBCDIC OR ASCII )
% 2. Binary File header (400 bytes)
% 3. for 1:n
%        Make extended Textual file header (optional)(3200 bytes)(FORMAT: EBCDIC OR ASCII )
%    end
% 4. for 1:n
%        Trace header (240 Bytes)
%        trace
%    end
clc; clear all; close all;

fid= fopen('segy_DATA','w','b');

load('shotgather1.mat')
[nv, nh]= size(data);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Textual File header

    segy.textual_file_header = textual_file_header();       %note that the data is in ASCII format          % change header to EEBCDIC format

    fseek(fid,0,'bof');
    fwrite(fid,segy.textual_file_header(1:3200),'uchar');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Binary file header

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Create default valued header
    
    segy.binary_file_header = binary_file_header();
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Change Values of important headers
    
    segy.binary_file_header.dt = 1000;
    segy.binary_file_header.ns = nv;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Write header
    
    fwrite(fid,segy.binary_file_header.job,'int32');                
    fwrite(fid,segy.binary_file_header.line_no ,'int32');    
    fwrite(fid,segy.binary_file_header.reel_no ,'int32');    
    
    fwrite(fid, segy.binary_file_header.tr_per_ens,'int16');     
    fwrite(fid,segy.binary_file_header.tr_aux_per_ens ,'int16');    
    fwrite(fid, segy.binary_file_header.dt,'int16');                       % 3217      mandatory for all 
    fwrite(fid,segy.binary_file_header.dt_orig ,'int16');
    fwrite(fid,segy.binary_file_header.ns ,'int16');                       % 3221      mandatory for all
    fwrite(fid,segy.binary_file_header.ns_org ,'int16');  
    fwrite(fid,segy.binary_file_header.format ,'int16');                   % 3225      mandatory; % value=5  for IEEE standard
    fwrite(fid,segy.binary_file_header.fold ,'int16');    
    fwrite(fid,segy.binary_file_header.sorting  ,'int16'); 
    fwrite(fid,segy.binary_file_header.vert ,'int16'); 
    
    fwrite(fid,segy.binary_file_header.sweep_freq0 ,'int16');   
    fwrite(fid,segy.binary_file_header.sweep_freq1 ,'int16');   
    fwrite(fid,segy.binary_file_header.sweep_length ,'int16');  
    fwrite(fid,segy.binary_file_header.sweep_type ,'int16');    
    fwrite(fid,segy.binary_file_header.sweep_tr_no ,'int16');    
    fwrite(fid,segy.binary_file_header.sweep_tr_taper0 ,'int16');   
    fwrite(fid,segy.binary_file_header.sweep_tr_taper1 ,'int16');   
    fwrite(fid,segy.binary_file_header.sweep_taper_type ,'int16');
    
    fwrite(fid,segy.binary_file_header.correlated ,'int16'); 
    fwrite(fid,segy.binary_file_header.gain_bin ,'int16');   
    fwrite(fid,segy.binary_file_header.amp_rec ,'int16');    
    fwrite(fid,segy.binary_file_header.measurement ,'int16');    
    fwrite(fid,segy.binary_file_header.polarity_impulse ,'int16');    
    fwrite(fid,segy.binary_file_header.polarity_vibrator ,'int16');
    
    fwrite(fid,segy.binary_file_header.unassigned1(:) ,'int16'); 

    fwrite(fid,segy.binary_file_header.rev_no ,'int16');    
    fwrite(fid,segy.binary_file_header.fix_length ,'int16');    
    fwrite(fid,segy.binary_file_header.ex_tex_file_header ,'int16');    
    
    fwrite(fid,segy.binary_file_header.unassigned2(:) ,'int16');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Extended textual header
if (segy.binary_file_header.ex_tex_file_header~=0)      %if Extended textual header is allowed to written
    if(segy.binary_file_header.fix_length==1)
        n=segy.binary_file_header.ns;
    end
    segy.extended_textual_header=zeros(n*3200,0);
    fwrite(fid,segy.extended_textual_header ,'int16');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trace Header
    segy.tr_header = segy_trace_header();    %initialize the trace header
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Change Values of important headers
    
     segy_tr_header.xy_unit =1;                       % 89       in meters
     segy.tr_header.ns =nv;                            % 115    imp
     segy.tr_header.dt =.0001;                            % 117    imp

    for i=1:nh;
         
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     % Change Values of important headers
     
     segy.tr_header.src_x =0;                         % 73       To be changed 
     segy.tr_header.src_y =0;                         % 77       To be changed 
        
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     % Write header
    
     fwrite(fid,segy.tr_header.tr_seq_line,'int32');                      % 1      imp
     fwrite(fid,segy.tr_header.tr_seq_segy,'int32');                      % 5       
     fwrite(fid,segy.tr_header.fld_rec_no ,'int32');                      % 9      imp
     fwrite(fid,segy.tr_header.fld_rec_tr_no ,'int32');                   % 13     imp
     fwrite(fid,segy.tr_header.src ,'int32');                             % 17
     fwrite(fid,segy.tr_header.ensemble_no ,'int32');                     % 21 
     fwrite(fid,segy.tr_header.ensemble_tr_no,'int32');                   % 25
     
     fwrite(fid,segy.tr_header.tr_id ,'int16');                           % 29     imp  % value=1 => unknown type
     fwrite(fid,segy.tr_header.vert_sum ,'int16');                        % 31
     fwrite(fid,segy.tr_header.hor_sum ,'int16');                         % 33
     fwrite(fid,segy.tr_header.use ,'int16');                             % 35
     
     fwrite(fid,segy.tr_header.src_rec_dis ,'int32');                     % 37
     fwrite(fid,segy.tr_header.elev_rec ,'int32');                        % 41
     fwrite(fid,segy.tr_header.elev_src ,'int32');                        % 45    
     fwrite(fid,segy.tr_header.depth_src ,'int32');                       % 49
     fwrite(fid,segy.tr_header.datum_rec,'int32');                        % 53
     fwrite(fid,segy.tr_header.datum_src ,'int32');                       % 57
     fwrite(fid,segy.tr_header.depth_src ,'int32');                       % 61
     fwrite(fid,segy.tr_header.depth_gr ,'int32');                        % 65
     
     fwrite(fid,segy.tr_header.scaler1 ,'int16');                         % 69
     fwrite(fid,segy.tr_header.scaler2 ,'int16');                         % 71
     
     fwrite(fid,segy.tr_header.src_x ,'int32');                           % 73
     fwrite(fid,segy.tr_header.src_y ,'int32');                           % 77
     fwrite(fid,segy.tr_header.gr_x ,'int32');                            % 81
     fwrite(fid,segy.tr_header.gr_y ,'int32');                            % 85
     
     fwrite(fid,segy.tr_header.xy_unit ,'int16');                         % 89 
     fwrite(fid,segy.tr_header.vel_weather ,'int16');                     % 91 
     fwrite(fid,segy.tr_header.vel_subweather ,'int16');                  % 93
     fwrite(fid,segy.tr_header.uphole_t_src ,'int16');                    % 95
     fwrite(fid,segy.tr_header.uphole_t_gr ,'int16');                     % 97
     fwrite(fid,segy.tr_header.static_src ,'int16');                      % 99
     fwrite(fid,segy.tr_header.static_gr ,'int16');                       % 101
     fwrite(fid,segy.tr_header.static_total ,'int16');                    % 103
     fwrite(fid,segy.tr_header.time_lagA ,'int16');                       % 105
     fwrite(fid,segy.tr_header.time_lagB ,'int16');                       % 107
     fwrite(fid,segy.tr_header.time_delay ,'int16');                      % 109
     fwrite(fid,segy.tr_header.time_mute0 ,'int16');                      % 111
     fwrite(fid,segy.tr_header.time_mute1 ,'int16');                      % 113
     fwrite(fid,segy.tr_header.ns ,'int16');                              % 115    imp
     fwrite(fid,segy.tr_header.dt ,'int16');                              % 117    imp
     fwrite(fid,segy.tr_header.gain_type ,'int16');                       % 119
     fwrite(fid,segy.tr_header.gain_const_instrument ,'int16');           % 121
     fwrite(fid,segy.tr_header.gain_const_instrument_initial ,'int16');   % 123
     fwrite(fid,segy.tr_header.correlated ,'int16');                      % 125
     fwrite(fid,segy.tr_header.sweep_freq0 ,'int16');                     % 127
     fwrite(fid,segy.tr_header.sweep_freq1 ,'int16');                     % 129
     fwrite(fid,segy.tr_header.sweep_length ,'int16');                    % 131
     fwrite(fid,segy.tr_header.sweep_type ,'int16');                      % 133
     fwrite(fid,segy.tr_header.sweep_taper0 ,'int16');                    % 135
     fwrite(fid,segy.tr_header.sweep_taper1 ,'int16');                    % 137
     fwrite(fid,segy.tr_header.taper_type ,'int16');                      % 139
     fwrite(fid,segy.tr_header.filter_alias_freq ,'int16');               % 141
     fwrite(fid,segy.tr_header.filter_alias_slope ,'int16');              % 143
     fwrite(fid,segy.tr_header.filter_notch_freq ,'int16');               % 145
     fwrite(fid,segy.tr_header.filter_notch_slope ,'int16');              % 147
     fwrite(fid,segy.tr_header.filter_low_cut_freq ,'int16');             % 149
     fwrite(fid,segy.tr_header.filter_high_cut_freq ,'int16');            % 151
     fwrite(fid,segy.tr_header.slope_low_cut ,'int16');                   % 153
     fwrite(fid,segy.tr_header.slope_high_cut ,'int16');                  % 155
     fwrite(fid,segy.tr_header.time_year ,'int16');                       % 157
     fwrite(fid,segy.tr_header.time_day ,'int16');                        % 159
     fwrite(fid,segy.tr_header.time_hr ,'int16');                         % 161
     fwrite(fid,segy.tr_header.time_min ,'int16');                        % 163
     fwrite(fid,segy.tr_header.tiem_sec ,'int16');                        % 165
     fwrite(fid,segy.tr_header.time_basis ,'int16');                      % 167
     fwrite(fid,segy.tr_header.tr_wt_factor ,'int16');                    % 169
     fwrite(fid,segy.tr_header.gp_gr_no_roll ,'int16');                   % 171
     fwrite(fid,segy.tr_header.gp_gr_no_segy_tr0 ,'int16');               % 173
     fwrite(fid,segy.tr_header.gp_gr_no_trace1 ,'int16');                 % 175
     fwrite(fid,segy.tr_header.gap_size ,'int16');                        % 177
     fwrite(fid,segy.tr_header.taper_dist ,'int16');                      % 179
     
     fwrite(fid,segy.tr_header.cdp_x ,'float32');                           % 181
     fwrite(fid,segy.tr_header.cdp_y ,'float32');                           % 185
     fwrite(fid,segy.tr_header.inline ,'float32');                          % 189
     fwrite(fid,segy.tr_header.xline ,'float32');                           % 193
     fwrite(fid,segy.tr_header.src_no ,'float32');                          % 197
     
     fwrite(fid,segy.tr_header.scale1 ,'int16');                          % 201
     fwrite(fid,segy.tr_header.tr_unit ,'int16');                         % 203
     
     fwrite(fid,segy.tr_header.transdunction_const ,'int32');             % 205   
     
     fwrite(fid,segy.tr_header.transdunction_unit ,'int16');              % 211   
     fwrite(fid,segy.tr_header.device_id ,'int16');                       % 213
     fwrite(fid,segy.tr_header.scaler2 ,'int16');                         % 215
     fwrite(fid,segy.tr_header.src_type ,'int16');                        % 217
     
     fwrite(fid,segy.tr_header.src_energy_dir_mentissa ,'int32');                  % 219 
     fwrite(fid,segy.tr_header.src_energy_dir_exponent ,'int32');                  % 223
     fwrite(fid,segy.tr_header.src_measurement_mentissa ,'int32');                 % 225
     fwrite(fid,segy.tr_header.src_measurement_exponent ,'int32');                 % 229    
     fwrite(fid,segy.tr_header.src_measurement_unit ,'int32');            % 231 
     fwrite(fid,segy.tr_header.unassigned,'int32');              % 233-240    8-Bytes
    
     fwrite(fid,data(:,i),'float32');
    end
     
fclose(fid);































