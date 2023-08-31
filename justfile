lint:
	ansible-lint --write

install:
	ansible-galaxy install -r requirements.yml

run:
	ansible-playbook main.yml --ask-become-pass
