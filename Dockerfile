FROM ubuntu:22.04 AS ubuntu2204jammybuild
RUN ./bootstrap.sh

FROM ubuntu:24.04 AS ubuntu2404noblebuild

