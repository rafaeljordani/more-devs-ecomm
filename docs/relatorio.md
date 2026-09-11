📋 Homologação em Par — Teste Cruzado (Flutter)
Projeto avaliado: more-devs-ecomm — https://github.com/emanuelderossi/more-devs-ecomm
Dupla autora: Rafael Jordani Coelho e Emanuel Derossi
Dupla avaliadora: Rafael Jordani Coelho
Data: 11/09/2026
Foi realizada a execução e avaliação do projeto desenvolvido pela outra dupla, com o objetivo de identificar bugs, problemas de funcionamento e práticas de codificação que podem ser aprimoradas. Os problemas encontrados estão descritos abaixo, juntamente com possíveis soluções.
🐞 Bugs encontrados
1. Ausência do MultiProvider na main
Ao executar o aplicativo inicialmente, foi identificado um erro que impedia o funcionamento correto da aplicação. O problema estava relacionado à ausência do MultiProvider na main, necessário para disponibilizar os Controllers utilizados pelos Consumers e demais componentes da aplicação.
Possível solução:
Adicionar o MultiProvider na estrutura principal da aplicação, registrando os Controllers necessários:
return MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (context) {
        return LoginController();
      },
    ),
  ],
  builder: (context, child) {
    return MaterialApp(
      // configuração da aplicação
    );
  },
);
2. Referência incorreta da imagem na LoginPage
Na tela de login, foi identificada uma referência incorreta ao recurso de imagem utilizado na interface.
Possível solução:
Corrigir o caminho do asset utilizado:
Image.asset(
  'assets/images/splash_screen.png',
  height: 120,
)
Como boa prática de layout, recomenda-se também utilizar um SizedBox ou outro widget de dimensionamento quando necessário, garantindo maior controle sobre o espaço ocupado pelo componente.
3. HomePage incompleta e sem funcionamento
A HomePage encontra-se incompleta e, no estado atual do projeto, não é possível acessá-la ou utilizá-la corretamente.
Possível solução:
Finalizar a implementação da tela e garantir que ela esteja corretamente configurada nas rotas e no fluxo de navegação da aplicação.
4. Ausência de opção para retornar na tela de recuperação de senha
Na tela de recuperação de senha, não foi identificada uma forma clara de retornar à tela anterior, dificultando a navegação do usuário.
Possível solução:
Adicionar uma AppBar, permitindo que o usuário utilize o botão de retorno padrão:
AppBar(
  centerTitle: true,
  title: Text(
    'Recuperar senha',
    style: AppTextStyle.title,
  ),
)
⚠️ Práticas de codificação que podem ser aprimoradas
1. Organização e arquitetura das páginas
Foi identificado que a arquitetura do projeto não segue um padrão consistente em todas as partes da aplicação. Também foram encontradas duplicidades de arquivos.
Sugestão:
Padronizar a estrutura de pastas e arquivos do projeto, seguindo uma arquitetura definida. Além disso, remover arquivos duplicados ou desnecessários para facilitar a manutenção e compreensão do código.
2. Utilização do Controller na SignupPage
Na SignupPage, embora a implementação atual não apresente necessariamente um erro, foi observado que o Controller não está sendo utilizado por meio de um Consumer ou outra abordagem equivalente para reagir às alterações de estado.
Sugestão:
Avaliar a necessidade de utilizar Consumer, context.watch, context.read ou outra abordagem adequada do Provider, de acordo com a responsabilidade do Controller e a necessidade de atualização da interface.
3. Dimensionamento dos TextFields
Os TextFields presentes na tela de recuperação de senha e na tela de validação do cadastro apresentam dimensões maiores do que o padrão visual utilizado no restante da aplicação.
Sugestão:
Revisar o padding, height, width e demais propriedades responsáveis pelo dimensionamento dos campos, buscando manter uma padronização visual entre as diferentes telas do aplicativo.
📌 Considerações finais
Durante a homologação, foram identificados problemas que afetam tanto o funcionamento da aplicação quanto a organização e padronização do código.
Os principais pontos encontrados foram a ausência do MultiProvider, problemas na referência de assets, uma HomePage ainda incompleta, ausência de uma opção de retorno na tela de recuperação de senha e inconsistências na arquitetura e no dimensionamento de componentes.
Recomenda-se a correção desses pontos antes da conclusão do projeto, além de uma nova execução da aplicação após os ajustes para verificar se os problemas foram solucionados.
