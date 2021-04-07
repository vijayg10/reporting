FROM node:lts-alpine as builder

RUN apk add --no-cache git

WORKDIR /opt/reporting

COPY package.json package-lock.json* /opt/reporting/
COPY patches /opt/reporting/patches
COPY src /opt/reporting/src

RUN npm ci --production --unsafe-perm

FROM node:lts-alpine

WORKDIR /opt/reporting

COPY --from=builder /opt/reporting .

EXPOSE 3000
CMD ["npm", "start"]
