# Define a container with Dockerfile
#-------------------------------------------------------------------------------

#  Suppose this image chosen is not cpmpromised.
FROM python:3-slim

# Expose environment variables.
#ENV HTTP_PROXY=http://proxy1.cetin:8080 \
	#HTTPS_PROXY=https://proxy1.cetin:8080 \
	#LC_ALL=en_US.utf8 \
	#LANG=en_US.utf8

# Make persistent directory.
RUN mkdir -p /appl

# Set the working directory to /app.
WORKDIR /appl

# Copy files.
COPY test.py /appl/test.py
COPY oracle.py /appl/oracle.py
RUN chmod 0755 /appl/test.py

VOLUME /appl

# dotfiles
COPY .zprezto /root/.zprezto
COPY .vim /root/.vim
COPY .vimrc /root/.vimrc
COPY .vimrc.plug /root/.vimrc.plug
COPY .config /root/.config

# Install any needed packages specified in requirements.txt.
COPY requirements.txt /appl/requirements.txt

RUN ln -s /root/.zprezto/runcoms/zlogin /root/.zlogin && \
	ln -s /root/.zprezto/runcoms/zlogout /root/.zlogout && \
	ln -s /root/.zprezto/runcoms/zpreztorc /root/.zpreztorc && \
	ln -s /root/.zprezto/runcoms/zshrc /root/.zshrc && \
	ln -s /root/.zprezto/runcoms/zshenv /root/.zshenv && \
	ln -s /root/.zprezto/runcoms/zprofile /root/.zprofile

# Install python packages.
RUN pip install --requirement /appl/requirements.txt
#RUN pip install --trusted-host pypi.python.org -r requirements.txt
#RUN pip install openpyxl

# Neco si nainstalujem
RUN apt-get update && apt-get install -y \
	zsh \
	vim \
	file \
	git && chsh -s /usr/bin/zsh root

# CMD specifies what command to run within the container.
CMD [ "python", "/appl/test.py" ]

