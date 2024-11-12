# Vite App Bootstrap Script

This is a bash script that sets up a new Vite app with some additional features and configurations.

## tl;dr

```console
curl -sSL https://raw.githubusercontent.com/gpt-partners/web-starter/master/bootstrap.sh | bash
```

## Features
- Initializes a new Preact app using npm init preact app
- Installs necessary dependencies for Tailwind CSS, PostCSS, Autoprefixer, and other libraries
- Initializes Tailwind CSS configuration with default settings and adds custom configurations
- Adds custom CSS styles to the project
- Creates utility functions for class names merging
- Modifies some configuration files in the project, such as tsconfig.json, package.json, and vite.config.ts
- Initializes Shadcn/UI components in the project
- Sets up Prettier with Tailwind CSS plugin

## Usage
1. Save the script to a file, for example, bootstrap.sh
1. Make the script executable by running the command chmod +x bootstrap.sh
1. Run the script with the command ./bootstrap.sh
1. The script will create a new directory called app and install all necessary dependencies and configurations in it.

## Notes
- The script assumes that you have `npm` and `node` installed on your system
- The script modifies some configuration files in the project, so make sure to review the changes before committing them to version control
- The script initializes Shadcn/UI components in the project, so make sure to review the added components and their usage before using them in your project
- The script sets up Prettier with Tailwind CSS plugin, so make sure to install the necessary dependencies and configure your editor to use Prettier for formatting

## License
This script is released under the MIT License. See the LICENSE file for details.