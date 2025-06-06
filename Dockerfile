FROM nginx:alpine

# Copy the HTML file and favicon directory to the nginx html directory
COPY index.html /usr/share/nginx/html/
COPY favicon/ /usr/share/nginx/html/favicon/

# Expose port 80
EXPOSE 80

# nginx will start automatically with the base image
