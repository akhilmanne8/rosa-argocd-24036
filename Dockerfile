FROM ubuntu:20.04

# Prevent interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Remove default index page
RUN rm -rf /var/www/html/*

# Copy your static site
COPY index.html /var/www/html/

# Expose nginx port
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
