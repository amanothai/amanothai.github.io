# Setup
setup:
	@echo "\033[0;34mSetting up project...\033[0m"
	nvm install 22.15.0
	nvm use 22.15.0
	@echo "\033[0;34mInstalling dependencies...\033[0m"
	yarn install
	@echo "\033[0;32mSetup Completed\033[0m"

# Development
dev:
	@echo "\033[0;34mStarting development server...\033[0m"
	yarn run dev

build:
	@echo "\033[0;34mBuilding project...\033[0m"
	yarn build

prod:
	@echo "\033[0;34mBuilding for production...\033[0m"
	yarn build
	@echo "\033[0;34mStarting production server...\033[0m"
	yarn start