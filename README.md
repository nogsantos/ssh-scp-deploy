# SSH-SCP Deploy action

Action to send  dist files to a remote server with  scp command

## Required params

- `src`: Source dir to deploy
- `host`: SSH address
- `remote`: Remote dir path
- `port`: SSH Port
- `user`: SSH User name
- `key`: Private key
- `options` : Extra options for scp


### To publish

You must generate the ssh key and publish the public pair on your host. On git secrets, publish your private key

Ex.:

```bash
ssh-keygen -t rsa -b 4096 -f ssh_publish -C <some@name>
```

## Example

This is a nuxt universal application

```yml
name: MasterCI

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    name: Build and Deploy

    steps:
      - uses: actions/checkout@master

      - name: Bucket actions
        uses: actions/setup-node@v1
        with:
          node-version: 8
      - run: npm i
      - run: npm run test
      - run: npm run generate
      
      - name: Publish
        uses: nogsantos/scp-deploy@master
        with:
          src: ./dist/*
          host: ${{ secrets.SSH_HOST }}
          remote: ${{ secrets.SSH_DIR }}
          port: ${{ secrets.SSH_PORT }}
          user: ${{ secrets.SSH_USER }}
          key: ${{ secrets.SSH_KEY }}
```
