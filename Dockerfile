FROM ubuntu:20.04


COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN useradd -m proxy_user && \
    apt-get update && \
    apt-get install -y openssh-server && \
    chmod +x /docker-entrypoint.sh

EXPOSE 22

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
CMD while true; do echo "default arg" && sleep 1; done
