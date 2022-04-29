a = pi/3;
v = 100;

[t, Y] = ode45 (@f, [0 20], [v*cos(a) ; v*sin(a) ; 0 ; 0]);
x = Y(:,3)
y = Y(:,4)
plot(x,y);

function ypoint = f (t, y)
   alpha = 0.001;%2.067;
   g = 9.81;
   ypoint(1) = -alpha*y(1)*y(1);
   ypoint(2) = -g -alpha*y(2)*y(2);
   ypoint(3) = y(1);
   ypoint(4) = y(2);
   ypoint = ypoint(:);
  
end
