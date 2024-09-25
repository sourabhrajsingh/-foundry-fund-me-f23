-include .env

build:
	forge build

test-unit:
	forge test

deploy-sepolia:
	forge script script/DeployFundMe.s.sol --rpc-url $(SEPOLIA_RPC_URL) --account testDevKey --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
