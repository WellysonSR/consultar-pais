🌍 Consulta de Países - Delphi

Um aplicativo desenvolvido em Delphi (VCL) que consome a API REST Rest Countries para obter informações detalhadas sobre países, como nome oficial, capital, região, população e moeda.

O projeto foi refatorado para seguir boas práticas de programação, utilizando a separação de responsabilidades (camadas Model e Service).

🚀 Funcionalidades
Busca por Nome: Pesquisa informações de um país específico através de seu nome (em inglês ou português, dependendo do suporte da API).

Tradução Automática: Exibe o nome oficial do país em português e traduz as principais regiões.

Formatação de Dados: População exibida com separadores de milhar para melhor leitura.

🏗️ Estrutura do Projeto
O código está organizado em três partes principais para facilitar a manutenção e escalabilidade:

uPais.pas (Model): Define a classe TPais, que representa a entidade país com seus atributos.

uPaisServico.pas (Service): Contém a classe TPaisServico, responsável por toda a lógica de comunicação HTTP (usando TNetHTTPClient) e processamento do JSON.

uPrincipal.pas (View): Formulário principal que gerencia a interação com o usuário, capturando a entrada e exibindo os resultados.

🛠️ Tecnologias Utilizadas
Delphi (RAD Studio)

VCL (Visual Component Library)

System.JSON: Para processamento dos dados retornados pela API.

System.Net.HttpClient: Para requisições REST.

Rest Countries API: Fonte de dados externa.

📥 Como executar o projeto
Clone o repositório:

Bash
git clone https://github.com/WellysonSR/consultar-pais.git
Abra o projeto (.dproj) no seu Delphi.

Certifique-se de que todas as unidades (uPais, uPaisServico, uPrincipal) estão incluídas no Project Manager.

Compile e execute (F9).

📝 Exemplo de Uso
Ao digitar "Brazil" ou "Brasil" no campo de pesquisa e clicar em "Consultar", o sistema retornará:

Nome Oficial: República Federativa do Brasil

Capital: Brasília

Região: Américas

População: ~212,559,417

Moeda: Real brasileiro
