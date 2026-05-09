# 1. Silenciar el saludo por defecto
set -g fish_greeting

# 2. Inicialización
if status is-interactive
    atuin init fish | source
    oh-my-posh init fish --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json | source

    if type -q eza
        abbr -a ls 'eza --icons --group-directories-first'
        abbr -a ll 'eza -lh --icons --git'
    end
end

# 3. Función de bienvenida
function fish_greeting
    set -l modo (random 1 4)

    switch $modo
        case 1
            # fastfetch con un logo aleatorio válido
            fastfetch --logo (random choice fedora fedora_small arch debian ubuntu)

        case 2
            # Tu cowsay escupe la lista perfecta. Fish la convierte en array automáticamente.
            set -l vacas (cowsay -l)

            # Elegimos una al azar
            set -l vaca (random choice $vacas)

            fortune | cowsay -f "$vaca" | lolcat

        case 3
            # Frase + Fastfetch sin logo
            fortune | lolcat
            echo ""
            fastfetch --logo none

        case 4
            # fastfetch estándar de Fedora
            fastfetch --logo fedora
    end

    # Línea decorativa
    set -l colores red green blue yellow magenta cyan
    echo (set_color (random choice $colores))"────────────────────────────────────────────────"
    set_color normal
end
