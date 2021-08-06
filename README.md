# docker login build push shell action

## 1) docker login to defined registry
## 2) docker build current workflow repository
## 3) docker push to defined registry

### usage

```yml
- env:
    INPUTS_IMAGE: repo # image name to build, default: current workflow repository name
    INPUTS_PASSWORD: ${{ github.token }} # password to docker login to registry, default ${{ github.token }}
    INPUTS_REGISTRY: ghcr.io # docker registry, default: ghcr.io
    INPUTS_TAG: master # tag, default: current workflow branch (usually it is repository default branch (usually it is master))
    INPUTS_USERNAME: ${{ github.repository_owner }} # username to docker login to registry, default: ${{ github.repository_owner }}
  uses: rekgrpth/docker-login-build-push-shell-action@v1
```
