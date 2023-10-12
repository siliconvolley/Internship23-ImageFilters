% To generate random numbers between 1 and 50
total_numbers = input("Enter total random numbers: ");
number_list = [];
for i = 1:total_numbers
    while 1
        random_number = rand()*100;
        if (random_number > 1 && random_number <= 50)
            number_list = [number_list, random_number];
            break;
        end
    end
end
number_list