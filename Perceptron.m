
load data.mat

classes = [classes;ones(1,200)];
w_init1 = [1, 1, -0.5]';
w_init2 = [1, 1, 0.5]';
rho = 0.01;

new_w1 = perceptron(classes, class_labels, w_init1, rho)';
disp("Final weight vector for w_init1 is : [" + new_w1(1) + ", " + new_w1(2) + ", " + new_w1(3) + "]");

new_w2 = perceptron(classes, class_labels, w_init2, rho)';
disp("Final weight vector for w_init2 is : [" + new_w2(1) + ", " + new_w2(2) + ", " + new_w2(3) + "]");

plot(classes(1,1:100), classes(2,1:100), "+");
hold
plot(classes(1,101:200), classes(2,101:200), "*");
plot([-new_w1(3)/new_w1(1), 0],[0, -new_w1(3)/new_w1(2)], "r");
plot([-new_w2(3)/new_w2(1), 0],[0, -new_w2(3)/new_w2(2)], "g");

function new_w = perceptron(classes, class_labels, w_init, rho)
    new_w = w_init;
    iter_count = 10;
    
    for iter = 1:iter_count
        sum = [0;0;0];
    for i = 1:length(classes)
        x = classes(:, i);
        result = new_w' * x;
        if result > 0
            result = 2;
        else 
            result = 1;
        end
        error = result - class_labels(i);
        sum = sum + rho * error * x;
    end
        new_w = new_w - sum;
    end
end
