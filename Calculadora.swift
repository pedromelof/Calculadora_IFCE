import Foundation  // Biblioteca do Swift para facilitar algumas funcionalidades

var novaOperacao = "S" // Nova operação começa como sim, indicando que o usuário quer fazer uma nova operação
var nomeOperacao = "" // Nome da operação que o usuário escolheu, iniciando em vazio, já que não escolheu nada ainda
var resultado: Double = 0 //  Resultado da operação, iniciando em 0 pois não foi feita nenhuma operação, portanto não há resultado
var num1: Double = 0 // Número 1 que o usuário irá fornecer
var num2: Double = 0 // Número 2 que o usuário irá fornecer

func solicitarNumero(_ mensagem: String) -> Double { // Função para modelar a mensagem exibida na solicitação de um valor de acordo com a operação que foi solicitada
    print(mensagem) // Printa a mensagem escolhida
    return Double(readLine() ?? "0") ?? 0 // Retorna um valor Double(com casas decimais) que foi digitado pelo usuário
}

while novaOperacao != "N" { // Estrutura de repetição, que ficará em loop até o usuário digitar "N" quando lhe for perguntado se ele quer realizar uma nova operação ou não 
    print("Qual operação você deseja realizar? A) ADIÇÃO S) SUBTRAÇÃO M) MULTIPLICAÇÃO D) DIVISÃO P) POTÊNCIA R) RAIZ") // Mensagem perguntando qual operação o usuário quer fazer dentre as opções existentes
    guard let operacao = readLine()?.uppercased() else { continue } // Caixa de texto para que o usuário possa digitar a letra referente a operação que ele quer realizar, o guard antes do let serve para certificar de que o valor dessa variável não será nulo antes de continuar a execução
    // O "?" logo em seguida do readLine serve para verificar se o valor é "nil", 
    //ou seja, nulo em Swift, caso ele for, o valor não será atribuido a variável 
    //e o programa não irá executar o resto das instruções, caso ele seja um valor, 
    //o programa irá passar para a próxima instrução que é o uppercase, que vai deixar o 
    //texto digitado em letras maísculas
    switch operacao { // Estrutura de verificação de casos, que trata resultados para determinados valores que a variável operacao receber
    case "A": // Caso 1, aonde operacao recebe "A"
        num1 = solicitarNumero("Digite o primeiro número que quer somar:") // Solicita o primeiro número, utilizando-se da função solicitarNumero criada no início do código
        num2 = solicitarNumero("Digite o segundo número que quer somar:") // Solicita o segundo número, utilizando-se da função solicitarNumero criada no início do código
        resultado = num1 + num2 // Faz o cálculo da soma do número 1 mais o número 2 e armazena na variável resultado
        nomeOperacao = "adição" // Armazena na variável nomeOperacao o nome da operação executada, que foi de soma
        
    case "S": // Caso 2, aonde operacao recebe "S"
        num1 = solicitarNumero("Digite o primeiro número da subtração (primeiro número - segundo número):")
        num2 = solicitarNumero("Digite o segundo número da subtração:")
        resultado = num1 - num2 // Faz o cálculo da subtração do número 1 mais o número 2 e armazena na variável resultado
        nomeOperacao = "subtração"
        
    case "M": // Caso 3, aonde operacao recebe "M"
        num1 = solicitarNumero("Digite o primeiro número da multiplicação:")
        num2 = solicitarNumero("Digite o segundo número da multiplicação:")
        resultado = num1 * num2 // Faz o cálculo da multiplicação do número 1 mais o número 2 e armazena na variável resultado
        nomeOperacao = "multiplicação"
        
    case "D": // Caso 4, aonde operacao recebe "D"
        num1 = solicitarNumero("Digite o primeiro número da divisão (primeiro número dividido pelo segundo número):")
        num2 = solicitarNumero("Digite o segundo número da divisão:")
        if num2 == 0 { // Verifica se o divisor não é zero, pois caso ele seja, a divisão não será possível de ser feita
            print("Erro: Divisão por zero não é permitida.")
        }
        resultado = num1 / num2 // Faz o cálculo da divisão do número 1 mais o número 2 e armazena na variável resultado
        nomeOperacao = "divisão"
        
    case "P": // Caso 5, aonde operacao recebe "P"
        num1 = solicitarNumero("Digite o número da base da potência:")
        num2 = solicitarNumero("Digite o número do expoente da potência:")
        resultado = pow(num1, num2) // Faz o cálculo da potenciação do número 1 elevado ao número 2 e armazena na variável resultado
        nomeOperacao = "potenciação"
        
    case "R": // Caso 6, aonde operacao recebe "R"
        num1 = solicitarNumero("Digite o número do radicando:")
        num2 = solicitarNumero("Digite o número do índice da raiz:")
        if num2 == 0 { // Verifica se o divisor não é zero, pois caso ele seja, a raiz não será possível de ser feita
            print("Erro: Raiz de índice zero não é permitida.")
        }
        resultado = pow(num1, 1 / num2) // Faz o cálculo da raíz do número 1 de índice número 2 utilizando-se novamente da função de potência do Swift, utilizando-se de um princípio matemático para calcular raízes de qualquer índice através do método de potência e armazena na variável resultado
        nomeOperacao = "raiz"
        
    default: // Caso padrão, esse caso será executado caso nenhum dos "cases" aconteçam, ou seja, se o usuário digitar uma letra ou caracter que não pertence às opções de operação
        print("Operação inválida, tente novamente.")
    }

    print("O resultado da sua operação de \(nomeOperacao) de \(num1) e \(num2) foi: \(resultado)") // Printa na tela o resultado, os números utilizados e o nome da operação que foi feita
    
    print("Você deseja realizar uma nova operação? - S) SIM N) NÃO") // Mensagem de pergunta ao usuário se ele deseja fazer uma nova operação
    novaOperacao = readLine()?.uppercased() ?? "N" // Caixa de texto para que o usuário possa digitar a letra referente ao que ele quer realizar
    // O "?" logo em seguida do readLine serve para verificar se o valor é "nil", 
    //ou seja, nulo em Swift, caso ele for, o valor não será atribuido a variável 
    //e o programa não irá executar o resto das instruções, caso ele seja um valor, 
    //o programa irá passar para a próxima instrução que é o uppercase, que vai deixar o 
    //texto digitado em letras maísculas
}
