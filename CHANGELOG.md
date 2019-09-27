# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.3] - 2019-09-27
### Added
- Add Makefile to automate build and release process

### Changed
- Update example usage in README
- Revert override of `server_files` list now that generator does the right thing

### Fixed
- Updated project URL in DDL
- Agent file is marked executable

## [0.1.2] - 2019-09-25
### Fixed
- Patch default value of `force` input parameter in generated JSON DDL

## [0.1.1] - 2019-09-24
### Added
- Report status of environment changes

### Changed
- Update layout for compatibility with puppet module generation

### Fixed
- Fix duplicate inclusion of `agent/puppet_env.json` in both `server_files` and `common_files`

## [0.1.0] - 2019-09-24
### Added
- Initial version