require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')
loans_hash = Hash.new

CHOICES = %w(1 2 3 4)

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

def get_choice
  choice = gets.chomp    # CONTINUE HERE
  case choice
  when '1' then return '1'
  end
end

def get_loan_name 
  loan_name = ''
  loop do
    loan_name = gets.chomp
    if valid_name?(loan_name)
      return loan_name
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
      num = num.to_f / 100 / 12
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

def calculate_payment(loan, apr, duration)
  payment = loan * (apr / (1 - (1 + apr)**(-duration)))
end

def yes_no
  choice = ''
  loop do
    choice = gets.chomp.downcase
    
    if choice.start_with?('y')
      return 'y'
    elsif choice.start_with?('n')
      return 'n'
    else
      prompt(messages('valid_choice'))
    end
  end
end

def save?(hash, loan, apr, duration, payment)
  info = Array.new
  choice = yes_no
  if choice == 'y'
    prompt(messages('get_loan_name'))
    name = get_loan_name
    prompt("'#{name}' #{messages('loan_name')}")
    info.push(loan, apr, duration, payment)
    hash[name.to_sym] = info
  else
    prompt(messages('main_menu'))
  end
end

def loan_calculator(loans_hash)
  prompt(messages('loan_amount'))
  loan_amount = get_loan_amount
  prompt(messages('apr'))
  apr = get_apr
  prompt(messages('duration'))
  duration = get_duration
  prompt(messages('calculating'))
  sleep(2)
  monthly_payment = calculate_payment(loan_amount, apr, duration)
  prompt(messages('payment_script') + monthly_payment.round(2).to_s + '.')
  sleep(2)
  prompt(messages('save'))
  save?(loans_hash, loan_amount, apr, duration, monthly_payment)
  sleep(2)
end

# Program Start

loop do
  system("clear") || system("cls")
  puts messages('welcome').center(50)
  prompt(messages('directory'))
  option = get_choice
  case option
  when '1' then loan_calculator(loans_hash)
  when '4' then break   # NOT WORKING
  end
end

  p loans_hash

