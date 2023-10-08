require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')
CHALLENGER_CHOICE = %w(rock paper scissors lizard spock)
CHOICE_SHORTHAND = %w(r p sc l sp)
VALID_CHOICES = %w(1 2 3)

# Methods

def prompt(message)
  puts "=> #{message}"
end

def print_message(message)
  puts MESSAGES[message]
end

def prompt_message(message)
  prompt(MESSAGES[message])
end

def press_enter
  prompt_message('enter')
  gets.chomp
end

def convert_shorthand(player_choice)
  case player_choice
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 'sc' then 'scissors'
  when 'l' then 'lizard'
  when 'sp' then 'spock'
  else player_choice
  end
end

# Get Methods

def get_choice
  choice = ''
  loop do
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      return choice
    else
      prompt_message('valid_choice')
    end
  end
end

def get_total_rounds
  loop do
    rounds = gets.chomp.to_f
    if rounds % 1 != 0
      prompt_message('valid_integer')
    elsif rounds.to_i.odd? && rounds > 0
      return rounds.to_i
    else
      prompt_message('odd_integer')
    end
  end
end

def get_challenger(computer_choice=nil)
  prompt_message('challenger?')

  loop do
    choice = gets.chomp.downcase
    if choice == 'cheat'
      prompt("The computer chose '#{computer_choice}'...")
    elsif CHALLENGER_CHOICE.include?(choice) ||
          CHOICE_SHORTHAND.include?(choice)
      choice = convert_shorthand(choice)
      return choice
    else
      prompt_message('valid_challenger')
    end
  end
end

def get_result(winning_moves, player_choice, computer_choice)
  if winning_moves[player_choice.to_sym].include?(computer_choice)
    'player'
  elsif player_choice == computer_choice
    'tie'
  else
    'computer'
  end
end

def get_champion(total_rounds, player_wins, computer_wins)
  return 'player' if player_wins > total_rounds / 2.0
  'computer' if computer_wins > total_rounds / 2.0
end

# Display Methods

def display_instructions
  system('clear') || system('cls')
  puts("INSTRUCTIONS\n".center(50))
  print_message('instructions')
  press_enter
end

def display_round(round, total_rounds, player_wins, computer_wins)
  puts(("ROUND #{round}").center(50))
  puts(("Player: #{player_wins} | Computer: #{computer_wins}").center(50))
  puts(("Best of #{total_rounds}\n").center(50))
end

def display_choices(player_choice, computer_choice)
  prompt("Player chose: '#{player_choice}'")
  print "=> Computer chose:... "
  sleep(2)
  puts "'#{computer_choice}'\n\n"
  sleep(1)
end

def display_result(result)
  case result
  when 'player'   then MESSAGES['player_win'].center(50)
  when 'computer' then MESSAGES['computer_win'].center(50)
  when 'tie'      then MESSAGES['tie'].center(50)
  end
end

def display_champion(champion, total_rounds, player_wins, computer_wins)
  system('clear') || system('cls')

  puts(("RESULTS".center(50)))
  puts(("Player: #{player_wins} | Computer: #{computer_wins}").center(50))
  puts(("Best of #{total_rounds}\n").center(50))

  case champion
  when 'player'   then prompt_message('player_champion')
  when 'computer' then prompt_message('computer_champion')
  end
end

# Main Game Method

def play_game(winning_moves)
  prompt_message('rounds?')

  total_rounds = get_total_rounds
  round = 0
  result = ''
  player_wins = 0
  computer_wins = 0
  champion = ''

  loop do
    system('clear') || system('cls')

    round += 1 unless result == 'tie'
    display_round(round, total_rounds, player_wins, computer_wins)

    computer_choice = CHALLENGER_CHOICE.sample
    player_choice = get_challenger(computer_choice)
    display_choices(player_choice, computer_choice)

    result = get_result(winning_moves, player_choice, computer_choice)
    puts(display_result(result))
    case result
    when 'player' then player_wins += 1
    when 'computer' then computer_wins += 1
    end
    press_enter

    champion = get_champion(total_rounds, player_wins, computer_wins)
    break if !champion.nil?
  end

  display_champion(champion, total_rounds, player_wins, computer_wins)
  press_enter
end

# PROGRAM START

winning_moves = { rock: %w(scissors lizard),
                  paper: %w(rock spock),
                  scissors: %w(paper lizard),
                  lizard: %w(paper spock),
                  spock: %w(rock scissors) }

loop do
  system('clear') || system('cls')
  print_message('welcome')
  print_message('directory')

  choice = get_choice
  case choice
  when '1' then play_game(winning_moves)
  when '2' then display_instructions
  when '3' then break
  end
end

prompt_message('goodbye')
