# You should always specify a full version here to ensure all of your developers
# are running the same version of Node.
FROM node:6.11.3

# Install and configure `serve`.
RUN npm install -g serve
CMD serve -s build
EXPOSE 3000

# Install all dependencies of the current project.
COPY package.json package.json
RUN npm install

# Copy all local files into the image.
COPY . .

# Build for production.
RUN npm run build --production
