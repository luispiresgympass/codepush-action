FROM node:20

LABEL version="2.0.0"
LABEL repository="https://github.com/luispiresgympass/codepush-action"
LABEL homepage="https://github.com/luispiresgympass/codepush-action"
LABEL maintainer="Luis Pires <luis.pires@gympass.com>"

LABEL com.github.actions.name="GitHub Action for Codepush Standalone CLI"
LABEL com.github.actions.description="Wraps the codepush-standalone CLI to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

RUN git clone https://github.com/microsoft/code-push-server.git
RUN cd code-push-server && cd cli && npm install && npm run build && npm install -g

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]