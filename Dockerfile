FROM node
WORKDIR /app
COPY package.json .
ENV PATH /app/node_modules/.bin:$PATH
COPY . .  
RUN npm install 
EXPOSE 3000
CMD ["npm","start"]
