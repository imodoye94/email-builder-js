# Use a Node.js base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy only the editor-sample package directory
COPY ./packages/editor-sample/package*.json ./packages/editor-sample/

# Change to the editor-sample directory and install dependencies
WORKDIR /app/packages/editor-sample
RUN npm install

# Copy the entire project to the container (to include all files in editor-sample)
WORKDIR /app
COPY ./packages/editor-sample ./packages/editor-sample

# Expose the Vite development server port
EXPOSE 5173

# Command to start the Vite server
WORKDIR /app/packages/editor-sample
CMD ["npx", "vite", "--host", "0.0.0.0"]
