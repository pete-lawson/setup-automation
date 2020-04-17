update_conda() {
    echo "Updating Anaconda Python"
    conda update --all
}

install_git() {
    echo "Installing Git and Configuring Github"
    conda install git
    git config --global user.name "Pete Lawson"
    git config --global user.email "geekypete@gmail.com"
    ssh-keygen -t rsa -b 4096 -C "geekypete@gmail.com"
    eval "$(ssh-agent -s)"
    curl -u "$GITUSER:$GITPASS" --data '{"title":"$MACHINETITLE","key":"'"$(cat ~/.ssh/id_rsa.pub)"'"}' https://api.github.com/$GITUSER/keys
}

install_emacs() {
    echo "Installing Emacs and Spacemacs"
    conda install -c conda-forge emacs
    cd ~
    rm -r .emacs.d/
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    cd .emacs.d/
    git checkout develop
    cd ~
    rm .spacemacs .spacemacs.env
    git clone git@github.com:pete-lawson/.spacemacs.d.git
}

install_neovim() {
    echo "Installing Neovim"
    conda install -c conda-forge neovim
}

install_fonts() {
    echo "Installing Adobe Source Code Pro font"
    cd ~/Downloads
    wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
    if [ ! -d "~/.fonts" ] ; then
        mkdir ~/.fonts
    fi
    unzip 1.050R-it.zip 
    cp source-code-pro-*-it/OTF/*.otf ~/.fonts/
    rm -rf source-code-pro* 
    rm 1.050R-it.zip 
    cd ~/
    fc-cache -f -v
}

setup_development() {
    "Cloning development repositories"
    cd ~/Documents
    mkdir dev
    cd dev
    git clone git@github.com:compTAG/prostate-topology.git
}

install_all() {
    update_conda
    install_git
    install_fonts
    install_emacs
    install_neovim
    setup_development
}

install_all
