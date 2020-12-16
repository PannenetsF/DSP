## Copyright (C) 2020 pannenetsf
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} diff_wave (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: pannenetsf <pannenetsf@manjaro>
## Created: 2020-12-15

function ret = diff_wave (x, bm, n)

% val x   : the wave series 
% val bm  : the response of the system
% val n   : the needed position of output, could be a single integer or an array 

size_n = size(n, 2);
ret = zeros(1,size_n);

for i = 1:size_n
  ret(i) = wdiff_wav(x, bm, i);
end

endfunction
