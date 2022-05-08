class Game

    def start
      puts ""
      puts "Vamos jogar MASTERMIND"
      @master_code = Code.new
      @options = ["1", "2", "3", "4", "5", "6"]
      puts "Este jogo é jogado com as seguintes combinações de números/cores:"
      self.reveal(@options)
      puts ""
      puts ""
      puts "O computador escolherá aleatoriamente 4 numeros para criar um código, para você decifrar. Por exemplo,"
      self.reveal(["5", "6", "2", "4"])
      puts ""
      puts ""
      puts "Pode haver mais de um com o mesmo número/cor. Por exemplo,".red
      self.reveal(["2", "1", "3", "2"])
      puts ""
      puts ""
      puts "O computador pode lhe dar uma pista para ajudá-lo a resolver para cada, UM DE CADA!!!"
      print " * ".bg_gray.green
      print " "
      puts "Esta pista significa que você tem 1 número correto no local correto."
      puts ""
      print " ? ".bg_gray.red
      print " "
      puts "Essa pista significa que você tem 1 número correto, mas está no local errado."
      puts ""
    end
  
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
      index = 0
      4.times do
        if temp_master[index] == guess[index]
          print " * ".bg_gray.green
          print " "
          temp_master[index] = "*"
          guess[index]  = "*"
        end
        index += 1
      end
      i = 0
      4.times do
        if guess[i] != "*" && temp_master.include?(guess[i])
          print " ? ".bg_gray.red
          print " "
          delete = temp_master.find_index(guess[i])
          temp_master[delete] = "?"
          guess[i]  = "?"
        end
        i += 1
      end
      puts ""
        # puts "#{guess} é o novo palpite"
        # puts "#{temp_master} é o novo mestre temporário"
        # puts "#{@master_code.numbers} deve ser inalterado"
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
      self.start
      self.show
      self.turn
    end

end


  # method: instruções