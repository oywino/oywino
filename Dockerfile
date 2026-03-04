#Dockerfile
FROM docker:27-cli AS dockercli

ARG OPENCLAW_TAG=latest
FROM ghcr.io/openclaw/openclaw:${OPENCLAW_TAG}
USER root
COPY --from=dockercli /usr/local/bin/docker /usr/local/bin/docker
USER node

CMD ["node", "/app/dist/index.js", "gateway", "run"]
