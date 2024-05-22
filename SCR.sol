// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.2;
contract Registration {
    struct keysAndBID{
        string RSApublicKey;
        string HEpublicKey;
        string BID;
    }
    struct encUIDToBID{
        string BID;
    }
    mapping(string=> keysAndBID) entityMap;
    mapping (string => encUIDToBID) UIDBIDMap;
    string storeEncryptedUID;
    function store(string memory UID) public {
        storeEncryptedUID = UID;
    }
    function retrieve() public view returns (string memory){
        return storeEncryptedUID;
    }
    function mapEncUIDToBID(string memory encryptedUID, string memory pblc,string memory pblcHE, string memory BID) public {
        UIDBIDMap[encryptedUID] = encUIDToBID(BID);
        submitKeysAndBID(pblc, pblcHE, BID);
    }

    function submitKeysAndBID(string memory pblc,string memory pblcHE,  string memory BID) public{
       // detailsArray[4] = BID
        entityMap[BID] = keysAndBID(pblc,pblcHE,BID);
    }
    function fetchBID(string memory encUID) public view returns(string memory) {
        return UIDBIDMap[encUID].BID;
    }
    function fetchEntityDetails(string memory BID) public view returns(keysAndBID memory){
        return (entityMap[BID]);
    }
}