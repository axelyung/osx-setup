lint:
	ansible-lint --write

install:
	ansible-galaxy install -r requirements.yml

all:
	ansible-playbook main.yml --ask-become-pass
