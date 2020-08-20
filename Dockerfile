FROM debian:buster-slim

ADD usr.tar.gz /
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && apt update \
    && apt install git universal-ctags ripgrep shellcheck python python3 python-pip python3-pip -y \
    && mv /usr/bin/ctags /usr/bin/uctags \
    && while true; do pip install neovim -i https://pypi.tuna.tsinghua.edu.cn/simple; \
    if [ $?==0 ]; then break; fi; done \
    && while true; do pip3 install neovim -i https://pypi.tuna.tsinghua.edu.cn/simple; \
    if [ $?==0 ]; then break; fi; done \
    && while true; do pip install pylint pycodestyle jedi -i https://pypi.tuna.tsinghua.edu.cn/simple; \
    if [ $?==0 ]; then break; fi; done \
    && chmod a+x /usr/bin/nvim \
    && git clone https://github.com/cqroot/enjoy-vim ~/.config/nvim \
    && cd /root/.config/nvim/ \
    && git submodule update --init \
    && nvim +PlugInstall +qall

