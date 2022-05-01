class Game

    def start
        puts "Vamos começar a jogar Mastermind"
        @master_code = Code.new
        @options = ["1", "2", "3", "4", "5", "6"]
        puts "O computador irá escolher 4 cores/números aleatórios para fazer um código"
        self.reveal(@options)
    end

    def show
        puts "CÓDIGO MASTER REVELADO TEMPORARIAMENTE:"
        self.reveal(@master_code.numbers)
    end

    def turn
        puts "Digite quatro números (1 a 6) para adivinhar o código"

    loop do
        @guess = gets.chomp
        break if @guess.match(/[1-6][1-6][1-6][1-6]/) && @guess.length == 4
        puts "Seu palpite deve ter apenas 4 dígitos entre 1-6.".red
        end
        self.reveal(@guess.split(//))
        puts "Descobra a lógica de comparação:"
        self.compare(@guess.split(//))
    end
    
    def compare (guess)
        guess.each do |num|
        print " ? ".reverse_color if @master_code.numbers.include?(num)
        print " " if @master_code.numbers.include?(num)
        end
        puts ""
        # puts "Game Clues:"
        # print " * ".bg_black.gray
        # print " Correct Color & Correct Spot"
        # puts ""
        # print " ? ".reverse_color
        # print " Correct Color"
        # puts ""
    end
    
    def reveal (array)
        array.each do | num |
            print "  #{num}  ".bg_red.bold if num == 1 || num == "1"
            print "  #{num}  ".bg_green.bold if num == 2 || num == "2"
            print "  #{num}  ".bg_blue.bold if num == 3 || num == "3"
            print "  #{num}  ".bg_magenta.bold if num == 4 || num == "4"
            print "  #{num}  ".bg_cyan.bold if num == 5 || num == "5"
            print "  #{num}  ".bg_gray.bold if num == 6 || num == "6"
            print " "
        end
        puts ""
    end
    

    def play
        self.start
        self.show
        self.turn
    end
end

# método: instruções
# método: obtém suposições do código do usuário
# método: adivinhar o código do processo
# método: mostra código e pistas