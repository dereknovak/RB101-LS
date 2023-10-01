require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')
loans = Hash.new

# Methods

def messages(message)
  MESSAGES[message]
end

def prompt(message)
  puts "=> " + message
end

def valid_name?(input)
  input.strip.empty? == false
end

def integer?(input)
  /^-?\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def valid_number?(input)
  integer?(input) || float?(input) 
end

def get_loan_name(hash)  # Will probably place this at end instead
  loan_name = ''
  loop do
    loan_name = gets.chomp
    if valid_name?(loan_name)
      hash[loan_name.to_sym]
      prompt("'#{loan_name}' #{messages('loan_name')}")
      break
    else
      prompt(messages('valid_name'))
    end
  end
end

def get_loan_amount
  num = ''
  loop do
    num = gets.chomp
    
    if valid_number?(num)
      return num.to_f
    else
      prompt(messages('valid_num'))
    end
  end
end

def get_apr
  num = ''
  loop do
    num = gets.chomp

    if valid_number?(num)
      num = num.to_f / 100
      return num
    else
      prompt(messages('valid_num'))
    end
  end
end

def get_duration
  num = ''
  loop do
    num = gets.chomp
    
    if integer?(num)
      return num.to_i
    else
      prompt(messages('valid_int'))
    end
  end
end

p get_duration