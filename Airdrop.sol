// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Airdrop is Ownable {
    IERC721 public nft;
    uint public rewardAmount;

    mapping(address => bool) public whitelist;

    constructor(IERC721 _nft, uint _rewardAmount) {
        nft = _nft;
        rewardAmount = _rewardAmount;
    }

    function addToWhitelist(address[] memory addresses) external onlyOwner {
        for (uint i = 0; i < addresses.length; i++) {
            whitelist[addresses[i]] = true;
        }
    }

    function removeFromWhitelist(address[] memory addresses) external onlyOwner {
        for (uint i = 0; i < addresses.length; i++) {
            whitelist[addresses[i]] = false;
        }
    }


    function claimReward() external {
        require(whitelist[msg.sender], "Address not whitelisted");
        require(nft.balanceOf(msg.sender) > 0, "Address does not have NFT");

        // Transfer reward to the caller
        payable(msg.sender).transfer(rewardAmount);
    }
}