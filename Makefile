VERSION := $(shell jq '.metadata.version' < agent/puppet_env.json)
VENDOR := optiz0r
AGENT := puppet_env
DIST_DIR := dist
MODULE_FILE := ${VENDOR}-mcollective_agent_${AGENT}-${VERSION}.tar.gz
FORGE_URL := https://forgeapi.puppet.com/v3/releases
FORGE_TOKEN_FILE := ~/.puppet_forge.token
FORGE_TOKEN := $(shell test -f ${FORGE_TOKEN_FILE} && cat ${FORGE_TOKEN_FILE})

default: puppet-module

puppet-module: ${DIST_DIR}/${MODULE_FILE}

agent/puppet_env.json:
	choria tool generate ddl agent/puppet_env.json

agent/puppet_env.ddl: agent/puppet_env.json
	choria tool generate ddl agent/puppet_env.json agent/puppet_env.ddl

puppet/CHANGELOG.md: CHANGELOG.md
	cp CHANGELOG.md puppet/

puppet/LICENSE: LICENSE
	cp LICENSE puppet/

${DIST_DIR}:
	mkdir -p ${DIST_DIR}

${DIST_DIR}/${MODULE_FILE}: puppet/CHANGELOG.md puppet/LICENSE agent/puppet_env.ddl
	/opt/puppetlabs/puppet/bin/mco plugin package --vendor ${VENDOR} --pluginversion ${VERSION} -v .
	mv ${MODULE_FILE} ${DIST_DIR}/

publish: ${DIST_DIR}/${MODULE_FILE}
	curl -X POST --header "Authorization: Bearer ${FORGE_TOKEN}" -F file=@${DIST_DIR}/${MODULE_FILE} ${FORGE_URL}

clean:
	find puppet -mindepth 1 -delete

clobber: clean
	find ${DIST_DIR} -name ${MODULE_FILE} -delete

