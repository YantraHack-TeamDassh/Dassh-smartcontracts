//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// product id
// vendor id
// timestamp
// seal-id for each phase

//
contract SupplyChain {
    struct Product {
        string productId;
        address[] vendorId;
        uint256[] timestamp;
        uint256[] passing;
        uint8 counter;
    }

    mapping(string => Product) productMapping;

    // modifier notFailedYet(string memory _productId){
    //     uint length = productMapping[_productId].passing.length;
    //     require(productMapping[productId].passing[length]==1);
    //     ;
    // }

    function approveOrReject(
        string memory _productId,
        address _vendorId,
        bool _decision
    ) public returns (string memory) {
        uint length = productMapping[_productId].passing.length;
        if (length < 1 || productMapping[_productId].passing[length - 1] == 1) {
            if (_decision == false) {
                productMapping[_productId].passing.push(0);
                // add some terminating logic here
                return "aight";
            } else {
                productMapping[_productId].passing.push(1);
                productMapping[_productId].vendorId.push(_vendorId);
                productMapping[_productId].timestamp.push(block.timestamp);
                productMapping[_productId].counter += 1;
                return "no aight";
            }
        } else {
            return "hehe";
        }
    }

    function getStatus(
        string memory _productId
    ) public view returns (uint256[] memory) {
        return (productMapping[_productId].passing);
    }

    function getTimestamp(
        string memory _productId
    ) public view returns (uint256[] memory) {
        return (productMapping[_productId].timestamp);
    }
}
