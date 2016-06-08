# Downloading python version 3.4
FROM python:3.4

# Create uwsgi user and group
# User created in a container do not propogate to host
# Install Flask, uWSGI, request, redis Python modules
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.10.1 uWSGI==2.0.8 requests==2.5.1 redis==2.10.3
# Set working directory to script directory
WORKDIR /app
# Copy script directory
# Copy Shell script
COPY app /app
Copy cmd.sh / 

# Explicitly Declare ports accessible to hosts and other containers
EXPOSE 9090 9191
# Sets user for CMD and ENTRYPOINT
USER uwsgi

# Runs python script
# No longer needed with uWSGI
# CMD ["python", "identidock.py"]

# Start uWSGI http server on port 9090 
# Run app /app/identidcok.py
# Start stats server on port 9191
# Functionality moved to cmd.sh shell script
#CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py", "--callable", "app", "--stats", "0.0.0.0:9191"]

#Run Shell script 
CMD ["/cmd.sh"]
