FROM haskell:8

EXPOSE 3000

WORKDIR /opt/bingo

RUN cabal new-update

COPY . /opt/bingo

# Docker will cache this command as a layer, freeing us up to
# modify source code without re-installing dependencies
# (unless the .cabal file changes!)
RUN cabal new-install --only-dependencies -j

RUN cabal new-install --overwrite-policy=always -j

CMD ["bingo"]
