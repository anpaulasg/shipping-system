🚚🚚🚚🚚

<h1>SISTEMA DE FRETES</h1>

<h3>Resumo da aplicação:</h3>
Esta é a aplicação responsável por gerenciar a frota de entrega para um e-commerce com alcance nacional. Diferentes tipos de transporte são cadastrados definindo os prazos e os custos. A plataforma é capaz de cadastrar novos pedidos de frete (ordens de serviço) e fazer os cálculos de frete de acordo com os tipos de transporte que atendem ao perfil do pedido. Além disso, o sistema possui funcionalidades desenvolvidas para controlar as ordens de serviço em andamento, encerrar ordens de serviço e consultar o status da frota de veículos da empresa.

<h3>Funcionalidades:</h3>

<strong>✔️ Usuários Administradores e Usuários Regulares</strong>

O acesso ao sistema é realizado através de um login com e-mail e senha. Todos usuários são funcionários da empresa transportadora, só que alguns usuários possuem acesso a mais operações (administradores) quando comparados aos usuários comuns (regulares). Neste caso, usuários administradores são capazes de cadastrar veículos, modalidades de transporte, configurar preços e prazos e cadastrar novas ordens de serviço. Já os usuários regulares são capazes apenas de iniciar uma ordem de serviço, escolhendo a modalidade de entrega, e encerrar uma ordem de serviço.

<strong>✔️ Cadastro de Modalidade de Transporte</strong>

Um usuário administrador, ao logar no sistema de fretes, é capaz de cadastrar novas modalidades de transporte informando o nome, a distância mínima praticada, a distância máxima praticada, o peso mínimo e o peso máximo da carga, além de uma taxa fixa a ser cobrada para cada entrega.

<strong>✔️Cadastro de Veículos</strong>

Um usuário administrador, ao logar no sistema de fretes, é capaz de cadastrar os veículos utilizados nas entregas de cada modalidade. Cada cadastro armazenará a placa de identificação, a marca/modelo do veículo, o ano de fabricação e a capacidade máxima de carga em kilos. O mesmo usuário também é capaz de indicar que um veículo está ativo, ou seja em operação, ou em manutenção - hipótese, esta, em que será desconsiderado para futuras entregas. Usuários regulares, por sua vez, são capazes de consultar o status de toda a frota ou de um veículo específico.

<strong>✔️ Configuração de preços por peso</strong>

Cada modalidade de transporte possui a sua configuração de preços de acordo com o peso da carga a ser entregue. O preço será sempre medido por km percorrido e o peso deve ser considerado em intervalos. Usuários administradores, ao logar no sistema, serão capazes de cadastrar e atualizar estes dados. Usuários regulares podem, por sua vez, apenas consultar estes dados.

<strong>✔️Configuração de preços por distância</strong>

Cada modalidade de transporte possui a sua configuração de preços de acordo com a distância percorrida. Nesta configuração o preço é fixo e a distância considerada em intervalos. Usuários administradores, ao logar no sistema, serão capazes de cadastrar e atualizar estes dados. Usuários regulares podem, por sua vez, apenas consultar estes dados.

<strong>✔️Configuração de prazos</strong>

Cada modalidade de transporte possui a sua configuração de prazos de entrega de acordo com a distância entre a origem e o destino. O prazo é calculado como um fator de horas a partir da distância. Usuários administradores, ao logar no sistema, serão capazes de cadastrar e atualizar estes dados. Usuários regulares podem, por sua vez, apenas consultar estes dados.

<strong>✔️Criar Ordem de Serviço</strong>

Um usuário administrador, ao logar no sistema de fretes, será capaz de cadastrar uma nova ordem de serviço, onde indicará os dados para retirada do produto (endereço completo, código identificador do produto a ser retirado, dimensões e peso da carga), as informações para entrega e dados do destinatário. Uma vez criada, a ordem de serviço será considerada "pendente" e será gerado um código identificador único para rastreamento e consulta.

<strong>✔️Iniciar Ordem de Serviço</strong>

Usuários regulares, ao logar no sistema de fretes, verão todas ordens de serviço pendentes em uma tela separada. Ao iniciar uma ordem de serviço em específico, serão listadas na tela as modalidades de transporte capazes de atender à ordem de serviço. Nesta mesma tela, serão informados o preço total da operação e o prazo para aquela ordem.
No caso, o preço total será o resultado da operação que calcula o preço por km de acordo com o peso da carga somado à taxa fixa de acordo com a distância a ser percorrida e à taxa fixa de entrega fixa da modalidade. O prazo, por sua vez, será calculado de acordo com a distância a ser percorrida, considerando as configurações de cada modalidade.

Após escolher a modalidade a ser utilizada para a entrega, o sistema automaticamente vinculará um dos veículos disponíveis da frota para executar a ordem de serviço. O veículo passa para o status "em entrega" e não será considerado para novas entregas até que a ordem seja encerrada. Ainda, o prazo e o valor total da entrega serão registrados na ordem de serviço para consulta e acompanhamento.

<strong>✔️Encerrar Ordem de Serviço</strong>

Usuários regulares, ao logar no sistema de fretes, serão capazes de visualizar todas ordens de serviço em andamento e encerrá-las. Ao encerrar, será registrada a data de encerramento e o status daquela ordem - encerrada no prazo ou encerrada com atraso. Na hipótese de a ordem de serviço ser finalizada com atraso, o usuário deve informar o motivo do atraso. Ao encerrar uma ordem de serviço, o sistema automaticamente indicará que o veículo alocado para aquela ordem de serviço encontra-se novamente disponível novamente para realizar novas entregas.

<strong>✔️Consulta de Entrega - Em Andamento -</strong>

É possível o destinatário da entrega consultar o status de sua entrega informando o respectivo código de rastreamento. Ao realizar a busca, serão informados ao destinatário o endereço de saída, o endereço de entrega, dados do veículo e a previsão de entrega. Caso a carga já tenha sido entregue, será exibida a data de entrega na tela.

<h3>Gems utilizadas:</h3>

• Gem Devise 4.8
• Gem Capybara 3.37
• Gem Rails 7.0
• SQlite 1.4
