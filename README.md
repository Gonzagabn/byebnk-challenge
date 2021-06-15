# Desafio técnico mobile - Byebnk

Olá,

Estamos muito felizes que você deseja fazer parte do time da Byebnk. O teste abaixo é construido de
forma que você consiga demonstrar os seus conhecimentos em desenvolvimento de aplicativos mobile. Ele
consiste no desenvolvimento de um aplicativo simples para gestão de investimentos.

O aplicativo deve consumir uma API rest para mostrar os seus resultados e deve conter as três telas
especificadas abaixo. Você não precisa se preocupar com a formatação do layout (deixar bonito, etc).
O foco do desafio são as suas habilidade técnicas e as funcionalidades do aplicativo, não o design.

Você pode organizar o projeto da maneira que achar que faz mais sentido. Além disso, sinta-se a
vontade para adicionar ferramentas ou funcionalidades que ache relevante, porém não deixe que isso
impacte negativamente a qualidade dos requisitos obrigatórios.

Lembre-se: Existem diversas formas de se desenvolver um sistema. Não estamos procurando a resposta
certa, mas sim uma explicação racional por trás de cada decisão tomada.

## Requisitos obrigatórios
Desenvolva um aplicativo mobile para Android/iOS de gestão de investimentos que utilize a [API](https://gitlab.com/byebnk/desafio-mobile/-/blob/master/APIDOCS.md) abaixo.

O aplicativo deve conter no mínimo as três telas abaixo. Você pode separar as funcionalidade em mais
telas caso acredite que faça mais sentido, porém não pode juntar funcionalidades de telas diferentes
em uma só (exemplo: criar apenas uma tela para ver as movimentações e fazer uma aplicação).

### 1. Login
O login é realizado utilizando o email e senha do usuário. Ao acessar o aplicativo pela primeira vez
o usuário deve realizar o login antes de acessar qualquer outra funcionalidade.

### 2. Movimentações e saldo
Esta é a tela inicial do app após o login, nela o usuário pode ver todas as movimentações que foram
feitas na sua conta (aplicações e resgate) e também o saldo da sua conta (saldo = aplicações - resgates).

* A API não retorna o saldo da conta, ele deve ser calculado manuamente no app.
* Deve ser possível o usuário atualizar (no sentido de fazer uma nova requisição para o servidor) o seu saldo/movimentações sem precisar fechar e abrir o aplicativo.

### 3. Realizar aplicação ou resgate
Nesta tela o usuário pode estipular um valor e fazer uma aplicação ou resgate na sua conta. Aplicação
é quando o usuário aporta dinheiro em sua conta. Resgate é quando o usuário retira dinheiro da sua
conta.

----------------------

## Documentação da API
Você pode acessar a documentação da API clicando [neste link](https://gitlab.com/byebnk/desafio-mobile/-/blob/master/APIDOCS.md).


## O que vamos avaliar (nesta ordem)
1. O cumprimento dos requisitos obrigatórios
2. A forma que o código está organizado
3. O domínio das funcionalidade do framework
4. A simplicidade da solução
5. A implementação de requisitos opcionais
6. A implementação de funcionalidades extras
