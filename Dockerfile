FROM ruby:2.5.7

RUN apt-get update -qq && \
    apt-get install -y build-essential nodejs
RUN mkdir /app
WORKDIR /app
CMD ["/bin/bash"]