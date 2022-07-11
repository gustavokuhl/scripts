#!/bin/bash

for i in 0 1 2 3 4; do
        controle=1
        while [ $controle != "0" ]; do
                # Executa um comando, que se for finalizado sem erros irá dar um retorno 0 para o $?
                controle=`echo $?`
        done
done
