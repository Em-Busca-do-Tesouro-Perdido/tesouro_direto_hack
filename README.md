# SISTOKEN - Sistema de tokenização de transferências especiais do Tesouro Nacional

Este projeto contém os contratos inteligentes que implementam a lógica de SISTOKEN, bem como *scripts* e arquivos auxiliares para a implementação dos mesmos em uma rede compatível a EVM. A princípio, o repositório está configurado para implantar os contratos na rede de testes da Ethereum Sepolia, mas pode se estabelecer outras configurações a gosto do desenvolvedor modificando o arquivo **hardhat.config.ts**.

Para iniciar, crie um arquivo de ambiente (**.env**) utilizando **dotenv.template** como modelo. NÃO use os valores de variáveis presentes nele: ele será modificado à medida que se vai seguindo a jornada de execução explanada em **scripts/README.md**. De início, apenas configure as variáveis que representam endereços públicos de carteiras EVM.
