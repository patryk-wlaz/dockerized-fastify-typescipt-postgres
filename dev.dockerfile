FROM node:11.14.0-alpine

# setup paths
ARG ROOT_PATH=/var/www/app
RUN mkdir -p $ROOT_PATH

# set env
ENV NODE_ENV=dev

# Define working directory
WORKDIR $ROOT_PATH

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# No copy, we use volumes for development

# Expose port used by app
EXPOSE $PORT

# Run app as non root user due to security reasons
#USER node

# Run app
CMD ["npm", "run", "dev"]
