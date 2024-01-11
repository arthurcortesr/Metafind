#!/bin/bash

# Verifica se o número de argumentos é válido
if [ "$#" -ne 2 ]; then
    echo "----------------------------------------------------------------"
    echo "Suportado: pdf, doc, docx, xls, xlsx, ppt, pptx"
    echo "----------------------------------------------------------------"
    echo "Modo de uso: ./metafind.sh <alvo> <tipo_de_arquivo>"
    echo "----------------------------------------------------------------"
    exit 1
fi

# Obtém o host e o tipo de arquivo do argumento
HOST="$1"
FILE_TYPE="$2"
URL_FILE="/home/arthurcortesr/Desktop/$HOST"

# Define os tipos de arquivos suportados
TIPOS_ARQUIVOS=("pdf" "doc" "docx" "xls" "xlsx" "ppt" "pptx")

# Verifica se o tipo de arquivo é suportado
if [[ ! " ${TIPOS_ARQUIVOS[@]} " =~ " ${FILE_TYPE} " ]]; then
    echo "Tipo de arquivo não suportado. Apenas suportado: pdf, doc, docx, xls, xlsx, ppt, pptx"
    exit 1
fi

# Define o termo de busca usando o Google Dork
SEARCH_TERM="site:$HOST+ext:$FILE_TYPE"

# Realiza a pesquisa usando o Google Dork e extrai os URLs
lynx --dump "https://google.com/search?&q=$SEARCH_TERM" | grep ".$FILE_TYPE" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > "$URL_FILE"

# Faz o download de cada URL listada no arquivo
while IFS= read -r URL; do
    # Faz o download do arquivo para análise local usando wget com a opção -q (quiet)
    wget -q "$URL"
    
    # Verifica se o download foi bem-sucedido
    if [ -e "$(basename "$URL")" ]; then
        # Analisa os metadados usando o Exiftool para arquivos suportados
        echo "Metadados para $(basename "$URL"):"
        exiftool "$(basename "$URL")"
        echo "---------------------------------------"
        
        # Remove o arquivo após análise
        rm "$(basename "$URL")"
    else
        echo "Erro ao baixar o arquivo: $URL"
    fi
done < "$URL_FILE"

# Remove o arquivo de URLs após o processamento
rm "$URL_FILE"
