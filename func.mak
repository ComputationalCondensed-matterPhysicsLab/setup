# Function to check if a package is installed
# Usage
#		1. $(call check-package,INSTALL_TARGET, PACKAGE_NAME,LIB_PATTERN)
#		2. $(INSTALL_TARGET)-check
define package-check
$(1)-check:
	@echo "Checking for $(2) installation..."
	@if [ -z "$(wildcard $(3))" ]; then \
		echo "$(2) not found or incomplete, installing it first..."; \
		$(MAKE) $(1)-install; \
	else \
		echo "$(2) already installed, proceeding..."; \
	fi
endef
