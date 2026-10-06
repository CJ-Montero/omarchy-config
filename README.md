# Omarchy Config

Configuración personal de [Omarchy](https://omarchy.org/) (Hyprland + Omarchy Shell) con temas, plugins y keybindings customizados.

## Contenido

| Directorio | Descripción |
|------------|-------------|
| `hypr/` | Configuración Hyprland (keybindings, monitores, animaciones, input, hyprsunset) |
| `omarchy/` | Shell, temas, plugins, hooks, extensiones |
| `alacritty/` | Terminal Alacritty |
| `foot/` | Terminal Foot |
| `kitty/` | Terminal Kitty |
| `ghostty/` | Terminal Ghostty |
| `btop/` | Monitor de sistema con temas |
| `git/` | Configuración Git |
| `lazygit/` | Configuración Lazygit |
| `starship.toml` | Prompt de shell |

### Temas personalizados (`omarchy/themes/`)
- **artemis** - Tema oscuro elegante
- **dominican** - Colores bandera dominicana
- **florida-man** - Vibrante y colorido
- **leonida-keys-01** - Tema keyboard-centric
- **spacex** - Estilo SpaceX

### Plugins custom (`omarchy/plugins/cjmontero.*`)
| Plugin | Función |
|--------|---------|
| `agents` | Gestión de agentes/servicios |
| `audio` | Control de audio avanzado |
| `bar` | Barra de estado personalizada |
| `bluetooth` | Gestión Bluetooth |
| `clock` | Reloj con formato custom |
| `monitor` | Info de monitores |
| `network` | Estado de red |
| `notifications` | Centro de notificaciones |
| `power` | Gestión de energía/batería |
| `weather` | Clima actual |

## Instalación en nueva máquina

### Requisitos
- Arch Linux + Omarchy instalado
- `git` y `stow` (opcional, el script usa symlinks nativos)

### Opción A: Script automático (recomendado)

```bash
# Clonar repo
git clone https://github.com/CJ-Montero/omarchy-config.git ~/dotfiles/omarchy-config

# Ejecutar instalador
cd ~/dotfiles/omarchy-config
./install.sh

# Aplicar cambios
omarchy restart shell && hyprctl reload

# Verificar errores
hyprctl configerrors
```

### Opción B: Manual con GNU Stow

```bash
# Instalar stow
sudo pacman -S stow

# Clonar
git clone https://github.com/CJ-Montero/omarchy-config.git ~/dotfiles/omarchy-config

# Deploy
cd ~/dotfiles/omarchy-config
stow -t ~/.config hypr omarchy alacritty foot kitty ghostty btop git lazygit
# Starship (si se usa)
[[ -f starship.toml ]] && stow -t ~/ starship.toml

# Aplicar
omarchy restart shell && hyprctl reload
```

### Opción C: Symlinks manuales

```bash
git clone https://github.com/CJ-Montero/omarchy-config.git ~/dotfiles/omarchy-config

ln -sfn ~/dotfiles/omarchy-config/hypr ~/.config/hypr
ln -sfn ~/dotfiles/omarchy-config/omarchy ~/.config/omarchy
ln -sfn ~/dotfiles/omarchy-config/alacritty ~/.config/alacritty
ln -sfn ~/dotfiles/omarchy-config/foot ~/.config/foot
ln -sfn ~/dotfiles/omarchy-config/kitty ~/.config/kitty
ln -sfn ~/dotfiles/omarchy-config/ghostty ~/.config/ghostty
ln -sfn ~/dotfiles/omarchy-config/btop ~/.config/btop
ln -sfn ~/dotfiles/omarchy-config/git ~/.config/git
ln -sfn ~/dotfiles/omarchy-config/lazygit ~/.config/lazygit
[[ -f ~/dotfiles/omarchy-config/starship.toml ]] && ln -sfn ~/dotfiles/omarchy-config/starship.toml ~/.config/starship.toml

omarchy restart shell && hyprctl reload
```

## Actualizar configuración

```bash
cd ~/dotfiles/omarchy-config
git pull
./install.sh  # o re-ejecutar stow/manual
omarchy restart shell && hyprctl reload
```

## Keybindings principales (ver `hypr/bindings.lua`)

| Tecla | Acción |
|-------|--------|
| `SUPER + Return` | Terminal |
| `SUPER + D` | Launcher (rofi/wofi) |
| `SUPER + E` | File manager |
| `SUPER + Q` | Cerrar ventana |
| `SUPER + Shift + Q` | Kill window |
| `SUPER + [1-9]` | Workspace |
| `SUPER + Shift + [1-9]` | Mover a workspace |
| `SUPER + Mouse` | Mover/redimensionar ventana |
| `SUPER + Scroll` | Cambiar workspace |

## Temas

Cambiar tema:
```bash
omarchy theme set <nombre>
# Ejemplos:
omarchy theme set artemis
omarchy theme set florida-man
omarchy theme set spacex
```

Ver temas disponibles:
```bash
omarchy theme list
```

## Plugins

Los plugins `cjmontero.*` se activan automáticamente al copiar `omarchy/plugins/` a `~/.config/omarchy/plugins/`.

Para clonar/crear nuevos:
```bash
omarchy plugin clone <nombre>
```

## Hooks

Automatizaciones en `omarchy/hooks/` (ej: al cambiar tema, al iniciar sesión, etc.).

Instalar nuevo hook:
```bash
omarchy hook install <evento> <script>
```

## Troubleshooting

### Config no aplica
```bash
hyprctl reload
omarchy restart shell
```

### Errores de sintaxis Hyprland
```bash
hyprctl configerrors
```

### Resetear a defaults
```bash
omarchy refresh hyprland
omarchy refresh shell
```

### Logs
```bash
journalctl --user -u hyprland -f
journalctl --user -u omarchy-shell -f
```

## Estructura de directorios

```
~/.config/
├── hypr/              ← symlink a dotfiles/omarchy-config/hypr
├── omarchy/           ← symlink a dotfiles/omarchy-config/omarchy
├── alacritty/         ← symlink a dotfiles/omarchy-config/alacritty
├── foot/              ← symlink a dotfiles/omarchy-config/foot
├── kitty/             ← symlink a dotfiles/omarchy-config/kitty
├── ghostty/           ← symlink a dotfiles/omarchy-config/ghostty
├── btop/              ← symlink a dotfiles/omarchy-config/btop
├── git/               ← symlink a dotfiles/omarchy-config/git
├── lazygit/           ← symlink a dotfiles/omarchy-config/lazygit
└── starship.toml      ← symlink a dotfiles/omarchy-config/starship.toml
```

## Licencia

Configuración personal - úsala como referencia.