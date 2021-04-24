FROM haskell:8

WORKDIR /opt/bingo

RUN cabal update

# Add just the .cabal file to capture dependencies
COPY . /opt/bingo

# Docker will cache this command as a layer, freeing us up to
# modify source code without re-installing dependencies
# (unless the .cabal file changes!)
RUN cabal install --only-dependencies -j

RUN cabal install --overwrite-policy=always -j

CMD ["bingo"]
