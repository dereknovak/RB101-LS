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
  prompt(messages('directory'))

  choice = ''
  loop do
    choice = gets.chomp
    
    if CHOICES.include?(choice)
      return choice      
    else
      prompt(messages('valid_choice'))
    end
  end

  choice
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
  prompt(messages('loan_amount'))
  
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
  prompt(messages('apr'))
  
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
  prompt(messages('duration'))
  
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
  prompt(messages('payment_script') + payment.round(2).to_s + '.')
  payment
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
      prompt(messages('valid_response'))
    end
  end
end

def save?(hash, loan, apr, duration, payment)
  prompt(messages('save'))

  info = Array.new
  choice = yes_no

  if choice == 'y'
    prompt(messages('get_loan_name'))
    name = get_loan_name
    prompt("'#{name}' #{messages('loan_name')}")
    info.push(loan, apr, duration, payment)
    hash[name] = info
  else
    prompt(messages('main_menu'))
  end
end

def loan_calculator(loans_hash)
  loan_amount = get_loan_amount
  apr = get_apr
  duration = get_duration
  
  prompt(messages('calculating'))
  sleep(2)
  
  monthly_payment = calculate_payment(loan_amount, apr, duration)
  sleep(2)
  
  save?(loans_hash, loan_amount, apr, duration, monthly_payment)
  sleep(2)
end

def display_loans(hash)
  if hash.empty?
    prompt(messages('empty_hash'))
  else
    hash.each do |k,v|
      prompt("#{k.capitalize}:")
      prompt("Loan amount: #{v[0]}")
      prompt("APR: #{v[1]}")
      prompt("Duration: #{v[2]} months\n")
      prompt("Monthly payment: $#{v[3]}")
    end
  end
end


# Program Start

loop do
  system("clear") || system("cls")
  puts messages('welcome').center(50)

  option = get_choice
  case option
  when '1' then loan_calculator(loans_hash)
  when '2' then display_loans(loans_hash)
  when '4' then break
  end
end

  p loans_hash

