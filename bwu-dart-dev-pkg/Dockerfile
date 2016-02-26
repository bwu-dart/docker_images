FROM zoechi/bwu-dart-dev:latest

RUN \
  mkdir /dummy_dart_app

COPY pubspec.yaml /dummy_dart_app/
COPY pubspec.lock /dummy_dart_app/
WORKDIR /dummy_dart_app
RUN \
  ls -la && \
  pub upgrade 
WORKDIR /app
