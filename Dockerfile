# 1. Specify the base image (e.g., node, python, rust)
FROM node:20-alpine

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy dependency files and install them
COPY package*.json ./
RUN npm install

# 4. Copy the rest of your application code
COPY . .

# 5. Expose the port your app runs on
EXPOSE 3000

# 6. Define the command to run your application
CMD ["npm", "start"]
