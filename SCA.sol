// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Submission {
    struct bidderValues{
    string SenderBID;
    string pb;
    string bidderVariable;
}

string highestBidder;
// this flag is zero when no stpc protocol is going on and 1 
// whenever two bidders are in stpc phase

uint flag  = 0;

// this value changes as per the needs and timeout can be changed by the auctioneer
uint256 submissionTimeOut =  1717113846;
mapping (string => bidderValues) bidderData;

function bidderEncryptedBidSubmission(string memory targetBID, string memory senderBID 
,string memory pb) public {
    if( block.timestamp < submissionTimeOut){
            bidderData[targetBID]=bidderValues(senderBID,  pb, 'na');
    }
}
function retrieveBidderEncryptedBidSubmission(string memory BID) 
public view returns (string memory){
        return bidderData[BID].pb;
    }
function updateBidderVariable(string memory BID,string memory auctioneerPB) public{
        bidderData[BID].bidderVariable = auctioneerPB;
    }
function fetchVariable(string memory BID) public view returns(string memory){
        return bidderData[BID].bidderVariable;
    }
function updateHighestBidder(string memory currentWinner) public{
    highestBidder = currentWinner;
    }
function updateFlag( uint x) public{
    flag = x;
    }
function fetchFlag() public view returns(uint){
    return flag;
    }
function fetchCurrenthighestBidder() public view returns(string memory){
    return highestBidder;
    }

}