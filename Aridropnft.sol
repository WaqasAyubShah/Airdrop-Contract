// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./IERC721.sol";

contract Airdrop {
    address public nftAddress;
    uint256 public rewardAmount;
    mapping(address => bool) public isEligible;

    constructor(address _nftAddress, uint256 _rewardAmount) {
        nftAddress = _nftAddress;
        rewardAmount = _rewardAmount;
    }

    function checkEligibility(address walletAddress) public view returns (bool) {
        IERC721 nft = IERC721(nftAddress);
        return nft.ownerOf(1) == walletAddress; // Check if wallet owns specific NFT
    }

    function claimReward() public {
        require(isEligible[msg.sender], "You are not eligible for this airdrop");
        isEligible[msg.sender] = false;
        payable(msg.sender).transfer(rewardAmount);
    }
}