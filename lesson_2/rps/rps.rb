require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')
VALID_CHOICES = %w(rock paper scissors lizard spock)

winning_moves = { rock:     %w(scissors lizard),
                  paper:    %w(rock spock),
                  scissors: %w(paper lizard),
                  lizard:   %w(paper spock),
                  spock:    %w(rock scissors)
                }

def prompt(message)
  puts "=> #{message}"
end

def display_message(message)
  puts MESSAGES[message]
end

def print_message(message)
  print "=> #{message}"
end

def prompt_message(message)
  prompt(MESSAGES[message])
end

def get_yes_no
  decision = ''
  loop do
    decision = gets.chomp.downcase
    return 'y' if decision.start_with?('y')
    return 'n' if decision.start_with?('n')
    prompt_message('yes_or_no')
  end
end

def get_rounds
  loop do
    rounds = gets.chomp.to_i
    if rounds.odd? && rounds > 0
      return rounds
    else
      prompt_message('odd_integer')
    end
  end
end

def get_challenger
  loop do
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      return choice
    else
      prompt_message('valid_choice')
    end
  end
end

def print_win?(win_hash, player_choice, computer_choice)
  if win_hash[player_choice.to_sym].include?(computer_choice)
    prompt('Player wins!')
  elsif player_choice == computer_choice
    prompt("It's a tie!")
  else
    prompt('Computer wins!')
  end
end



# PROGRAM START

system('clear') || system('cls')
display_message('welcome')
prompt_message('instructions?')
decision = get_yes_no
display_message('instructions') if decision == 'y'



prompt_message('rounds?')
total_rounds = get_rounds
round = 0

loop do
  system('clear') || system('cls')
  round += 1

  prompt("ROUND #{round}\n\n")
  computer_choice = VALID_CHOICES.sample
  prompt_message('challenger?')
  player_choice = get_challenger
 
  print_message("Player chose: '#{player_choice}'. Computer chose... ")
  sleep(2)
  puts "'#{computer_choice}'\n"
  
  print_win?(winning_moves, player_choice, computer_choice)
  input = gets.chomp
  break if round == total_rounds
end