FROM docker.io/rust as builder
WORKDIR /app
COPY . .
RUN cargo build --release --bin hackernews_tui

FROM debian:bullseye-slim
COPY --from=builder /app/target/release/hackernews_tui /usr/local/bin/hackernews_tui
ENTRYPOINT ["hackernews_tui"]
