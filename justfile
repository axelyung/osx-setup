lint:
	ansible-lint --write .

install:
	ansible-galaxy install -r requirements.yml --force

all:
	ansible-playbook --ask-become-pass main.yml
