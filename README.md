# NixOS Configuration

This repository contains my personal NixOS configuration for my desktop and laptop.

## Structure

The configuration is managed as a Nix Flake. The main flake is in `flake.nix`.

- `hosts/`: Contains the machine-specific configurations.
  - `hosts/common/`: Shared configuration for all machines.
  - `hosts/desktop/`: Configuration specific to my desktop.
  - `hosts/laptop/`: Configuration specific to my laptop.
- `home/`: Contains the home-manager configurations, which manage user-level packages and dotfiles.

## Installation

1.  **Clone the repository**

    ```bash
    git clone <repository-url>
    cd <repository-name>
    ```

2.  **Generate hardware configuration (for a new machine)**

    If you are setting up a new machine, you need to generate a hardware configuration file.

    For the laptop, for example, run the following command on the machine:

    ```bash
    nixos-generate-config --show-hardware-config > hosts/laptop/hardware.nix
    ```

    This will create a `hardware.nix` file with the hardware-specific settings for your machine. You should place this file in the corresponding host directory.

3.  **Build the configuration**

    You can build the configuration for a specific host using the `nixos-rebuild` command with the flake output.

    **For the desktop:**

    ```bash
    sudo nixos-rebuild switch --flake .#desktop
    ```

    **For the laptop:**

    ```bash
    sudo nixos-rebuild switch --flake .#laptop
    ```

    The `switch` command will build the new configuration and make it the current generation.
