class Display

    def initialize(name)
      @name = name
    end
  
    def color_code (number)
      @code_backgrounds = {
        "1" => "\e[44m  1  \e[0m",
        "2" => "\e[42m  2  \e[0m",
        "3" => "\e[45m  3  \e[0m",
        "4" => "\e[30;1m\e[46m  4  \e[0m",
        "5" => "\e[30;1m\e[43m  5  \e[0m",
        "6" => "\e[30;1m\e[41m  6  \e[0m"
      }
      @code_backgrounds[number]
  
    end

  
    def color_clue (item)
      @clue_backgrounds = {
        "*" => "\e[32;1m\e[47m * \e[0m",
        "?" => "\e[31m\e[47m ? \e[0m",
      }
      @clue_backgrounds[item]
  
    end
  
    def formatting (description, string)
      @text_formatting = {
        "underline" => "\e[4;1m#{string}\e[0m",
        "red" => "\e[31;1m#{string}\e[0m",
      }
      @text_formatting[description]
  
    end
  
    def instructions

      @instructions_text = <<~HEREDOC
      #{formatting("underline", "Como jogar Mastermind::")}

      Este é um jogo de 1 jogador contra o computador. 
      Você pode optar por ser o código #{formatting("underline", "maker")} ou o código #{formatting("underline", "breaker")}.
      Existem seis combinações de número/cor diferentes:
      
      #{color_code("1")} #{color_code("2")} #{color_code("3")} #{color_code("4")} #{color_code("5")} #{color_code("6")}
      
      
      O criador de código escolherá quatro para criar um 'código mestre'. Por exemplo,
      
      #{color_code("1")} #{color_code("3")} #{color_code("4")} #{color_code("1")}
      
      Como você pode ver, pode haver #{formatting("red", "mais de um")} com o mesmo número/cor.
      Para ganhar, o decifrador de código precisa adivinhar o 'código mestre' em 12 ou menos turnos.
      
      #{formatting("underline", "Pistas:")}
      Depois de cada palpite, você receberá até quatro pistas para ajudá-lo a decifrar o código.
      
      #{color_clue("*")} Esta dica significa que você tem 1 número correto no local correto.
      
      #{color_clue("?")} Essa dica significa que você tem 1 número correto, mas no local errado.
      
      
      #{formatting("underline", "Exemplo de dica:")}
      Para continuar o exemplo, usando o 'código mestre' acima, um palpite de "1463" produziria 3 pistas:
      
      #{color_code("1")} #{color_code("4")} #{color_code("6")} #{color_code("3")}  Pistas: #{color_clue("*")} #{color_clue("?")} #{color_clue("?")}
      
      
      O palpite tinha 1 número correto no local correto e 2 números corretos no local errado.
      
      #{formatting("underline", "É hora de jogar!")}
      Você gostaria de ser o Criador ou o Codificador?

      Pressione '1' para ser o código MAKER/Criador
      Pressione '2' para ser o código BREAKER/Codificador
      
      HEREDOC
      @instructions_text
    end
  
    def content (number = nil, item)
      @prompts = {
        "turn_prompt" => "Turno ##{number}: Digite quatro números (1-6) para adivinhar o código ou 'q' para sair do jogo.",
        "last_turn" => "#{formatting("red", "Escolha com cuidado. Essa é a sua última chance de ganhar!")}",
        "turn_error" => "#{formatting("red", "Seu palpite deve ter apenas 4 dígitos entre 1-6.")}",
        "clues" => "  Pistas: ",
        "won" => "  Você quebrou o código! Parabéns, você venceu! \n\n",
        "lost" => "#{formatting("red", "Game over. ¯\\_(ツ)_/¯ ")} \n\n",
        "reveal_code" => "Aqui está o 'código mestre' que você estava tentando decifrar:"
      }
      @prompts[item]
    end
  
  end