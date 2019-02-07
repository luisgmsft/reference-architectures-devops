FROM microsoft/azure-cli

RUN apk add --no-cache nodejs && \
    npm install -g @mspnp/azure-building-blocks && \
    mkdir src

COPY ./rastesting.sh /
RUN chmod +x rastesting.sh

ENTRYPOINT [ "/rastesting.sh" ]