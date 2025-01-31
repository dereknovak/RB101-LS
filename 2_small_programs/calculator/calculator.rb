require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Heredoc

language_prompt = <<-LNG
Language:
  'en' => English
  'es' => Español
LNG

# Methods

# Pulls international messages from calculator_messages.yml
def messages(message, lang='en')
  MESSAGES[lang][message]
end

# Prints program responses with '=>'
def prompt(message)
  puts "=> #{message}"
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
def display_opt(operation)
  case operation
  when '1' then messages('adding', LANG)
  when '2' then messages('subtracting', LANG)
  when '3' then messages('multiplying', LANG)
  when '4' then messages('dividing', LANG)
  end
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

# Selects program language
def get_language(language_prompt)
  prompt(language_prompt)

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
def get_name(language)
  name = ''
  loop do
    name = gets.chomp
    name.strip.empty? ? prompt(messages('valid_name', language)) : break
  end

  name = name.capitalize
  prompt("#{messages('hello', LANG)}, #{name}.")
  name
end

# Returns user's number inputs
def get_number(message, language)
  number = ''
  loop do
    prompt(messages(message, language))
    number = gets.chomp

    valid_number?(number) ? break : prompt(messages('valid_number', language))
  end

  number.to_f
end

# Returns user's operator choice
def get_operator(language)
  prompt(messages('which_operation', LANG))

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

# Main program method
def calculator
  loop do
    number1 = get_number('first_number', LANG)
    number2 = get_number('second_number', LANG)

    operator = get_operator(LANG)

    prompt("#{display_opt(operator)} #{messages('operating_numbers', LANG)}")
    calculate(number1, number2, operator, LANG)

    prompt(messages('repeat_loop', LANG))
    answer = gets.chomp
    break unless answer.downcase.start_with?(messages('yes_no', LANG))
  end
end

# Start of Program

system("clear") || system("cls")
LANG = get_language(language_prompt)
prompt(messages('welcome', LANG))
name = get_name(LANG)
calculator
prompt("#{messages('goodbye1', LANG)}, #{name}, #{messages('goodbye2', LANG)}")
