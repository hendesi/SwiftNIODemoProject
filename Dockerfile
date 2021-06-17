# FROM th089/swift as build
# FROM hendesi/master-thesis:offical-swift-arm as build
FROM swiftlang/swift:nightly-5.5-focal as build

# Install OS updates and, if needed, sqlite3
RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && export QEMU_CPU=max \
    && apt-get -q update \
    && apt-get -q dist-upgrade -y \
    && apt-get -q install -y qemu \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /build

COPY . .

# RUN swift build -Xswiftc -Xfrontend -Xswiftc -sil-verify-none -c release -j 1 -v
RUN swift build -j 1 -c release -v

WORKDIR /staging

RUN cp "$(swift build --package-path /build -c release --show-bin-path)/Test" ./

# FROM hendesi/master-thesis:offical-swift-arm
FROM swiftlang/swift:nightly-5.5-focal

WORKDIR /app

COPY --from=build /staging /app

ENTRYPOINT ["./Test"]

# COPY --from=builder /hello-world .
# RUN ["$(swift build --package-path /app/hello-world -c release --show-bin-path)/hello-world"]
