require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')
loans_hash = Hash.new
CHOICES = %w(1 2 3 4)

# Methods

def prompt(message)
  puts "=> #{message}"
end

def prompt_message(message)
  prompt(MESSAGES[message])
end

def press_enter
  prompt_message('continue')
  gets.chomp
end

def calculate_payment(loan, apr, duration)
  if apr == 0
    payment = loan / duration
  else
    payment = loan * (apr / (1 - ((1 + apr)**(-duration))))
  end

  payment = format("%.2f", payment)
  prompt("Your monthly payment will be $#{payment}.")
  payment
end

def save?(hash, loan, apr, duration, payment)
  prompt_message('save')

  choice = get_yes_no

  if choice == 'y'
    get_loan_name(hash, loan, apr, duration, payment)
  else
    prompt_message('no_save')
  end
end

def delete_key(hash)
  loop do
    choice = gets.chomp.downcase

    if hash.include?(choice)
      hash.delete(choice)
      prompt("'#{choice.capitalize}' has been deleted.\n\n")
      break
    elsif choice == 'q'
      return choice
    else
      prompt("'#{choice.capitalize}' is not a saved loan.")
    end
  end
end

def display_format(k, v)
  v[0] = format("%.2f", v[0])

  prompt("Name: #{k.capitalize}")
  prompt("Loan amount: $#{v[0]}")
  prompt("APR: #{(v[1] * 100 * 12).round(2)}%")
  prompt("Duration: #{v[2]} months")
  prompt("Monthly payment: $#{v[3]}\n\n")
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

# Get methods

def get_yes_no
  choice = ''
  loop do
    choice = gets.chomp.downcase

    if choice.start_with?('y')
      return 'y'
    elsif choice.start_with?('n')
      return 'n'
    else
      prompt_message('valid_response')
    end
  end
end

def get_choice
  prompt_message('directory')

  choice = ''
  loop do
    choice = gets.chomp
    return choice if CHOICES.include?(choice)
    prompt_message('valid_choice')
  end

  choice
end

def get_loan_name(hash, loan, apr, duration, payment)
  prompt_message('get_loan_name')

  loop do
    info = Array.new
    name = gets.chomp.downcase

    if hash.include?(name)
      prompt("'#{name.capitalize}' is already taken.\n")
    elsif valid_name?(name)
      prompt("'#{name.capitalize}' has been added to your saved loans.\n\n")
      info.push(loan, apr, duration, payment)
      hash[name] = info
      break
    else
      prompt_message('valid_name')
    end
  end
end

def get_loan_amount
  prompt_message('loan_amount')

  num = ''
  loop do
    num = gets.chomp

    if num.to_i <= 0
      prompt_message('positive_num')
    elsif valid_number?(num)
      return num.to_f
    else
      prompt_message('valid_num')
    end
  end
end

def get_apr
  prompt_message('apr')

  num = ''
  loop do
    num = gets.chomp

    if num.to_i < 0
      prompt_message('positive_num')
    elsif valid_number?(num)
      num = num.to_f / 100 / 12
      return num
    else
      prompt_message('valid_num')
    end
  end
end

def get_duration
  prompt_message('duration')

  num = ''
  loop do
    num = gets.chomp

    if num.to_i <= 0
      prompt_message('positive_num')
    elsif integer?(num)
      return num.to_i
    else
      prompt_message('valid_int')
    end
  end
end

# Main methods

def loan_calculator(loans_hash)
  loan_amount = get_loan_amount
  apr = get_apr
  duration = get_duration

  prompt_message('calculating')
  sleep(2)

  monthly_payment = calculate_payment(loan_amount, apr, duration)
  sleep(2)

  save?(loans_hash, loan_amount, apr, duration, monthly_payment)
  press_enter
end

def display_loans(hash)
  if hash.empty?
    prompt_message('empty_hash')
  else
    puts "Saved Loans\n\n".center(50)
    hash.each do |k, v|
      display_format(k, v)
    end
  end

  press_enter
end

def delete_loan(hash)
  if hash.empty?
    prompt_message('empty_hash')
  else
    prompt_message('delete?')
    hash.each_key { |k| prompt("'#{k.capitalize}'?") }
    choice = delete_key(hash)
  end

  return if choice == 'q'
  press_enter
end

# Program Start

loop do
  system("clear") || system("cls")
  puts "Welcome to the Mortgage Calculator!\n".center(50)

  option = get_choice
  case option
  when '1' then loan_calculator(loans_hash)
  when '2' then display_loans(loans_hash)
  when '3' then delete_loan(loans_hash)
  when '4' then break
  end
end

prompt_message('goodbye')
