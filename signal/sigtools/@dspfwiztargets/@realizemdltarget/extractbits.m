function hblk = extractbits(hTar,name)
%EXTRACTNBITS 


%   Copyright 2007 The MathWorks, Inc.
%   $Revision: 1.1.6.1 $  $Date: 2009/08/11 15:49:27 $

error(nargchk(2,2,nargin,'struct'));

% check if simulink/Sources lib is available, if not load it.
issrclibloaded = 0;
srclibname = 'simulink';
srcblks_avail = issimulinkinstalled;
if srcblks_avail,
    wdsrcblk = warning;
    warning('off');
    if isempty(find_system(0,'Name',srclibname))
        issrclibloaded = 1;
        load_system(srclibname);
    end
    warning(wdsrcblk);
end

bname = 'simulink/Logic and Bit Operations/Extract Bits';

hblk = add_block(bname, [hTar.system '/' name]);

if issrclibloaded
    close_system(srclibname);
end

% [EOF]