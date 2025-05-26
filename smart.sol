// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);
}

contract DigitalMarketplace {
    struct Item {
        uint id;
        address seller;
        string name;
        uint price;
        bool isSold;
    }

    IERC20 public paymentToken;
    uint public nextItemId;
    mapping(uint => Item) public items;

    event ItemListed(uint indexed itemId, address indexed seller, string name, uint price);
    event ItemPurchased(uint indexed itemId, address indexed buyer);

    constructor(address _tokenAddress) {
        paymentToken = IERC20(_tokenAddress);
        nextItemId = 1;
    }

    function listItem(string memory _name, uint _price) public {
        require(_price > 0, "Price must be greater than zero.");

        items[nextItemId] = Item({
            id: nextItemId,
            seller: msg.sender,
            name: _name,
            price: _price,
            isSold: false
        });

        emit ItemListed(nextItemId, msg.sender, _name, _price);
        nextItemId++;
    }

    function buyItem(uint _itemId) public {
        Item storage item = items[_itemId];
        require(!item.isSold, "Item already sold.");
        require(msg.sender != item.seller, "Seller cannot buy their own item.");

        bool success = paymentToken.transferFrom(msg.sender, item.seller, item.price);
        require(success, "Token transfer failed.");

        item.isSold = true;
        emit ItemPurchased(_itemId, msg.sender);
    }

    function getItem(uint _itemId) public view returns (Item memory) {
        return items[_itemId];
    }
}
