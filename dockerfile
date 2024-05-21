FROM node:20.11.1

ARG NODE_ENV

WORKDIR /usr/app

COPY package.json ./
COPY package-lock.json ./
RUN npm ci

COPY . .

USER node

EXPOSE 3000

CMD ["pnpm", "next", "build", "&&", "pnpm", "start"]