#!/bin/bash

echo "Bem Vindo ao instalador de Dotfiles do Jomba"
echo "Todas as modificações serão salvas em um log.txt"
#sleep 5 && clear
touch log.txt

echo "Pastas a serem modificadas"
echo "[ ] .config/bspwm"
echo "[ ] .config/polybar"
echo "[ ] .config/dunst"
echo "[ ] .config/picom"
echo "[ ] .config/rofi"
echo "[ ] .config/kitty"
echo "[ ] .icons (Dark Hackned)"

read -p "Continuar [S/n]: " resposta

while [ $resposta != "S" -a $resposta != "s" -a $resposta != "N" -a $resposta != "n" ]; do
		echo "Resposta fora do padrão esperado, tente novamente"
		read -p "Continuar [S/n]: " resposta
done

if [ $resposta = "S" -o $resposta = "s" ]; then
		echo "Então vamos lá"
		sleep 1 && clear

		echo "Instalando Dependências"
		echo "[x] PlayerCtl"
		yay -S playerctl >> log.txt
		echo "Instalando Fontes"
		echo "[x] JetBrains Mono"
		echo "[x] Otf-takao"
		yay -S nerd-fonts-jetbrains-mono otf-takao >> log.txt
		sleep 5 && clear

		echo "Instalando Programas"
		echo "[x] Polybar"
		echo "[x] Kitty"
		echo "[x] Dunst"
		sudo pacman -S kitty dunst polybar >> log.txt
		sleep 5 && clear

		echo "Substituindo Configurações Padrões"
		echo "[x] .config/bspwm"
		echo "[x] .config/polybar"
		echo "[x] .config/dunst"
		echo "[x] .config/picom"
		echo "[x] .config/rofi"
		echo "[x] .config/kitty"

		echo "Deletando Pastas Padrões"
		rm -rf $HOME/.config/bspwm $HOME/.config/dunst $HOME/.config/polybar $HOME/.config/picom $HOME/.config/rofi $HOME/.config/kitty $HOME/.config/compton
		echo "Movendo do Reposiótio para a pasta .config"
		mv ./config/bspwm $HOME/.config
		mv .config/dunst $HOME/.config
		mv .config/polybar $HOME/.config
		mv .config/picom/picom $HOME/.config
		mv .config/rofi $HOME/.config
		mv .config/kitty $HOME/.config
		mv Wallpaper $HOME

		echo "Instalando Cursor Dark Hackned"
		wget "https://gitlab.com/Enthymeme/hackneyed-x11-cursors/uploads/6d1ec2951f5cc3b93ada59159f32e704/Hackneyed-Dark-0.8-right-handed.tar.bz2" && tar -jxvf Hackneyed-Dark-0.8-right-handed.tar.bz2 >> log.txt
		mv Hackneyed-Dark $HOME/.icons
		sleep 5 && clear
fi

echo "Instalação Concluida com Sucesso. Obrigado por usar o instalador!"