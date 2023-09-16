# Use an official Jekyll image as the base image
FROM jekyll/jekyll:latest

# Set the working directory to /srv/jekyll
WORKDIR /srv/jekyll

# Copy the contents of your Jekyll site into the container (assuming it's in the current directory)
COPY . .

# Change ownership of /usr/gem to the 'jekyll' user
RUN chown -R jekyll /usr/gem/

# Create a new Jekyll site with a specified site name
ARG site_name
RUN jekyll new $site_name

# Change the working directory to the newly created site directory
WORKDIR $site_name
