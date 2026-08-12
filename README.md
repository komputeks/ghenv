# ghenv

Simple dotenv-to-GitHub-secrets uploader for GitHub CLI.

`ghenv` is a small Bash wrapper around `gh secret set`.

It lets you maintain secrets in a local dotenv file and upload the entire
file to GitHub without manually running `gh secret set` for every variable.

## Requirements

- Termux
- GitHub CLI (`gh`)
- authenticated GitHub CLI

Check authentication:

    gh auth status

## Install

Run:

    curl -fsSL https://raw.githubusercontent.com/komputeks/ghenv/main/install.sh | bash

Then:

    ghenv version

## dotenv file

Example:

    API_KEY=123
    BLA_BLA=456
    DATABASE_URL=postgres://example

Do not commit this file to Git.

## Repository secrets

Upload everything as repository secrets:

    ghenv push \
      --repo OWNER/REPO \
      --file /sdcard/secrets.env

## Environment secrets

Upload to a GitHub Actions environment:

    ghenv push \
      --repo OWNER/REPO \
      --file /sdcard/secrets.env \
      --env production

For example:

    ghenv push \
      --repo komputeks/myapp \
      --file /sdcard/secrets.env \
      --env production

## Application-specific secrets

GitHub supports application-specific secrets.

Actions:

    ghenv push \
      --repo OWNER/REPO \
      --file /sdcard/secrets.env \
      --app actions

Agents:

    ghenv push \
      --repo OWNER/REPO \
      --file /sdcard/secrets.env \
      --app agents

Dependabot:

    ghenv push \
      --repo OWNER/REPO \
      --file /sdcard/secrets.env \
      --app dependabot

Codespaces:

    ghenv push \
      --repo OWNER/REPO \
      --file /sdcard/secrets.env \
      --app codespaces

## Organization secrets

For organization-level secrets:

    ghenv push \
      --org ORGANIZATION \
      --file /sdcard/secrets.env \
      --app actions

or:

    ghenv push \
      --org ORGANIZATION \
      --file /sdcard/secrets.env \
      --app codespaces

## Security

The dotenv file is never uploaded as a normal GitHub file.

`gh` encrypts secret values before sending them to GitHub.

Never commit your `.env` or `secrets.env` file to a repository.

Add it to `.gitignore`:

    *.env
    .env
    secrets.env

## License

MIT