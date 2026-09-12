FROM bl4nk404/audiovault:latest

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl unzip \
    && rm -rf /var/lib/apt/lists/* \
    && export DENO_INSTALL=/usr/local \
    && curl -fsSL https://deno.land/install.sh | sh \
    && chmod +x /usr/local/bin/deno

USER appuser
