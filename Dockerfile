# Base Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install n8n directly using npm
RUN npm install n8n -g

ARG PGPASSWORD
ARG PGHOST
ARG PGPORT
ARG PGDATABASE
ARG PGUSER
ARG ENCRYPTION_KEY

# Set environment variables
ENV NODE_ENV=production
ENV N8N_PORT=5678

ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=railway
ENV DB_POSTGRESDB_HOST=autorack.proxy.rlwy.net
ENV DB_POSTGRESDB_PORT=51260
ENV DB_POSTGRESDB_USER=postgres
ENV DB_POSTGRESDB_PASSWORD=$PGPASSWORD
ENV N8N_ENCRYPTION_KEY=$ENCRYPTION_KEY

# Expose the port n8n runs on
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]