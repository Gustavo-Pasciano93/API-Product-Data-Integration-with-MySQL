# API Product Data Integration with MySQL

Este repositório contém dois scripts principais que demonstram o processo de integração de dados de produtos de uma API com um banco de dados MySQL. O objetivo do projeto é buscar dados de produtos de uma API, salvar esses dados em formato JSON, convertê-los para CSV e, finalmente, carregar e armazenar esses dados em uma tabela MySQL.

## Scripts

### 1.  - Integração com a API e Manipulação de Dados

O **script extract_and_save.py** é responsável por se conectar à API e coletar dados de produtos de uma categoria específica (exemplo: "men's clothing"). Ele realiza as seguintes funções:

- **fetch_data()**: Obtém dados de produtos da API de acordo com a categoria fornecida.
- **save_to_json()**: Salva os dados coletados em um arquivo JSON local.
- **convert_to_csv()**: Converte os dados JSON salvos para CSV.
- **load_csv()**: Carrega o arquivo CSV gerado e exibe as primeiras linhas dos dados.

#### Exemplo de uso


categoria = "men's clothing"
api = ProdutoAPI(categoria)
api.fetch_data()  # Obtém dados da API
api.save_to_json()  # Salva os dados em JSON
api.convert_to_csv()  # Converte para CSV
df = api.load_csv()  # Carrega e exibe os dados do CSV


### 2.  - Integração com MySQL

O **script save_mysql.py** conecta-se a um banco de dados MySQL e insere os dados armazenados no CSV gerado pelo script 1. Ele realiza as seguintes operações:

conectar(): Estabelece a conexão com o banco de dados MySQL.
mostrar_bancos_de_dados(): Exibe todos os bancos de dados disponíveis no servidor MySQL.
criar_tabela(): Cria uma tabela no banco de dados, caso não exista.
inserir_dados(): Insere os dados do CSV na tabela criada no MySQL.
fechar_conexao(): Fecha a conexão com o banco de dados.


#### Exemplo de uso:
path_csv = r"caminho/para/o/arquivo/dados_mens_clothing.csv"
df = pd.read_csv(path_csv)

banco = BancoDeDados(host='localhost', user='usuario', password='senha')
banco.conectar()
banco.mostrar_bancos_de_dados()  # Exibe os bancos de dados
banco.criar_tabela()  # Cria a tabela no banco de dados
banco.inserir_dados(df)  # Insere os dados no banco de dados
banco.fechar_conexao()  # Fecha a conexão

## Como usar o projeto: 

### 1. - Clone este repositório:

git clone https://github.com/usuario/API-Product-Data-Integration-with-MySQL.git
cd API-Product-Data-Integration-with-MySQL

### 2. - Instale as dependências: Caso ainda não tenha um ambiente configurado, crie um ambiente virtual e instale as dependências:

python -m venv venv
source venv/bin/activate  # No Windows use venv\Scripts\activate
pip install -r requirements.txt

### 3. -Execute o script de integração com a API:

python extract_and_save.py


### 4. -Prepare o banco de dados MySQL:

Certifique-se de ter um banco de dados MySQL em execução.
Crie um banco de dados se necessário e configure as credenciais no script save_mysql.py.


### 5. -Execute o script de inserção de dados no MySQL:
python save_mysql.py


## Requisitos:

Este projeto depende das seguintes bibliotecas:

requests - Para realizar requisições HTTP à API.
pandas - Para manipulação de dados e conversão de arquivos.
mysql-connector-python - Para interação com o banco de dados MySQL.
Instale as dependências usando o requirements.txt:
pip install -r requirements.txt



## Observações:

API: O projeto utiliza a Fake Store API para simular a obtenção de dados de produtos. Os dados incluem informações como título, preço, descrição, categoria, imagem e avaliação dos produtos.
MySQL: Os dados são armazenados em um banco de dados MySQL em uma tabela chamada tabela_roupas_masculinas.
Certifique-se de alterar as credenciais de conexão com o banco de dados MySQL no script script_2.py antes de executá-lo.
