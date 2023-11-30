FROM node 
RUN useradd -ms /bin/bash sankalp
RUN mkdir app && chown -R sankalp:sankalp /app
ENV HOME /home/sankalp
USER sankalp
WORKDIR /app
COPY package.json .
ENV PATH /home/sankalp/app/node_modules/.bin:$PATH
COPY . .  
RUN npm install
EXPOSE 3000
CMD ["npm","start"]
