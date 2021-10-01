%Single State Model
A = 0.99;
B = 0.013;


for n = 1:800
    if (n >= 0) && (n <50)
        f = 0;
    elseif (n >= 50) && (n <401)
        f = 1;
    elseif (n >= 401) && (n <431)
        f = -1;
    elseif (n >= 431) && (n <801)
        f = 1;
    end
    
    if (n == 1)
        e = f;
        x = B*e;
        
    else 
        e = f - x(n-1);
        x(n) = A*x(n-1) + B*e;
        
    end
    
end

figure(1)
subplot (2,1,1)
plot(1:800,x, 'LineWidth',2); hold on
xlabel ('Trials','FontSize', 12)
ylabel ('Adaptation','FontSize', 12)
legend ('Net Adaptation','location','southeast')
title ({'Single-State Model'})
grid on


%Two State Model 
Af = 0.92;
Bf = 0.03;

As = 0.996;
Bs = 0.004;

for n = 1:800
    
    if (n >= 0) && (n <50)
        f = 0;
    elseif (n >= 50) && (n <401)
        f = 1;
    elseif (n >= 401) && (n <418)
        f = -1;
    elseif (n >= 418) && (n <801)
        f = 1;
    end
    
    
    if n == 1
        e = f;
        x1 = Bf * e(n); %Fast
        x2 = Bs * e(n); %Slow
    else
        x3(n-1) = x1(n-1) + x2(n-1); %Total
        e(n-1) = f - x3(n-1); %Error
        x1(n) = Af * x1(n-1) + Bf * e(n-1); %Fast
        x2(n) = As * x2(n-1) + Bs * e(n-1); %Slow
    end
end

subplot (2,1,2)
 plot(1:800,   x1,'g--','LineWidth', 1); hold on
plot(1:800,  x2,'r--','LineWidth', 1); hold on
plot(1:800,(x1+x2),'LineWidth',2); hold on

xlabel ('Trials','FontSize', 12)
ylabel ('Adaptation','FontSize', 12)
legend ('Fast State','Slow State','Net Adaptation','location','southeast')
title ({'Two-state Model'})
grid on


%Spontaneous Recovery for Single State Model
A = 0.99;
B = 0.013;

for n = 1:800
    if (n >= 0) && (n <50)
        f = 0;
    elseif (n >= 50) && (n <401)
        f = 1;
    elseif (n >= 401) && (n <431)
        f = -1;
    elseif (n >= 431) && (n <801)
        f = x(n-1);
    end
    
    if (n == 1)
        e = f;
        x = B*e;
        
    else 
        e = f - x(n-1);
        x(n) = A*x(n-1) + B*e;
        
    end
    
end

 figure(2)
subplot (2,1,1)
plot(1:800, x, 'LineWidth', 2); hold on
xlabel ('Trials','FontSize', 13)
ylabel ('Adaptation','FontSize', 13)
legend ('Net Adaptation','location','southeast')
title ({'Spontaneous Recovery for Single-State Model'})
grid on

%Spontaneous Recovery for Multi State Model

Af = 0.92;
As = 0.996;
Bf = 0.03;
Bs = 0.004;

for n = 1:800
    
    if (n >= 0) && (n <50)
        f = 0;
    elseif (n >= 50) && (n <401)
        f = 1;
    elseif (n >= 401) && (n <418)
        f = -1;
    elseif (n >= 418) && (n <801)
        f = x(n-1);
    end
    
    
    if n == 1
        e = f;
        x1 = Bf * e(n); %Fast
        x2 = Bs * e(n); %Slow
    else
        x3(n-1) = x1(n-1) + x2(n-1); %Total
        e(n-1) = f - x3(n-1); %Error
        x1(n) = Af * x1(n-1) + Bf * e(n -1); %Fast
        x2(n) = As * x2(n-1) + Bs * e(n-1); %Slow
    end
end

subplot (2,1,2)
plot(1:800, x1,'g--','LineWidth', 1); hold on
plot(1:800, x2, 'r--','LineWidth', 1); hold on
plot(1:800, x1 +x2, 'LineWidth', 2); hold on
xlabel ('Trials','FontSize', 13)
ylabel ('Adaptation','FontSize', 13)
legend ('Fast State','Slow State','Net Adaptation','location','southeast')
title ({'Spontaneous Recovery for Multi-State Model'})
grid on




%Jump up behaviour for Single State Model

A = 0.99;
B = 0.013;


for n = 1:800
    if (n >= 0) && (n <50)
        f = 0;
    elseif (n >= 50) && (n <401)
        f = 1;
    elseif (n >= 401) && (n <418)
        f = -1;
    elseif (n >= 431) && (n <551)
        f = x(n -1);   
    elseif (n >= 551) && (n <801)
        f = 1;
    end
    
    if (n == 1)
        e = f;
        x = B*e;
        
    else 
        e = f - x(n-1);
        x(n) = A*x(n-1) + B*e;
        
    end
    
end

figure(3)
subplot (2,1,1)
plot(1:800, x, 'LineWidth', 2); hold on
xlabel ('Trials','FontSize', 13)
ylabel ('Adaptation','FontSize', 13)
legend ('Net Adaptation','location','southeast')
title ({'Jump-up behaviour for Single-State Model'})
grid on


%Jump up behaviour for Multi State Model
Af = 0.92;
As = 0.996;
Bf = 0.03;
Bs = 0.004;

for n = 1:800
    
    if (n >= 0) && (n <50)
        f = 0;
    elseif (n >= 50) && (n <401)
        f = 1;
    elseif (n >= 401) && (n <418)
        f = -1;
    elseif (n >= 418) && (n <551)
        f = x(n-1);   
    elseif (n >= 551) && (n <801)
        f = 1;
    end
    
    
    if n == 1
        e = f;
        x1 = Bf * e(n); %Fast
        x2 = Bs * e(n); %Slow
    else
        x3(n-1) = x1(n-1) + x2(n-1); %Total
        e(n-1) = f - x3(n-1); %Error
        x1(n) = Af * x1(n-1) + Bf * e(n-1); %Fast
        x2(n) = As * x2(n-1) + Bs * e(n-1); %Slow
    end
end

subplot (2,1,2)
plot(1:800, x1,'g--', 'LineWidth', 2); hold on
plot(1:800, x2, 'r--','LineWidth', 2); hold on
plot(1:800, x1 +x2, 'LineWidth', 2); hold on
xlabel ('Trials','FontSize', 13)
ylabel ('Adaptation','FontSize', 13)
legend ('Fast State','Slow State','Net Adaptation','location','southeast')
title ({'Jump-up behaviour for Multi state Model'})
grid on





