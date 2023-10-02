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

def calculate_payment(loan, apr, duration)
  if apr == 0
    payment = loan / duration
  else
    payment = loan * (apr / (1 - (1 + apr)**(-duration)))
  end

  payment = "%.2f" % payment
  prompt(messages('payment_script') + payment + '.')
  payment
end

# Validation methods

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

# Input methods

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

def press_enter
  sleep(1.5)
  prompt(messages('continue'))
  input = gets.chomp
end

# Get methods

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
  prompt(messages('get_loan_name'))

  loan_name = ''
  loop do
    loan_name = gets.chomp.downcase
    
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
    
    if num.to_i <= 0
      prompt(messages('positive_num'))
    elsif valid_number?(num)
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
    
    if num.to_i < 0
      prompt(messages('positive_num'))
    elsif valid_number?(num)
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
    
    if num.to_i <= 0
      prompt(messages('positive_num'))
    elsif integer?(num)
      return num.to_i
    else
      prompt(messages('valid_int'))
    end
  end
end

def save?(hash, loan, apr, duration, payment)
  prompt(messages('save'))

  info = Array.new
  choice = yes_no

  if choice == 'y'    
    name = get_loan_name
    prompt("'#{name.capitalize}' #{messages('loan_name')}")
    info.push(loan, apr, duration, payment)
    hash[name] = info
  else
    prompt(messages('no_save'))
  end
end

# Main methods

def loan_calculator(loans_hash)
  loan_amount = get_loan_amount
  apr = get_apr
  duration = get_duration
  
  prompt(messages('calculating'))
  sleep(2)
  
  monthly_payment = calculate_payment(loan_amount, apr, duration)
  sleep(2)
  
  save?(loans_hash, loan_amount, apr, duration, monthly_payment)
  press_enter
end

def display_loans(hash)
  if hash.empty?
    prompt(messages('empty_hash'))
  else
    puts messages('saved_loans').center(50)
    hash.each do |k,v|
      v[0] = "%.2f" % v[0]
      prompt("Name: #{k.capitalize}")
      prompt("Loan amount: $#{v[0]}")
      prompt("APR: #{(v[1] * 100 * 12).round(2)}%")
      prompt("Duration: #{v[2]} months")
      prompt("Monthly payment: $#{v[3]}\n\n")
    end
  end
  
  press_enter
end

def delete_loan(hash)
  if hash.empty?
    prompt(messages('empty_hash'))
  else
    prompt(messages('delete?'))
    hash.each_key { |k| prompt("'#{k.capitalize}'?") }

    choice = ''
    loop do
      choice = gets.chomp.downcase
      
      if hash.include?(choice)
        hash.delete(choice)
        prompt("'#{choice.capitalize}' #{messages('deleted')}")
        break
      elsif choice == 'q'
        break
      else
        prompt("'#{choice.capitalize}' #{messages('no_key')}")
      end
    end
  end

  return if choice == 'q'
  press_enter
end

# Program Start

loop do
  system("clear") || system("cls")
  puts messages('welcome').center(50)

  option = get_choice
  case option
  when '1' then loan_calculator(loans_hash)
  when '2' then display_loans(loans_hash)
  when '3' then delete_loan(loans_hash)
  when '4' then break
  end
end

prompt(messages('goodbye'))
