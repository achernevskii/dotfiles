FROM fedora:latest
RUN sudo yum -y install python3 python3-pip
RUN pip3 install ansible
WORKDIR /dotfiles
COPY . .
RUN ansible-playbook bootstrap.yml
USER lexach
