function [segy_bin_file_header] = binary_file_header()

segy_bin_file_header.job = 0;                    % 3201
segy_bin_file_header.line_no=0;                  % 3205
segy_bin_file_header.reel_no=0;                  % 3209
segy_bin_file_header.tr_per_ens = 0;             % 3213      mandatory for prestack
segy_bin_file_header.tr_aux_per_ens = 0;         % 3215      mandatory for prestack
segy_bin_file_header.dt = 1000;                  % 3217      mandatory for all 
segy_bin_file_header.dt_orig = 0;                % 3219
segy_bin_file_header.ns = 1000;                  % 3221      mandatory for all
segy_bin_file_header.ns_org = 0;                 % 3223
segy_bin_file_header.format = 5;                 % 3225      mandatory; % value=5  for IEEE standard
segy_bin_file_header.fold = 0;                   % 3227      imp
segy_bin_file_header.sorting = 0;                % 3229      imp
segy_bin_file_header.vert = 0;                   % 3231
segy_bin_file_header.sweep_freq0 = 0;            % 3233
segy_bin_file_header.sweep_freq1= 0;             % 3235
segy_bin_file_header.sweep_length = 0;           % 3237
segy_bin_file_header.sweep_type = 0;             % 3239
segy_bin_file_header.sweep_tr_no = 0;            % 3241
segy_bin_file_header.sweep_tr_taper0 = 0;        % 3243
segy_bin_file_header.sweep_tr_taper1 = 0;        % 3245
segy_bin_file_header.sweep_taper_type = 0;       % 3247
segy_bin_file_header.correlated = 0;             % 3249
segy_bin_file_header.gain_bin = 0;               % 3251
segy_bin_file_header.amp_rec = 0;                % 3253
segy_bin_file_header.measurement = 1;            % 3255         %Value=1 for meters; value=0 for ft.
segy_bin_file_header.polarity_impulse = 0;       % 3257

segy_bin_file_header.polarity_vibrator = 0;      % 3259
segy_bin_file_header.unassigned1=zeros(120,1);   % 3261-3500,    240 BYTES
segy_bin_file_header.rev_no = 1;                 % 3501     % value =1 for SEGY 2002 NORMS
segy_bin_file_header.fix_length = 1;             % 3503     % value=1  ==> all traces are of same length
                                                            % value=0  ==> length of traces may vary
                                                            
segy_bin_file_header.ex_tex_file_header = 0;     % 3505      % value=0  => Extended Textual file header is not present
segy_bin_file_header.unassigned2=zeros(47,1);   % 3507-3600,   94 BYTES

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    










