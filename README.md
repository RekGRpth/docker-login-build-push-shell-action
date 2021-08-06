# docker login build push shell action

## 1) docker login to defined registry
## 2) docker build current workflow repository
## 3) docker push to defined registry

### usage

```yml
- uses: rekgrpth/docker-login-build-push-shell-action@v1
  with:
    image: repo # image name to build, default: current workflow repository name
    password: ${{ github.token }} # password to docker login to registry, default ${{ github.token }}
    registry: ghcr.io # docker registry, default: ghcr.io
    tag: master # tag, default: current workflow branch (usually it is repository default branch (usually it is master))
    username: ${{ github.repository_owner }} # username to docker login to registry, default: ${{ github.repository_owner }}
```
