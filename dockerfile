# Use Debian Slim as the base image
FROM debian:trixie-slim

# Install required packages
RUN apt-get update && apt-get install -y \
    curl \
    gpg \
    git \
    build-essential \
    zsh \
    vim \
    nano \
    neovim \
    fonts-powerline \
    unzip \
    nodejs \
    npm

# Set up Oh My Zsh
RUN ZSH="/root/.oh-my-zsh" \
    && git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH \
    && cp $ZSH/templates/zshrc.zsh-template /root/.zshrc \
    && chsh -s /bin/zsh

# Set the theme in the Zsh configuration
RUN sed -i 's/ZSH_THEME=".*"/ZSH_THEME="jonathan"/' /root/.zshrc

# Add the alias for cls
RUN echo 'alias cls="clear"' >> /root/.oh-my-zsh/custom/aliases.zsh

# Set Zsh as the default shell
RUN chsh -s $(which zsh)

# Install Solidity development tools
RUN npm install -g truffle ganache

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /workspace

# Clone your repository
RUN git clone --depth=1 https://github.com/0xKyran/solidity-truffle-template.git /workspace/solidity-truffle-template \
    && rm -rf /workspace/solidity-truffle-template/.git

# Expose necessary ports for Ganache
EXPOSE 8545 8546 7545 7546

# Set default shell to Zsh
ENV SHELL=/usr/bin/zsh

# Set up entry point for VS Code Remote Development
ENTRYPOINT ["/bin/zsh", "-c", "ganache-cli & /bin/zsh"]
