FROM racket/racket

WORKDIR /app
COPY . .

RUN raco pkg install --auto --batch rackunit-lib && \
    raco pkg install --auto --batch --link mypkg

VOLUME ["/app/shared"]

# Override parent image's command ("racket")
CMD ["bash"]
