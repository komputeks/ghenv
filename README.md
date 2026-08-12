# ghenv

Simple dotenv-to-GitHub-secrets-and-variables CLI for GitHub CLI.

`ghenv` is a small Bash wrapper around `gh` for pushing and pulling GitHub secrets and variables.

## Requirements

- Termux
- GitHub CLI (`gh`)
- authenticated GitHub CLI

Check authentication:

    gh auth status

## Install

    curl -fsSL https://raw.githubusercontent.com/komputeks/ghenv/main/install.sh | bash

Then:

    ghenv version

## Push

Repository secrets (default):

    ghenv push \
      --repo OWNER/REPO \
      --file /sdcard/secrets.env

Repository variables:

    ghenv push \
      --repo OWNER/REPO \
      --file /sdcard/vars.env \
      --type variable

Environment secrets:

    ghenv push \
      --repo OWNER/REPO \
      --file /sdcard/secrets.env \
      --env production

If the environment does not exist, `ghenv push` creates it first.

Application-specific targets:

    ghenv push --repo OWNER/REPO --file /sdcard/secrets.env --app actions
    ghenv push --repo OWNER/REPO --file /sdcard/secrets.env --app agents
    ghenv push --repo OWNER/REPO --file /sdcard/secrets.env --app codespaces
    ghenv push --repo OWNER/REPO --file /sdcard/secrets.env --app dependabot

## Pull

Secret pulls retrieve names only:

    ghenv pull \
      --repo OWNER/REPO \
      --file /sdcard/secrets.env

Result:

    API_KEY=
    DATABASE_PASSWORD=

Variable pulls retrieve names and values:

    ghenv pull \
      --repo OWNER/REPO \
      --file /sdcard/vars.env \
      --type variable

If the destination file already exists, `pull` refuses to overwrite it unless `--force` is supplied.

    ghenv pull \
      --repo OWNER/REPO \
      --file /sdcard/vars.env \
      --type variable \
      --force

A missing environment is an error for `pull`; it is never created automatically.

## Dry run

    ghenv push \
      --repo OWNER/REPO \
      --file /sdcard/secrets.env \
      --dry-run

## Security

Secret values are never retrieved by `ghenv pull`. Secret pulls write names with empty values.

Never commit `.env` or `secrets.env` files.

## License

MIT
