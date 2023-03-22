// here's an example Solidity contract 
that checks the eligibility of a wallet
and allows them to claim a reward 
if they have a specific NFT:

In Airdropnft, we check specific nft and user can clam airdrop
while in airdrop only admin assign the whitelist.

In this example contract, there are a few key components:
1) The 'nft' variable is an instance of the ERC721 NFT 
    contract that the airdrop is based on. 
    This will be used to check if an address has the required NFT.
2) 'The rewardAmount' variable specifies how much the reward is for claiming the airdrop.

3) The whitelist will be the list of addresses that have the required NFT.

