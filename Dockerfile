# Use a vulnerable base image
FROM node:slim

# Create app directory
WORKDIR /usr/src/app

# Copy application source code
COPY src/ .

# Install application dependencies
RUN npm install

# Define environment variable
ENV NODE_ENV=production

# Expose port 8080
EXPOSE 8080

# Start the application
CMD ["node", "app.js"]
