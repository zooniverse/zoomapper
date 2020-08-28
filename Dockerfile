FROM klokantech/tileserver-gl:v2.6.0

WORKDIR /usr/src/

RUN chown -R node:node /usr/src
USER node

COPY ./ /usr/src