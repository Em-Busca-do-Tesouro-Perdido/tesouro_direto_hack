# Jornada de inicialização de aplicação e execução de operações

Este documento explica os passos para a configuração dos contratos inteligentes necessários para a execução da aplicação e sua operacionalização. Neste momento, pressupõe-se que o desenvolvedor tenha configurado uma conexão RPC com uma rede EVM no arquivo **hardhat.config.ts** e que esteja na pasta **scripts**.

## *Deploy* de contrato de token fungível (representa o recurso da transferência especial)

- Execute o script **migration/deploy_erc20.ts** rodando o seguinte comando:

```shell
npx hardhat run migration/deploy_erc20.ts
```

## *Deploy* de contrato de token não fungível (representa o selo de confirmação do dispêndio da transferência especial)

- Execute o script **migration/deploy_erc721_seal.ts** rodando o seguinte comando:

```shell
npx hardhat run migration/deploy_erc721_seal.ts
```

## *Deploy* de contrato de lista de prestações de contas:

- Execute o script **migration/deploy_accountabilities.ts** rodando o seguinte comando:

```shell
npx hardhat run migration/deploy_accountabilities.ts
```



