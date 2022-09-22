# Privit ImageDB

O Privit ImageDB é um gerenciador de imagens e um provedor de diversas formas de acesso a mídia digital (funcionamento por API). Todo o funcionamento interno do Privit se baseia em seu protocolo próprio que é especificado em [Protocolo Privit ImageDB](https://zunho.com.br/index.php?pages/Privit-ImageDB).

## Instalação

Para realizar a instalação do Privit Server apenas execute o arquivo **"configure.sh"** para realizar o download e manutenção (_argumento update_) das bibliotecas necessárias, após, crie um diretório na raíz do projeto e execute o CMake.

```
$ ./configure.sh
$ mkdir build && cd build
$ cmake ..
```

Utilize o comando de ajuda para informações mais específicas sobre a execução do script:

> $ ./configure.sh --help

Perceba que o script pode não funcionar em outros sistemas operacionais.