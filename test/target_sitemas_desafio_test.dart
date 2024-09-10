
import 'package:test/test.dart';

import '../bin/target_sitemas_desafio.dart';


void main() {
  group('Testes para cálculo de faturamento', () {
    test('Deve calcular corretamente o menor e o maior faturamento', () {
      List<double> faturamentoDiario = [100.0, 200.0, 0.0, 300.0, 434.0, 0.0];
      double menorFaturamentoEsperado = 100.0;
      double maiorFaturamentoEsperado = 434.0;

      double menorFaturamento = double.infinity;
      double maiorFaturamento = double.negativeInfinity;

      for (double valor in faturamentoDiario) {
        if (valor > 0) {
          if (valor < menorFaturamento) {
            menorFaturamento = valor;
          }
          if (valor > maiorFaturamento) {
            maiorFaturamento = valor;
          }
        }
      }
      expect(menorFaturamento, menorFaturamentoEsperado);
      expect(maiorFaturamento, maiorFaturamentoEsperado);
    });

    test('Deve calcular corretamente a média anual de faturamento', () {
      List<double> faturamentoDiario = [100.0, 200.0, 300.0, 434.0];
      double somaFaturamento = faturamentoDiario.reduce((a, b) => a + b);
      int diasComFaturamento = faturamentoDiario.length;

      double mediaEsperada = somaFaturamento / diasComFaturamento;

      double mediaAnual = calcMediaAnual(somaFaturamento, diasComFaturamento);

      expect(mediaAnual, mediaEsperada);
    });

    test('Deve contar corretamente os dias acima da média anual', () {
      List<double> faturamentoDiario = [100.0, 200.0, 0.0, 300.0, 434.0, 0.0];
      double somaFaturamento = 1034.0; // Soma dos valores > 0
      int diasComFaturamento = 4;      // Ignorando dias com 0 de faturamento

      double mediaAnual = calcMediaAnual(somaFaturamento, diasComFaturamento);


      int diasAcimaDaMedia = 0;
      for (double valor in faturamentoDiario) {
        if (valor > mediaAnual) {
          diasAcimaDaMedia++;
        }
      }

      int diasAcimaDaMediaEsperado = 2; // 300.0 e 434.0 estão acima da média

      expect(diasAcimaDaMedia, diasAcimaDaMediaEsperado);
    });
  });
}
