module Intro

    def instructions
      puts ""
      puts "Como jogar Mastermind:".underline
      puts "Existem seis combinações de número/cor diferentes:"
      puts ""
      self.reveal(["1", "2", "3", "4", "5", "6"])
      puts ""
      puts ""
      puts ""
      puts "O computador escolherá aleatoriamente quatro numeros para criar um 'código mestre' para você quebrar. Por exemplo,"
      puts ""
      self.reveal(["1", "3", "4", "1"])
      puts ""
      puts ""
      puts ""
      puts "Como você pode ver, pode haver mais de um com o mesmo número/cor.".red
      puts "Para ganhar, você deve adivinhar o 'código mestre' em 12 ou menos turnos."
      puts ""
      puts "Pistas:".underline
      puts "Depois de cada palpite, você receberá até quatro pistas para ajudá-lo a decifrar o código."
      puts ""
      print " * ".bg_gray.green
      print " "
      puts "Esta dica significa que você tem 1 número correto no local correto."
      puts ""
      print " ? ".bg_gray.red
      print " "
      puts "Essa dica significa que você tem 1 número correto, mas no local errado."
      puts ""
      puts ""
      puts "Exemplo de dica:".underline
      puts ""
      puts "Para continuar o exemplo, usando o 'código mestre' acima, um palpite de"
      puts ""
      self.reveal(["1", "2", "3", "4"])
      print " iria produzir 3 pistas: "
      print " * ".bg_gray.green
      print " "
      print " ? ".bg_gray.red
      print " "
      print " ? ".bg_gray.red
      puts ""
      puts ""
      puts ""
      puts "O palpite tinha 1 número correto no local correto e 2 números corretos no local errado."
      puts ""
      puts "Agora é hora de jogar. O 'código mestre' foi definido e está na hora de você adivinhar."
      puts ""
      puts ""
    end
end