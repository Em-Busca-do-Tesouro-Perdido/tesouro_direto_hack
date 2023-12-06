# Jornada de inicialização de aplicação e execução de operações

Este documento explica os passos para a configuração dos contratos inteligentes necessários para a execução da aplicação e sua operacionalização. Neste momento, pressupõe-se que o desenvolvedor tenha configurado uma conexão RPC com uma rede EVM no arquivo **hardhat.config.ts** e que esteja na pasta **scripts**. Execute as instruções na sequência disposta nesta documentação.

## *Deploy* de contrato de token fungível (representa o recurso da transferência especial)

- Execute o script **migration/deploy_erc20.ts** rodando o seguinte comando:

```shell
npx hardhat run migration/deploy_erc20.ts
```

Preencha a variável de ambiente ERC20_CONTRACT_ADDRESS com o hash do contrato retornado no console.

## *Deploy* de contrato de token não fungível (representa o selo de confirmação do dispêndio da transferência especial)

- Execute o script **migration/deploy_erc721_seal.ts** rodando o seguinte comando:

```shell
npx hardhat run migration/deploy_erc721_seal.ts
```

Preencha a variável de ambiente ERC721_CONTRACT_ADDRESS com o hash do contrato retornado no console.

## *Deploy* de contrato de lista de prestações de contas:

- Execute o script **migration/deploy_accountabilities.ts** rodando o seguinte comando:

```shell
npx hardhat run migration/deploy_accountabilities.ts
```

Preencha a variável de ambiente ACCOUNTABILITIES_CONTRACT_ADDRESS com o hash do contrato retornado no console.

## Geração de oferta inicial de *tokens* ERC-20 para a carteira do Tesouro Nacional

- Execute o script **user_journey/mint_erc20.ts** rodando o seguinte comando:

```shell
npx hardhat run user_journey/mint_erc20.ts
```

## *Deploy* de contrato de ordens de transferências especiais:

- Execute o script **migration/deploy_transfer_order.ts** rodando o seguinte comando:

```shell
npx hardhat run migration/deploy_transfer_order.ts
```

Preencha a variável de ambiente TRANSFER_ORDER_CONTRACT_ADDRESS com o hash do contrato retornado no console.

## Criação de solicitação de transferência especial (pode ser invocado quantas vezes se desejar):

- Execute o script **user_journey/create_special_transfer_request.ts** rodando o seguinte comando:

```shell
npx hardhat run user_journey/create_special_transfer_request.ts
```

## Execução de transferência especial:

- Execute o script **user_journey/execute_special_transfer.ts** rodando o seguinte comando:

```shell
npx hardhat run user_journey/execute_special_transfer.ts
```

## Criação de prestação de contas (pode-se acionar quantas vezes for necessário):

- Execute o script **user_journey/create_accountability.ts** rodando o seguinte comando:

```shell
npx hardhat run user_journey/create_accountability.ts
```

## Geração de selo de certificação:

- Execute o script **user_journey/mint_erc721_seal.ts** rodando o seguinte comando:

```shell
npx hardhat run user_journey/mint_erc721_seal.ts
```

## Atualização de requisição com *hash* da transação de transferência:

- Execute o script **user_journey/change_special_transfer_request_status.ts** rodando o seguinte comando:

```shell
npx hardhat run user_journey/change_special_transfer_request_status.ts
```


