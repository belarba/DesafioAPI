# Dito Challange

Aqui está a minha solução para o desafio

Tecnologias utilizadas:

* Rails 5.2.3
* JavaScript ES6
* Postgresql

Para executar é necessário ter o rails, baixar a solução, ir até o diretório e rodar o comando
```bash
rails db:migrate
```
após iniciar o servidor com

```bash
rails s
```
No ``` http://localhost:3000/ ``` aparecerá a tela onde é possível testar a primeira parte do desafio. Existem 2 inputs, o botão ``` Insert ``` adiciona dado via ``` Active Record ``` e o botão ``` JS insert ``` adiciona via post na API.

O campo Json carrega a API para demonstração

O input do Autocomplete mostra sugestão de event à partir do segundo caracter digitado.


No ``` http://localhost:3000/test_compras ``` aparece o Json de saída da segunda parte do desafio.

