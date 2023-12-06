# SISTOKEN - Sistema de tokenização de transferências especiais do Tesouro Nacional

Este projeto contém os contratos inteligentes que implementam a lógica de SISTOKEN, bem como *scripts* e arquivos auxiliares para a implementação dos mesmos em uma rede compatível a EVM. A princípio, o repositório está configurado para implantar os contratos na rede de testes da Ethereum Sepolia, mas pode se estabelecer outras configurações a gosto do desenvolvedor modificando o arquivo **hardhat.config.ts**.

Para iniciar, crie um arquivo de ambiente (**.env**) utilizando **dotenv.template** como modelo. NÃO use os valores de variáveis presentes nele: ele será modificado à medida que se vai seguindo a jornada de execução explanada em **scripts/README.md**. De início, apenas configure as variáveis que representam endereços públicos de carteiras EVM.

## Referências para artefatos da proposta

Seguem *links* de artefatos utilizados na proposta da equipe:

- URL do protótipo elaborado com Figma: https://www.figma.com/file/R6jeUsFqIiW3PF9k8CkeKe/Tesouro?type=design&node-id=74%3A369&mode=design&t=aaEcuBNnIVzG1Yq0-1;
- URL da apresentação de slides utilizadas no *pitch*: https://www.canva.com/design/DAF2BxLiHzA/t6Qwcn9zu0cDHMZ29B94DA/edit?utm_content=DAF2BxLiHzA&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton ;
- URL do vídeo do *pitch* no **YouTube**: https://youtu.be/8zZc8n7hdw4
