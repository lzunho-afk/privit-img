# Privit ImageDB

O Privit ImageDB é um gerenciador de imagens e um provedor de diversas formas de acesso a mídia digital. Todo o funcionamento interno do Privit se baseia em seu protocolo próprio que é especificado no [pages](https://lzunho-afk.github.io/privit-img).

## Compilação

Para compilar o Privit-img recomendamos seguir os seguintes passos:

- Clonar e entrar no diretório do projeto:

```
$ git clone https://github.com/lzunho-afk/privit-img.git
$ cd privit-img
```

- Criar um diretório para realizar a compilação com o CMake:

```
$ mkdir build && cd build
$ cmake ..
$ make
```

## Gerar Documentação

Para gerar os arquivos de documentação do código fonte utilizamos o Doxygen integrado ao CMake. Portanto, apenas ative a variável da documentação da seguinte forma:

```
cmake -DBUILD_DOC=ON ..
```
