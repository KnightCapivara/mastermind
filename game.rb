require './intro'

class Game
  include Intro
  
    def show
      puts "CÓDIGO MASTER REVELADO TEMPORARIAMENTE:"
      self.reveal(@master_code.numbers)
      puts ""
    end 
  
    def turn
      turn = 1
      12.times do
        puts "Turno ##{turn}: Digite quatro números (1-6) para adivinhar o código"
        puts "Pense com cuidado. Este é o seu último turno para ganhar!".red if turn == 12
        turn += 1
        loop do
          @guess = gets.chomp
          break if @guess.match(/[1-6][1-6][1-6][1-6]/) && @guess.length == 4
          puts "Seu palpite deve ser de apenas 4 dígitos entre 1-6.".red
        end
        self.reveal(@guess.split(//))
        break if solved?(@master_code.numbers, @guess.split(//))
        self.compare(@guess.split(//))
      end
      if solved?(@master_code.numbers, @guess.split(//))
        puts "  Você desbloqueou o código! Parabéns, você venceu!"
      else
        puts "Game over. Você ficou sem turnos. ¯\\_(ツ)_/¯ ".red
        puts "Aqui está o código que você estava tentando decifrar:"
        self.reveal(@master_code.numbers)
        puts ""
      end
    end
  
    def compare (guess)
      temp_master = []
      @master_code.numbers.each { |num| temp_master << num }
      print "  Clues: "
      self.exact_matches(temp_master, guess)
      self.right_numbers(temp_master, guess)
      puts ""
    end

    def exact_matches(master, guess)
      index = 0
      4.times do
        if master[index] == guess[index]
          print " * ".bg_gray.green
          print " "
          master[index] = "*"
          guess[index]  = "*"
        end
        index += 1
      end
    end

    def right_numbers(master, guess)
      i = 0
      4.times do
        if guess[i] != "*" && master.include?(guess[i])
          print " ? ".bg_gray.red
          print " "
          delete = master.find_index(guess[i])
          master[delete] = "?"
          guess[i]  = "?"
        end
        i += 1
      end
    end

    def solved? (master, guess)
      game_over = false
      if master[0] == guess[0] && master[1] == guess[1] && master[2] == guess[2] && master[3] == guess[3]
        game_over = true
      end
      game_over
    end

    def reveal (array)
      array.each do | num |
        print "  #{num}  ".bg_blue if num == "1"
        print "  #{num}  ".bg_green if num == "2"
        print "  #{num}  ".bg_magenta if num == "3"
        print "  #{num}  ".bg_cyan.black.bold if num == "4"
        print "  #{num}  ".bg_brown.black.bold if num == "5"
        print "  #{num}  ".bg_red.black.bold if num == "6"
        print " "
      end
    end

    def play
      self.instructions
      @master_code = Code.new
      # Revelação temporária do código mestre, para solucionar pistas
      self.show
      self.turn
    end

end



# Coloque game.show na classe CODE
# Coloque a lógica de 12 turnos no método de jogo
# Limpar código para resolvido?
# Remova a lógica do jogo final do turno