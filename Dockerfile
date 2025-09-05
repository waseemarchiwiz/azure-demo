# Use Node.js version 20 LTS as the base image
FROM node:20

WORKDIR /app

COPY package*.json ./
RUN npm install --force
COPY . .

ARG VITE_API_URL
ENV VITE_API_URL=$VITE_API_URL

RUN echo "Building with VITE_API_URL=$VITE_API_URL"
RUN npm run build

EXPOSE 80
CMD ["npm", "run", "preview", "--", "--host", "--port", "80"]
