# Build stage image
FROM node:alpine AS buildStage
WORKDIR /app/

COPY package*.json ./
RUN yarn install --production
COPY . .
RUN yarn build

# Build de production image
FROM node:alpine AS productionStage
WORKDIR /app/

COPY ormconfig.env /app
COPY package.json /app
COPY --from=buildStage /app/build /app/build
COPY --from=buildStage /app/node_modules /app/node_modules

ENTRYPOINT [ "yarn", "run-prod" ]