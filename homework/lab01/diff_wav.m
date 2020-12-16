function ret = diff_wav(x, bm, n)

% b_m= [-0.0024, -0.0042, 0.0095, 0.02, -0.038, -0.0696, 0.1374, 0.4472, 0.4472, 0.1374, -0.0696, -0.038, 0.02, 0.0095, -0.0042, -0.0024];

b_len = length(bm);
x_inv = x(length(x):-1:1);
if (n <= length(x))
  new_x = x_inv(length(x_inv)-(n-1):length(x_inv));
else
  new_x = [zeros(1,n-length(x_inv)), x_inv];
endif
leng_min = min(length(new_x),b_len);
ret = sum(new_x(1:leng_min) .* bm(1:leng_min));