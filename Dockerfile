FROM node:16.19.0

LABEL version="1.1.0"
LABEL repository="https://github.com/luispiresgympass/codepush-action"
LABEL homepage="https://github.com/luispiresgympass/codepush-action"
LABEL maintainer="Luis Pires <luis.pires@gympass.com>"

LABEL com.github.actions.name="GitHub Action for Codepush"
LABEL com.github.actions.description="Wraps the appcenter CLI to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

RUN npm install -g appcenter-cli@2.12.0

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]