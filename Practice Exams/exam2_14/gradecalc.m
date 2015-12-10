function letter = gradecalc(grade);
for i = 1:length(grade)
    if grade(i) >= 93 & grade(i) <= 100
        letter(i,:) = 'A '
    elseif grade(i) >= 90 & grade(i) <= 92.9
        letter(i,:) = 'A-'
    elseif grade(i) >= 87 & grade(i) <=89.9
        letter(i,:) = 'B+'
    elseif grade(i) >= 80 & grade(i) <= 82.9
        letter(i,:) = 'B-'
    elseif grade(i) >= 77 & grade(i) <= 79.9
        letter(i,:) = 'C+'
    elseif grade(i) >= 73& grade(i) <= 76.9
        letter(i,:) = 'C-'
    elseif grade(i) >=60 & grade(i) <=69.9
        letter(i,:) = 'D '
    elseif grade(i) < 60
        letter(i,:) = 'F '
    end
end

        
    
