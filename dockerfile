FROM node:alpine AS base

ARG NODE_ENV

WORKDIR /usr/app

COPY package.json ./
COPY package-lock.json ./
RUN npm ci
RUN npm run build

COPY . .

USER node

EXPOSE 3000

CMD ["npm", "run","dev"]

# Next step: go to nextjs's example dockerfile and also find out why you don't have a pnpm lock file