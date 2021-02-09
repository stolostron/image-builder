
.PHONY: check-token
check-token:
	cut -c1-4 /etc/github/token
	exit 1

