function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)


Theta = zeros(n, 1); % initializam vectorul Theta cu 0

for i = 1:iter % numarul de iteratii

    h = FeatureMatrix * Theta; % calculeaza predictiile
    error = h - Y; % calculeaza eroarea

    for j = 1:n % pentru fiecare coeficient Theta
        Theta(j) = Theta(j) - alpha * (1/m) * sum(error .* FeatureMatrix(:,j)); % actualizeaza coeficientul
    end

end


end
