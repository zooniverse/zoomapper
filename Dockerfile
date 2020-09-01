FROM klokantech/tileserver-gl

WORKDIR /data

COPY ./ /data

CMD ["--verbose", "falklands.mbtiles"]