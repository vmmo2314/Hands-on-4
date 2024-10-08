#!/bin/bash

# Colores para mejorar la interfaz
VERDE='\033[0;32m'
AZUL='\033[0;34m'
AMARILLO='\033[1;33m'
ROJO='\033[0;31m'
NC='\033[0m' # No Color

# Función para mostrar el banner
mostrar_banner() {
    clear
    echo -e "${VERDE}"
    echo "╔══════════════════════════════════════════╗"
    echo "║             MENÚ DE SERVICIOS            ║"
    echo "║          Sistema de Administración       ║"
    echo "╚══════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Función para mostrar el menú
mostrar_menu() {
    echo -e "${AZUL}Seleccione una opción:${NC}"
    echo -e "${AMARILLO}1)${NC} Listar contenido de un directorio"
    echo -e "${AMARILLO}2)${NC} Crear archivo de texto"
    echo -e "${AMARILLO}3)${NC} Comparar archivos"
    echo -e "${AMARILLO}4)${NC} Demostración de AWK"
    echo -e "${AMARILLO}5)${NC} Demostración de GREP"
    echo -e "${AMARILLO}6)${NC} Salir"
    echo
}

# Función para listar contenido
listar_contenido() {
    echo -e "${AZUL}Ingrese la ruta absoluta del directorio:${NC}"
    read -r ruta
    if [ -d "$ruta" ]; then
        echo -e "${VERDE}Contenido del directorio $ruta:${NC}"
        ls -la "$ruta"
    else
        echo -e "${ROJO}Error: El directorio no existe${NC}"
    fi
    echo -e "\nPresione Enter para continuar..."
    read -r
}

# Función para crear archivo
crear_archivo() {
    echo -e "${AZUL}Ingrese el texto para el archivo:${NC}"
    read -r texto
    echo -e "${AZUL}Ingrese el nombre del archivo:${NC}"
    read -r nombre_archivo
    echo "$texto" > "$nombre_archivo"
    echo -e "${VERDE}Archivo creado exitosamente${NC}"
    echo -e "\nPresione Enter para continuar..."
    read -r
}

# Función para comparar archivos
comparar_archivos() {
    echo -e "${AZUL}Ingrese la ruta del primer archivo:${NC}"
    read -r archivo1
    echo -e "${AZUL}Ingrese la ruta del segundo archivo:${NC}"
    read -r archivo2
    
    if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
        echo -e "${VERDE}Comparando archivos...${NC}"
        diff "$archivo1" "$archivo2"
    else
        echo -e "${ROJO}Error: Uno o ambos archivos no existen${NC}"
    fi
    echo -e "\nPresione Enter para continuar..."
    read -r
}

# Función para demostración de AWK
demo_awk() {
    echo -e "${VERDE}Demostración de AWK${NC}"
    echo -e "Creando archivo de ejemplo..."
    
    # Crear archivo de ejemplo
    cat > ejemplo_awk.txt << EOF
Juan 25 1500
María 30 2500
Pedro 28 1800
Ana 35 3000
EOF
    
    echo -e "${AZUL}Contenido del archivo:${NC}"
    cat ejemplo_awk.txt
    echo -e "\n${AZUL}Usando AWK para mostrar nombres y salarios:${NC}"
    awk '{print "Nombre: " $1 ", Salario: $" $3}' ejemplo_awk.txt
    
    echo -e "\nPresione Enter para continuar..."
    read -r
}

# Función para demostración de GREP
demo_grep() {
    echo -e "${VERDE}Demostración de GREP${NC}"
    echo -e "Creando archivo de ejemplo..."
    
    # Crear archivo de ejemplo
    cat > ejemplo_grep.txt << EOF
Esta es una línea de prueba
Otra línea diferente
Esta línea se repite
Línea final de prueba
Esta es la última línea
EOF
    
    echo -e "${AZUL}Contenido del archivo:${NC}"
    cat ejemplo_grep.txt
    echo -e "\n${AZUL}Buscando líneas que contienen 'Esta':${NC}"
    grep "Esta" ejemplo_grep.txt --color=auto
    
    echo -e "\nPresione Enter para continuar..."
    read -r
}

# Bucle principal del programa
while true; do
    mostrar_banner
    mostrar_menu
    read -r opcion
    
    case $opcion in
        1) listar_contenido ;;
        2) crear_archivo ;;
        3) comparar_archivos ;;
        4) demo_awk ;;
        5) demo_grep ;;
        6) 
            echo -e "${VERDE}¡Gracias por usar nuestro sistema!${NC}"
            exit 0
            ;;
        *)
            echo -e "${ROJO}Opción inválida${NC}"
            sleep 2
            ;;
    esac
done