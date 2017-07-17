require 'erb'
require 'pry'

kids_data   = File.read('data/kids-data.txt')
invoice_letter = File.read('templates/invoice_letter.txt.erb')
#
kids_data.each_line do |kid|
    kid_data_array = kid.split

    name     = kid_data_array[0]
    next if name == 'name'

    gender        = kid_data_array[1]
    behavior      = kid_data_array[2]
    toys          = kid_data_array[3..8]
    street_number = kid_data_array[9]
    street_name   = kid_data_array[10]
    street_suffix = kid_data_array[11]
    postal_code   = kid_data_array[12]
    house_value   = kid_data_array[13]

    if behavior == 'naughty'
      toys = [toys.last]
      unless toys == "kaleidoscope"
      end

      end


    if house_value.to_i < 200000
      charge = 0
    elsif house_value.to_i < 1000000 && house_value.to_i >= 200000
      charge = 100
    else
      charge = 1000
    end

    subtotal = charge * toys.count
    hst = subtotal * 0.13
    total = subtotal + hst

    if behavior == "naughty"
      addendum = "P.S. For a limited time get 25% off the best-seller by Ms. Claus, I’m Getting Nothing for Christmas: Raising Toy-Worthy Children in a Device-Driven World."
    else
      addendum = ""
    end



     filename    = 'letters/invoices/' + name + '.txt'
     letter_text = ERB.new(invoice_letter, nil, '-').result(binding)
     puts "Writing #{filename}."
     File.write(filename, letter_text)
end

#




#
#   next unless behavior == 'nice'
#


#


#
# end
#
# puts 'Done!'
