FROM bl4nk404/audiovault:latest

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl unzip \
    && rm -rf /var/lib/apt/lists/* \
    && export DENO_INSTALL=/usr/local \
    && curl -fsSL https://deno.land/install.sh | sh \
    && chmod +x /usr/local/bin/deno

COPY --chown=appuser:appuser app/services/download_manager.py /app/app/services/download_manager.py
COPY --chown=appuser:appuser app/services/youtube_service.py /app/app/services/youtube_service.py

USER appuser
