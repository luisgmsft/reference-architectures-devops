FROM microsoft/azure-cli

RUN apk add --no-cache nodejs && \
    npm install -g @mspnp/azure-building-blocks && \
    mkdir src && cd src && \
    git clone https://github.com/mspnp/reference-architectures.git

COPY rastesting.sh src/rastesting.sh
RUN chmod +x src/rastesting.sh

#CMD ["cd", "src/"]
#ENTRYPOINT [ "./rastesting.sh" ]

# Still WIP
ENTRYPOINT [ "top" ]