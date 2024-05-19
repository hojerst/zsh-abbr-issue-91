# Repo to help debug zsh-abbr#91

This repo includes a dockerfile for the bare minimum to reproduce the issue.

The image already includes a `.zsh_history` file to reproduce the issue. You just have to press the `up` arrow key to see the issue.

1. press `up` arrow key -> `ls`
2. press `up` arrow key -> `ls -AlF` (but should show `echo hello`)

For debugging/development you can also just mount a dev-version of zsh-abbr into the container:

## Using prebuilt image

```bash
# use embedded zsh-abbr source
docker run --rm -it hojerst/zsh-abbr-issue-91

# use custom zsh-abbr source (mounted from local folder)
docker run --rm -it -v $PATH_TO_ZSH_ABBR:/root/zsh-abbr hojerst/zsh-abbr-issue-91
```

## Building locally

```bash
# Build the docker image
docker build -t hojerst/zsh-abbr-issue-91 .

# Run the docker image
docker run --rm -it hojerst/zsh-abbr-issue-91
```
