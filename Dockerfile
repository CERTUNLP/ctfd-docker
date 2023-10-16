FROM ctfd/ctfd:latest

# Install git
USER root
RUN apt-get update && apt-get install -y git

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Switch back to non-root user
USER ctfd
ENTRYPOINT ["/entrypoint.sh"]
