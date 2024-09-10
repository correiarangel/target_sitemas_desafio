// Desafio 3

void main(List<String> arguments) {
 // Exemplo de vetor de faturamento diário (0 representa dias sem faturamento)
List<double> faturamentoDiario = [
    100.0, 200.0,0.0, 300.0, 0.0, 0.0,434.0,500.0, 3450.0, 0.0, 740.0, 823.0
 ]; // Um exemplo com 12 dias

  calcularFaturamento(faturamentoDiario);
}

void calcularFaturamento(List<double> faturamento) {
  double menorFaturamento = double.infinity;
  double maiorFaturamento = double.negativeInfinity;
  double somaFaturamento = 0.0;
  int diasComFaturamento = 0;

  // Iterar sobre o vetor de faturamento diário
  for (double valor in faturamento) {
    // Ignorar dias sem faturamento
    if (valor > 0) {
      // Atualiza o menor e o maior valor de faturamento
      if (valor < menorFaturamento) {
        menorFaturamento = valor;
      }
      if (valor > maiorFaturamento) {
        maiorFaturamento = valor;
      }

      // Soma para calcular a média
      somaFaturamento += valor;
      diasComFaturamento++;
    }
  }

  // Calcular a média anual (considerando apenas dias com faturamento)
  double mediaAnual = calcMediaAnual(somaFaturamento, diasComFaturamento);

  // Contar os dias em que o faturamento foi superior à média
  int diasAcimaDaMedia = 0;
  for (double valor in faturamento) {
    if (valor > mediaAnual) {
      diasAcimaDaMedia++;
    }
  }

  printResult(menorFaturamento, maiorFaturamento, diasAcimaDaMedia);
}

double calcMediaAnual(double somaFaturamento, int diasComFaturamento) {
  return somaFaturamento / diasComFaturamento;
}

void printResult(
    double menorFaturamento, double maiorFaturamento, int diasAcimaDaMedia) {
  // Exibir os resultados
  print(
      'Menor valor de faturamento: R\$${menorFaturamento.toStringAsFixed(2)}');
  print(
      'Maior valor de faturamento: R\$${maiorFaturamento.toStringAsFixed(2)}');
  print('Número de dias com faturamento superior à média: $diasAcimaDaMedia');
}
