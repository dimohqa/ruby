require './valera'
require './output_module'
require './output_save'

class Game
  include Output

  def enter_action(valera, action)
    case action
    when 1
      valera.work
    when 2
      valera.nature
    when 3
      valera.alcohol_action('vine_serial')
    when 4
      valera.alcohol_action('bar')
    when 5
      valera.alcohol_action('drink')
    when 6
      valera.song
    when 7
      valera.sleep
    end
  end

  def select_regulation
    number_action = 0
    print_regulations
    loop do
      number_action = gets.to_i
      break if number_action.positive? && number_action < 10

      print_choose_number
    end
    number_action
  end

  def start(valera, save_name)
    loop do
      print_stats(valera.state)
      action = select_regulation
      enter_action(valera, action)
      OutputSave.save(valera.stat, save_name)
      break if action == 9
    end
  end
end
