%Single State Model-- wash out trials
A = 0.99;
B = 0.013;
p = 800
k = 0.290461513759037 %80th value of initial learning
for wot = 1:300
    for i = 1:p + wot    
  
    if (i >= 0) && (i <50)
        f = 0;
    elseif (i >= 50) && (i <401) || ((i >= 431+wot) && (i < 801+wot))
        f = 1;
    elseif (i >= 401) && (i <431)
        f = -1;
    elseif (i >= 431) && (i < (431+wot))
        f = 0;
    end
    
    if (i == 1)
        e = f;
        n = B*e;
        
    else 
        e = f - n(i-1);
        n(i) = A*n(i-1) + B*e;
        
    end
    end
    I(wot) = (n(461 + wot)-k)/k * 100; % 430th trial where relearning starts 
    
   
end
figure (4)
subplot(2,1,1)
plot (1:300, I)
title ({'The amount of saving for Single State Model',...
    'as a function of the number of washout trials'}, 'FontSize', 14)
xlabel ('Wash-out Trials','FontSize', 14)
ylabel ('Savings [%]','FontSize', 14)
ylim ([-10 100])
grid on
grid minor

%Multi State Model-- wash out trials
A = 0.99;
B = 0.013;
p = 800
k = 0.336245020637804 %80th value of initial learning
for wot = 1:300
    
    for i = 1:p + wot    
  
    if (i >= 0) && (i <50)
        f = 0;
    elseif (i >= 50) && (i <401) || ((i >= 418+wot) && (i < 801+wot))
        f = 1;
    elseif (i >= 401) && (i <418)
        f = -1;
    elseif (i >= 418) && (i < (418+wot))
        f = 0;
    end
    
    if (i == 1)
        e = f;
        n1 = Bf * e(i); %Fast
        n2 = Bs * e(i); %Slow
    else 
        n3(i-1) = n1(i-1) + n2(i-1); %Total
        e(i-1) = f - n3(i-1); %Error
        n1(i) = Af * n1(i-1) + Bf * e(i-1); %Fast
        n2(i) = As * n2(i-1) + Bs * e(i-1); %Slow
        
    end
    end
    I(wot) = (n3(448+wot)-k)/k * 100; % 418th trial where relarning starts + 30)
    
end
%figure (5)
subplot(2,1,2)
plot (1:300, I)
title ({'The amount of saving for Multi-Rate Model',...
    'as a function of the number of washout trials'}, 'FontSize', 14)
xlabel ('Wash-out Trials','FontSize', 14)
ylabel ('Savings [%]','FontSize', 14)
ylim ([-10 100])
grid on
grid minor