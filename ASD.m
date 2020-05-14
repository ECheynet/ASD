function y1 =  ASD(y0,dt, indIn, indOut,varargin)
%  y1 =  ASD(y0,dt, indIn, indOut,varargin) converts accleration, displacement
%  of velocity data into another of these three types.
%
% Inputs:
%	* y0: double:  [1xN] or [Nx1] vector of the acceleration, displacement or
%       velocity response of a structure
%	* dt: double [1x1]: time step (seconds)
%	* indIn: double [1x1]: either  3 (acceleration) 2 (velocity) or 1
%       (displacement). It corresponds to the type of data usd in y0. If y0 is
%       an acceleration record, then indIn should be 1
%	* indOut: double [1x1]: either 1, 2 or 3. If one wish to transform an
%       acceleration record (indIn = 3) into a dispalcement record, then indOut
%       should be indOut = 1
%	*varargin:
%           |x| 'zeropadding': double [1x1], either 1 (with zero padding)  or
%       0 (without zero padding) for the fft method)
%           |x|'method': string: either 'fft' or 'TD'
%           |x|'window': type of window for the fft method (rectwin by
%           default)
%
%
% Outputs:
%   *y1: double:  [1xN] or [Nx1] vector of the acceleration, displacement or
%       velocity response of the structure, obtained from y0. If indOut = 1, y1
%       is a displacement.  If indOut = 2, y1 is a velocity and if  indOUt = 3,
%       y1 is an acceleration.
%
% Author: E. Cheynet - UiB - last modified: 2020-02-16
%
% see also cumtrapz fft fftshift detrend


%% Inputparseer
p = inputParser();
p.CaseSensitive = false;
p.addOptional('zeropadding',1);
p.addOptional('method','fft');
p.addOptional('window','rectwin'); % by default: no windowing
p.parse(varargin{:});
%%%%%%%%%%%%%%%%%%%%%%%%%%
zeropadding = p.Results.zeropadding ; % zero padding: either 1 or 0
method = p.Results.method; % either 'fft' or 'TD'
windowName = p.Results.window; % type of windowing used (none by default)

%% Main part

if indIn >3 || indIn <1 || indOut > 3 || indOut<1
    error(' ''indOut'' and ''indOut'' must be either 1 ,2 or  ')
end

if strcmpi(method,'fft')
    y0 = y0(:); % Forced to be a column vector
    N0 = numel(y0);
    
    if zeropadding==1
        N = 2^nextpow2(N0);
        y0 = [y0;zeros(N-N0,1)];
    elseif zeropadding==0
        N = N0;
    else
        error(' ''zeropadding'' must be either ''1'' or ''0'' ');
    end
    tmax = dt.*N; % max duration
    f0 = 1/tmax; % lowest frequency recorded
    fs = 1/dt; % sampling frequency
    
    
    y0 = window(windowName,N).*y0; % Windowing of the time series
    
    % Use of the two-sided  FFT
    f = [-fs/2:f0:fs/2-f0]';
    Y = fftshift(fft(y0));
    Y(f~=0) = Y(f~=0).*(2*pi*1i.*f(f~=0)).^(indOut-indIn);
    Y(f==0) = 0;
    y1 = real(ifft(ifftshift(Y)));
    
    if zeropadding==1,   y1 = y1(1:N0); end
    
elseif strcmpi(method,'TD') % IF fft is not used
    
    N = numel(y0);
    t = (0:N-1).*dt;
    if indIn-indOut == 2 % acc to displ with double integration method
        y1 = detrend(cumtrapz(t,y0));
        y1 = detrend(cumtrapz(t,y1));
    elseif  indIn-indOut == 1 % acc to vel or vel to displ
        y1 = detrend(cumtrapz(t,y0));
    elseif  indIn-indOut == 0
        y1 = y0;
    elseif indIn-indOut == -2 % displ to acc
        y0 = [0;0;y0(:)]; % pad with zero
        y1 = diff(y0,2)./dt.^2;
    elseif  indIn-indOut == -1 % displ to vel or vel to acc
        y0 = [0;y0(:)]; % pad with zero
        y1 = diff(y0)./dt;
    else
        error('unknown error')
    end
else
    error(' The method must be either ''fft'' or ''TD'' ');
    
end



return