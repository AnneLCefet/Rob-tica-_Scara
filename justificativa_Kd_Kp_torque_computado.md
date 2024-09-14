Para o controle por torque computado, os ganhos \( K_p \) (proporcional) e \( K_d \) (derivativo) são escolhidos com base nas características desejadas para o desempenho do sistema, como estabilidade e resposta dinâmica.

Como a relação \( K_d = 2 \sqrt{K_p} \) que você forneceu é comumente utilizada para garantir um comportamento subamortecido com amortecimento crítico (criticamente amortecido), vou sugerir valores coerentes para \( K_p \) e calcular \( K_d \) para as quatro juntas do manipulador SCARA RRPR.

Aqui estão alguns valores sugeridos, levando em consideração que as juntas rotacionais geralmente têm uma dinâmica mais rápida do que as juntas prismáticas, mas ambos precisam de ajustes para garantir a resposta desejada:

### Sugestão de valores de \( K_p \) e \( K_d \):
- Para juntas rotacionais (juntas 1, 2 e 4):
  - **\( K_p \)**: valores entre 100 e 500 são comuns, dependendo da rigidez e resposta desejada.
- Para a junta prismática (junta 3):
  - **\( K_p \)**: valores um pouco menores, já que a junta prismática requer um controle mais suave e menos rígido. Algo entre 50 e 200 pode ser razoável.

Agora, aplicando a relação \( K_d = 2 \sqrt{K_p} \):

### Exemplo de cálculos para \( K_p \) e \( K_d \):
1. **Junta 1 (Rotacional)**:
   - \( K_p = 400 \)
   - \( K_d = 2 \times \sqrt{400} = 2 \times 20 = 40 \)

2. **Junta 2 (Rotacional)**:
   - \( K_p = 350 \)
   - \( K_d = 2 \times \sqrt{350} \approx 2 \times 18.71 \approx 37.42 \)

3. **Junta 3 (Prismática)**:
   - \( K_p = 150 \)
   - \( K_d = 2 \times \sqrt{150} \approx 2 \times 12.25 \approx 24.50 \)

4. **Junta 4 (Rotacional)**:
   - \( K_p = 300 \)
   - \( K_d = 2 \times \sqrt{300} \approx 2 \times 17.32 \approx 34.64 \)

### Resumo dos valores:
- Junta 1: \( K_p = 400 \), \( K_d = 40 \)
- Junta 2: \( K_p = 350 \), \( K_d = 37.42 \)
- Junta 3: \( K_p = 150 \), \( K_d = 24.50 \)
- Junta 4: \( K_p = 300 \), \( K_d = 34.64 \)

### Ajuste fino:
Esses valores são sugestões iniciais baseadas em uma regra comum para sistemas robóticos. Dependendo da inércia de cada elo, do atrito, e das especificações de desempenho, você pode precisar ajustar esses valores para obter a resposta desejada no controle por torque.

Se precisar de mais refinamento ou se houver mais detalhes sobre o manipulador, posso ajustar esses valores ainda mais.