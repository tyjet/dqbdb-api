# https://hub.docker.com/_/ruby
FROM ruby:2.5.1

WORKDIR /app

# Copy Gemfile and Gemfile.lock to the container.
COPY Gemfile* /app/

# Do not allow changes to the production container.
RUN bundle config --local frozen 1

# Only install production and staging gems.
RUN bundle install --without test development

# Copy the application to the app directory.
COPY . /app

# Start the server!
CMD puma -C /app/config/puma.rb 
