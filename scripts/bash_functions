#!/usr/bin/env bash

### BASH FUNCTION

# Quickly change to directory
ff() {
	local selected_dir
	selected_dir=$(fd --hidden --type directory . "$HOME" | fzf-tmux \
		-p \
		--header "Select Directory" \
		--layout=reverse \
		--border=sharp \
		--cycle \
		-h 40%)
	if [ -n "$selected_dir" ]; then
		if [ -d "$selected_dir" ]; then
			printf "Moving to \033[34m%s\033[0m\n" "$selected_dir"
			cd "$selected_dir" || return 1
		else
			echo "Selected directory does not exist: $selected_dir"
			return 1
		fi
	else
		echo "No directory selected."
	fi
}

# conda env
con() {
	if [ -n "$1" ]; then
		if [ -n "$2" ]; then
			conda create -n "$1" python="$2"
		else
			conda create -n "$1" python
		fi
	else
		choice=(
			$(
				conda env list |
					sed 's/\*/ /;1,2d' |
					xargs -I {} bash -c '
						name_path=( {} );
						py_version=( $(${name_path[1]}/bin/python --version) );
						echo ${name_path[0]} ${py_version[1]} ${name_path[1]}
						' |
					column -t |
					fzf-tmux \
						-p \
						--header "Conda Environment" \
						--layout=reverse \
						--cycle \
						--border=sharp \
						-w 35% \
						-h 40%
			)
		)
		[[ -n "$choice" ]] && conda activate "$choice"
	fi
}

# Extract for common file format
SAVEIFS=$IFS
IFS="$(printf '\n\t')"

function extract {
	if [ $# -eq 0 ]; then
		# display usage if no parameters given
		echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz|.zlib|.cso|.zst>"
		echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
	fi
	for n in "$@"; do
		if [ ! -f "$n" ]; then
			echo "'$n' - file doesn't exist"
			return 1
		fi

		case "${n%,}" in
		*.cbt | *.tar.bz2 | *.tar.gz | *.tar.xz | *.tbz2 | *.tgz | *.txz | *.tar)
			tar zxvf "$n"
			;;
		*.lzma) unlzma ./"$n" ;;
		*.bz2) bunzip2 ./"$n" ;;
		*.cbr | *.rar) unrar x -ad ./"$n" ;;
		*.gz) gunzip ./"$n" ;;
		*.cbz | *.epub | *.zip) unzip ./"$n" ;;
		*.z) uncompress ./"$n" ;;
		*.7z | *.apk | *.arj | *.cab | *.cb7 | *.chm | *.deb | *.iso | *.lzh | *.msi | *.pkg | *.rpm | *.udf | *.wim | *.xar | *.vhd)
			7z x ./"$n"
			;;
		*.xz) unxz ./"$n" ;;
		*.exe) cabextract ./"$n" ;;
		*.cpio) cpio -id <./"$n" ;;
		*.cba | *.ace) unace x ./"$n" ;;
		*.zpaq) zpaq x ./"$n" ;;
		*.arc) arc e ./"$n" ;;
		*.cso) ciso 0 ./"$n" ./"$n.iso" &&
			extract "$n.iso" && \rm -f "$n" ;;
		*.zlib) zlib-flate -uncompress <./"$n" >./"$n.tmp" &&
			mv ./"$n.tmp" ./"${n%.*zlib}" && rm -f "$n" ;;
		*.dmg)
			hdiutil mount ./"$n" -mountpoint "./$n.mounted"
			;;
		*.tar.zst) tar -I zstd -xvf ./"$n" ;;
		*.zst) zstd -d ./"$n" ;;
		*)
			echo "extract: '$n' - unknown archive method"
			return 1
			;;
		esac
	done
}

IFS=$SAVEIFS

# Gitignore
gi() {
	curl -sL https://www.toptal.com/developers/gitignore/api/$@
}
