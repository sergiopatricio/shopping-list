FROM ruby:3.2.2

RUN apt-get update -qq

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . .

RUN bin/rails assets:precompile

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
