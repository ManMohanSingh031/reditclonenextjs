FROM node:18-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

RUN npm install yarn
# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

#RUN npm install -g yarn
RUN yarn prisma generate
# Build the production version of the application
RUN npm run build


# Serve the production version of the application with a static server

EXPOSE 3000

CMD ["npm", "run", "start"]
# Expose port 3000 so that it can be accessed from the host

# Set environment variables
