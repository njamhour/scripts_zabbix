#!/bin/sh

IFACE=$1
DESTINO=$2
PORTA=$3
TENTATIVAS=$4

# Executa o comando tcping com saída em JSON
OUTPUT=$(/var/zabbix/scripts/tcping -4 -I $IFACE $DESTINO $PORTA -c $TENTATIVAS -j)

# Extrai o valor de "total_packet_loss" diretamente do JSON
PACKET_LOSS=$(echo "$OUTPUT" | grep -o '"total_packet_loss":"[^"]*"' | awk -F':' '{print $2}' | tr -d '"' | cut -d'.' -f1)

# Garante que apenas o número inteiro seja retornado
#if [ -n "$PACKET_LOSS" ]; then
echo "$PACKET_LOSS"