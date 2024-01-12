# Metafind

O script ```metafind.sh``` é um utilitário em Bash projetado para realizar a busca e download de arquivos de um determinado tipo (como PDF, DOC, XLS, etc.) em um host específico. O script utiliza o Google Dorking para realizar a pesquisa e, em seguida, faz o download dos arquivos encontrados para análise local.

Este repositório também possui o arquivo [melhorias](https://github.com/arthurcortesr/Metafind/blob/main/melhorias.md) que é usado para adicionar anotações de possíveis melhorias a serem implementadas no no script.


<br>

---

<br>

## **Modo de uso**

```bash
./metafind.sh <alvo> <extensão>
```

## **Exemplo**

```bash
./metafind.sh businesscorp.com.br pdf
```

## **Exemplo de saída**

```bash
Metadados para arquivo1.pdf:
...
---------------------------------------
Metadados para arquivo2.pdf:
...
---------------------------------------
```

<br>

---

<br>

## **Funcionalidades**

1. Verifica se o número correto de argumentos foi fornecido. Caso contrário, exibe uma mensagem de uso.
2. Obtém o host e o tipo de arquivo a partir dos argumentos fornecidos.
3. Define os tipos de arquivos suportados, como PDF, DOC, DOCX, XLS, XLSX, PPT, PPTX.
4. Verifica se o tipo de arquivo especificado é suportado.
5. Define o termo de busca usando o Google Dork para encontrar URLs que correspondam ao host e ao tipo de arquivo.
6. Utiliza o Lynx para realizar a pesquisa no Google Dork e extrai os URLs dos resultados.
7. Faz o download de cada URL listada no arquivo gerado.
8. Para cada arquivo baixado, analisa os metadados usando o Exiftool e exibe as informações.
9. Remove o arquivo após a análise para limpar o espaço de armazenamento.
10. Remove o arquivo de URLs após o processamento.

<br>

---

<br>

## **Observações**

1. O script salva os URLs encontrados em um arquivo local para referência futura.
2. A análise dos metadados é realizada usando o Exiftool para fornecer informações detalhadas sobre os arquivos baixados.

<br>

---

<br>

## **Avisos**

1. Este script é destinado para fins educacionais e deve ser usado em ambientes controlados e autorizados.
2. O uso inadequado do script pode violar os Termos de Serviço de websites e políticas de segurança. Certifique-se de ter permissão antes de executar em qualquer site externo.
























