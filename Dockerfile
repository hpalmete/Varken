FROM lsiobase/alpine.python3

LABEL maintainer="dirtycajunrice"

#ENV branch="master"

RUN \
    git clone --single-branch -b $branch https://github.com/Boerderij/Varken.git /app && \
    python3 -m pip install -r /app/requirements.txt && \
    chown -R abc:abc \
    /config \
    /app

CMD cp /app/data/varken.example.ini /config/varken.example.ini && python3 /app/Varken.py --data-folder /config

VOLUME /config