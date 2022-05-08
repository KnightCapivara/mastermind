class Game
    def start
      puts "Vamos começar a jogar Mastermind"
      @master_code = Code.new
      @options = ["1", "2", "3", "4", "5", "6"]
      puts "O computador irá escolher 4 cores/números aleatórios para fazer um código"
      self.reveal(@options)
      puts ""
    end
    def show
      puts "CÓDIGO MASTER REVELADO TEMPORARIAMENTE:"
      self.reveal(@master_code.numbers)
      puts ""
    end 
  
    def turn
      loop do
        puts "Digite quatro números (1 a 6) para adivinhar o código"
        loop do
          @guess = gets.chomp
          break if @guess.match(/[1-6][1-6][1-6][1-6]/) && @guess.length == 4
          puts "Seu palpite deve ter apenas 4 dígitos entre 1-6.".red
        end
        self.reveal(@guess.split(//))
        break if solved?(@master_code.numbers, @guess.split(//))
        self.compare(@guess.split(//))
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
        puts "  Solução correta! Game Over!!!"
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
  
  # metodo: instruções