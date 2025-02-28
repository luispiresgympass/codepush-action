# GitHub Actions for Firebase

This Action for [codepush-standalone](https://github.com/microsoft/code-push-server/tree/main/cli) enables arbitrary actions with the `codepush-standalone` command-line client.

## Inputs

* `args` - **Required**. This is the arguments you want to use for the `codepush-standalone` cli


## Environment variables

* `ACCESS_TOKEN` - **Required**. The token to use for authentication. This token can be aquired through the `cli`.
* `CODEPUSH_SERVER_URL` - **Required**. The URL for the Self hosted Server.

## Example

To authenticate with Codepush, and deploy to Codepush:

```yaml
name: Build and Deploy
on:
  push:
    branches:
      - master

jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@master
      - name: Install Dependencies
        run: npm install
      - name: Deploy to Codepush
        uses: luispiresgympass/codepush-action@master
        with:
          args: release-react -d Production
        env:
          ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
          CODEPUSH_SERVER_URL: ${{ secrets.CODEPUSH_SERVER_URL }}
```


## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).


### Credits
Thanks to [Jeremy Shore](https://github.com/w9jds) for the firebase-action repo.
