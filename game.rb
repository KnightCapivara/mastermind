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
        puts "Digite quatro números (1 a 6) para adivinhar o código"
        loop do
            @guess = gets.chomp
            break if @guess.match(/[1-6][1-6][1-6][1-6]/) && @guess.length == 4
            puts "Seu palpite deve ter apenas 4 dígitos entre 1-6.".red
        end
        self.reveal(@guess.split(//))
        # puts "Descobra a lógica de comparação:"
        self.compare(@guess.split(//))
    end
    
    def compare (guess)
        temp_master = []
        @master_code.numbers.each { |num| temp_master << num }
        print " Pistas: "
        index = 0
        4.times do
          if temp_master[index] == guess[index]
            print " * ".bg_black.gray
            # print " * ".bg_black.gray
            print " * ".bg_gray.green
            print " "
            temp_master[index] = "X"
            guess[index]  = "X"
          end
          index += 1
        end
        i = 0
        4.times do
          if guess[i] != "X" && temp_master.include?(guess[i])
            print " ? ".bg_gray.red
            print " "
            delete = temp_master.find_index(guess[i])
            temp_master[delete] = "X"
            guess[i]  = "X"
          end
        i += 1
    end
    
    puts ""
        # puts "#{guess} é o novo palpite"
        # puts "#{temp_master} é o novo mestre temporário"
        # puts "#{@master_code.numbers} deve ser inalterado"
    end

    def reveal (array)
        array.each do | num |
            print "  #{num}  ".bg_blue if num == "1"
            print "  #{num}  ".bg_green if num == "2"
            print "  #{num}  ".bg_magenta if num == "3"
            # print "  #{num}  ".bg_gray.black.bold if num == "4"
            print "  #{num}  ".bg_cyan.black.bold if num == "4"
            print "  #{num}  ".bg_brown.black.bold if num == "5"
            print "  #{num}  ".bg_red.black.bold if num == "6"
            print " "
        end
        # puts ""
    end
    

    def play
        self.start
        self.show
        self.turn
    end

end

# metodo: instruções
# metodo: obtém suposições do código do usuário
# metodo: adivinhar o código do processo
# metodo: mostra código e pistas

# CODE:  3234
# guess: 2335
# Verifique os valores de índice que correspondem
# CODE:  32X4
# guess: 23X5
# Verifique para o mesmo número
# 2
# CODE:  3XX4
# guess: X3X5
# 3
# CODE:  XXX4
# guess: XXX5
# 5
# CODE:  XXX4
# guess: XXXX

# CODE:  1422
# guess: 2344
# Verifique os valores de índice que correspondem
# CODE:  1422
# guess: 2344
# Verifique para o mesmo número
# 2
# CODE:  14X2
# guess: X344
# 3
# CODE:  14X2
# guess: XX44
# 4
# CODE:  1XX2
# guess: XXX4
# 4
# CODE:  1XX2
# guess: XXXX