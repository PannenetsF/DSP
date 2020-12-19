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
## @deftypefn {} {@var{retval} =} co2exp (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: pannenetsf <pannenetsf@manjaro>
## Created: 2020-12-19

function [string_exp, latex_exp] = co2exp (a, b)

string_exp = [];
latex_exp = [];

a_s_str = "";
a_l_str = "";
b_s_str = "";
b_l_str = "";

z_c = 0;
for i = a
  s_str = sprintf("(%.3f) * z^%d + ", i, z_c);
  l_str = sprintf("(%.3f) \\times z^{%d} + ", i, z_c);
  a_s_str = [a_s_str, s_str];
  a_l_str = [a_l_str, l_str];
  z_c = z_c - 1;
endfor

z_c = 0;
for i = b
  s_str = sprintf("(%.3f) * z^%d + ", i, z_c);
  l_str = sprintf("(%.3f) \\times z^{%d} + ", i, z_c);
  b_s_str = [b_s_str, s_str];
  b_l_str = [b_l_str, l_str];
  z_c = z_c - 1;
endfor

a_s_str = a_s_str(1:length(a_s_str)-2);
b_s_str = b_s_str(1:length(b_s_str)-2);
a_l_str = a_l_str(1:length(a_l_str)-2);
b_l_str = b_l_str(1:length(b_l_str)-2);

string_exp = [b_s_str, sprintf("\n%s\n", '-'*ones(1,max(length(b_s_str), length(a_s_str)))), a_s_str];

latex_exp = [sprintf("\\dfrac{%s}{%s}\n\n", b_l_str, a_s_str)];

endfunction
