# Use the official Node.js image as the base image
FROM node 

# Create a new user named "sankalp" with /bin/bash as the default shell
RUN useradd -ms /bin/bash sankalp

# Create a directory named "app" and set ownership to the "sankalp" user
RUN mkdir app && chown -R sankalp:sankalp /app

# Set the home directory for the "sankalp" user
ENV HOME /home/sankalp

# Switch to the "sankalp" user
USER sankalp

# Set the working directory to /app
WORKDIR /app

# Copy the package.json file to the working directory
COPY package.json .

# Set the PATH environment variable
ENV PATH /home/sankalp/app/node_modules/.bin:$PATH

# Copy the application files to the working directory
COPY . .

# Install Node.js dependencies
RUN npm install

# Expose port 3000 for the application
EXPOSE 3000

# Define the default command to run when the container starts
CMD ["npm", "start"]
