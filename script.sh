#!/bin/bash
while [[ $# -gt 0 ]]  
do
    case "$1" in
        -p1 | --IDE )
            shift  # Busca el -p1 o --IDE 
            param1="$1"  
            shift
        ;;
        -p2 | --PAQUETE )  # YARN o NPM
            param2="$2" 
            shift
        ;;
        -p3 | --help )
            shift
            param3=true 
            shift
        ;;
        * ) 
            shift  # Ignora parametros no reconocidos
        ;;
    esac        
done 
if [ "$param3" = true ]; then
echo " usar --IDE <vs|webstron> Para especificar ide . --PAQUETE <NPM|YARN> Para especificar "
exit
fi

if [ "$param1" = "VSCODE" -o "$param1" = "VS" -o "$param1" = "vs" -o "$param1" = "code" ]; then
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
# Suponiendo que estamos en el proyecto en su raiz.
mkdir .vscode
git clone https://github.com/fedeSportclub/Setting_globals.git && mv ./Setting_globals/settings.json ./.vscode && mv ./Setting_globals/.eslintrc ./ &&  rm -r -f ./Setting_globals/
fi
if [ "$param2" = "NPM" -o "$param2" = "npm" ]; then
npm install --save-dev eslint prettier eslint-config-prettier eslint-plugin-prettier
fi
if [ "$param2" = "YARN" -o "$param2" = "yarn" ]; then
yarn add -D eslint prettier eslint-config-prettier eslint-plugin-prettier && yarn install
fi
