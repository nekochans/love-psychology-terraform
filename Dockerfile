FROM hashicorp/terraform:0.12.19

RUN mkdir -p /app/love-psychology-terraform

WORKDIR /app/love-psychology-terraform

ENTRYPOINT ["/bin/sh", "-c", "while true; do echo hello world; sleep 1; done"]
