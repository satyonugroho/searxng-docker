# filepath: d:\Dev\searxng-docker\Dockerfile.cloudrun
FROM searxng/searxng:latest

# Expose port that Cloud Run will use
EXPOSE 8080

# Cloud Run requires your application to listen on $PORT
ENV PORT=8080

# Copy any custom configuration
COPY searxng.yaml /etc/searxng/searxng.yaml

# Command to start SearXNG
CMD ["uwsgi", "--master", "--http-socket", "0.0.0.0:8080", "--plugin", "python", "--module", "searx.webapp"]