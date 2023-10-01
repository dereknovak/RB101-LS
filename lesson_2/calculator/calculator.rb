require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Methods

# Pulls international messages from calculator_messages.yml
def messages(message, lang='en')
  MESSAGES[lang][message]
end

# Prints program responses with '=>'
def prompt(message)
  puts "=> #{message}"
end

# Selects program language
def select_language
  language = ''
  loop do
    language = gets.chomp.downcase
    if language == 'en' || language == 'es'
      break
    else
      prompt("Not a valid language / No es un idioma válido")
    end
  end

  language
end

# Returns user's name
def user_name(language)
  name = ''
  loop do
    name = gets.chomp
    name.strip.empty? ? prompt(messages('valid_name', language)) : break
  end

  name.capitalize
end

# Validates number input
def integer?(input)
  /^-?\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def valid_number?(num)
  integer?(num) || float?(num)
end

# Confirms operation to user
def op_script(op)
  case op
  when '1' then messages('adding', LANGUAGE)
  when '2' then messages('subtracting', LANGUAGE)
  when '3' then messages('multiplying', LANGUAGE)
  when '4' then messages('dividing', LANGUAGE)
  end
end

# Returns user's number inputs
def prompt_user_number(message, language)
  number = ''
  loop do
    prompt(messages(message, language))
    number = gets.chomp

    valid_number?(number) ? break : prompt(messages('valid_number', language))
  end

  number.to_f
end

# Returns user's operator choice
def operator_choice(language)
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('valid_choice', language))
    end
  end

  operator
end

# Calculates solution using user's inputs
def calculate(num1, num2, operator, language)
  result = case operator
           when '1' then num1 + num2
           when '2' then num1 - num2
           when '3' then num1 * num2
           when '4'
             if num2 == 0
               return prompt(messages('no_zero', language))
             else
               num1 / num2
             end
           end

  result = result == result.to_i ? result.to_i : result
  prompt("#{messages('result', language)} #{result.round(2)}.")
end

# Heredoc

language_prompt = <<-LNG
Language:
  'en' => English
  'es' => Español
LNG

# Start of Program

system("clear") || system("cls")

# Language selection
prompt(language_prompt)
LANGUAGE = select_language

# Welcome and introduction
prompt(messages('welcome', LANGUAGE))
name = user_name(LANGUAGE)
prompt("#{messages('hello', LANGUAGE)}, #{name}.")

# Main loop
loop do
  # Get numbers
  number1 = prompt_user_number('first_number', LANGUAGE)
  number2 = prompt_user_number('second_number', LANGUAGE)

  # Get operation
  prompt(messages('which_operation', LANGUAGE))
  operator = operator_choice(LANGUAGE)

  # Calculate results
  prompt("#{op_script(operator)} #{messages('operating_numbers', LANGUAGE)}")
  sleep(2)
  calculate(number1, number2, operator, LANGUAGE)

  # Repeat program?
  prompt(messages('repeat_loop', LANGUAGE))
  answer = gets.chomp
  break unless answer.downcase.start_with?(messages('yes_no', LANGUAGE))
end

prompt(messages('goodbye', LANGUAGE))
