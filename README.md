# Python-Docker development container

A Python development container for [Visual Studio Code](https://code.visualstudio.com/) with [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension. It is a linux environment based on the latest LTS distribution of debian and the image is based on `python:latest` by Docker. It contains a few different versions of `Python` as well as `Pip`. It is installed with [Oh My Bash](https://ohmybash.nntoan.com/). Directory `/home/vscode/.local/bin` is added to path to allow for easier use of CLI applications installed from pip. Pip version check is also turned off.

## Example

Create `.devcontainer/devcontainer.json` to project with the content,

```r json
{
    "name": "",
    "image": "exterex/python-dev",
    "extensions": [
        "ms-python.python"
    ]
}
```

For configuration of `devcontainer.json` see [code.visualstudio.com](https://code.visualstudio.com/docs/remote/devcontainerjson-reference).

## Build

The image is updated every time the `main` branch of the repository is updated and once a week on a fixed schedule (see [workflows/ci.yml](.github/workflows/ci.yml)).

## License

This repository is distributed under `MIT`. For more information see [LICENSE](LICENSE).
