FROM debian:bullseye-slim AS builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libncurses-dev libfuse3-dev libssl-dev zlib1g-dev

COPY project /wit

WORKDIR /wit
RUN make

FROM scratch as export
COPY --from=builder /wit/bin /
