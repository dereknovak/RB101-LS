require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Methods

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def number?(num)
  num == num.to_i.to_s || num == num.to_f.to_s
end

def op_script(op)
  case op
  when '1' then messages('adding', LANGUAGE)
  when '2' then messages('subtracting', LANGUAGE)
  when '3' then messages('multiplying', LANGUAGE)
  when '4' then messages('dividing', LANGUAGE)
  end
end

# Block prompts

language_prompt = <<-LNG
Language:
  'en' => English
  'es' => Español
LNG

# Language selection

prompt(language_prompt)

loop do
  language = gets.chomp
  if language == 'en' || language == 'es'
    LANGUAGE = language
    break
  else
    prompt("Not a valid language / No es un idioma válido")
  end
end

# Start of program

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = gets.chomp

  name.empty? ? prompt(messages('valid_name', LANGUAGE)) : break
end

prompt("#{messages('hello', LANGUAGE)}, #{name.capitalize}.")

# Main loop

loop do
  number1 = ''
  loop do
    prompt(messages('first_number', LANGUAGE))
    number1 = gets.chomp

    number?(number1) ? break : prompt(messages('valid_number', LANGUAGE))
  end

  number2 = ''
  loop do
    prompt(messages('second_number', LANGUAGE))
    number2 = gets.chomp

    number?(number2) ? break : prompt(messages('valid_number', LANGUAGE))
  end

  operator_prompt = <<-MSG
#{(messages('which_operation', LANGUAGE))}
  1) #{messages('add',      LANGUAGE)}
  2) #{messages('subtract', LANGUAGE)}
  3) #{messages('multiply', LANGUAGE)}
  4) #{messages('divide',   LANGUAGE)}
MSG
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('valid_choice', LANGUAGE))
    end
  end

  prompt("#{op_script(operator)} #{messages('operating_numbers', LANGUAGE)}")

  result = case operator
           when '1' then number1.to_f + number2.to_f
           when '2' then number1.to_f - number2.to_f
           when '3' then number1.to_f * number2.to_f
           when '4' then number1.to_f / number2.to_f
           end

  result = result.to_i if result == result.to_i.to_f

  prompt("#{messages('result', LANGUAGE)} #{result}.")

  prompt(messages('repeat_loop', LANGUAGE))
  answer = gets.chomp
  break unless answer.downcase.start_with?(messages('yes_no', LANGUAGE))
end

prompt(messages('goodbye', LANGUAGE))
