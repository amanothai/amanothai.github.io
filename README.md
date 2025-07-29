# Amano Document Website

## Requirements

[Node.js v.22.15.0 (LTS)](https://nodejs.org/en)

[NVM (Node Version Manager)](https://nodejs.org/en/download) - Optional

## Installation
### Use Make (require NVM)
This command will set everything up and ready.
```bash
make setup
```

Then

```bash
make dev
```
To start the dev environment

### Use NVM

```bash
nvm install 22.15.0
```

Then

```bash
nvm use 22.15.0
```

### Use PNPM

```bash
$ pnpm i
```

### Local Development

```bash
$ pnpm start
```

This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.

### Build

```bash
$ pnpm build
```

This command generates static content into the `build` directory and can be served using any static contents hosting service.
