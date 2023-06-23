# Solidity Truffle Docker

This Dockerfile provides a Docker image for Solidity development using Truffle and Ganache. It sets up a development environment with Zsh, Oh My Zsh, and various plugins for an enhanced shell experience.

## Features

- Debian Slim-based Docker image
- Zsh as the default shell with Oh My Zsh framework
- Configurable Zsh theme (set to "jonathan" by default)
- Node.js and npm for Solidity development
- Solidity development tools: Truffle and Ganache CLI
- Unzip utility for extracting ZIP files
- Minimal image size for faster build and reduced resource consumption

## Installed Packages

The following packages are installed in the Docker image:

| Package                   | Description                                |
| ------------------------- | ------------------------------------------ |
| curl                      | Command-line tool for URL transfers        |
| gpg                       | GNU Privacy Guard for secure communication |
| git                       | Version control system                      |
| build-essential           | Basic development tools                     |
| zsh                       | Zsh shell                                  |
| vim                       | Text editor                                |
| nano                      | Text editor                                |
| neovim                    | Improved text editor                        |
| fonts-powerline           | Powerline fonts for a better shell look     |
| unzip                     | Utility for extracting ZIP files            |
| nodejs                    | JavaScript runtime environment             |
| npm                       | Package manager for JavaScript              |

## Exposed Ports

The Docker image exposes the following ports for Ganache:

| Port | Description       |
| ---- | ----------------- |
| 8545 | HTTP port         |
| 8546 | HTTPS port        |
| 7545 | WebSocket port    |
| 7546 | WebSocket secure  |

## Usage

To use this Docker image, follow these steps:

1. Build the Docker image:

```bash
   docker build -t solidity-truffle .
```

2. Run a container from the image:

```bash
    docker run -p 8545:8545 -p 8546:8546 -p 7545:7545 -p 7546:7546 -it --name solidity-truffle-dev solidity-container
```

or 

```bash
    docker run -p 8545:8545 -p 8546:8546 -p 7545:7545 -p 7546:7546 -it --name solidity-truffle-dev -v $(pwd):/workspace/host solidity-container
```

to mount the current directory to the container at `/workspace/host`.

This will start a container with the necessary ports exposed for Ganache.

3. Once inside the container, you can start using Solidity development tools

```bash
    truffle init
```

4. You can also open a new terminal window and attach it to the running container

```bash
    docker exec -it solidity-truffle-dev zsh
```

5. Open running container in visual studio code

Use the [Dev Containers extention](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) to open the running container in Visual Studio Code.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
