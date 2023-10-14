// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AgriChain {
    struct FarmerInfo {
        string food_id;
        string food_name;
        string cultivation_date;
        string location;
        string fertilizer_type;
    }

    mapping(string => FarmerInfo) public farmer_info;

    event UploadInfo(
        string food_id,
        string food_name,
        string cultivation_date,
        string location,
        string fertilizer_type
    );

    address public farmer_hash_address;

    constructor() {
        farmer_hash_address = msg.sender;
    }

    modifier isFarmer() {
        require(farmer_hash_address == msg.sender, "Not a farmer");
        _;
    }

    function addFarmerInfo(
        string memory _food_id,
        string memory _food_name,
        string memory _cultivation_date,
        string memory _location,
        string memory _fertilizer_type
    ) public isFarmer {
        // Check if the food_id already exists
        require(bytes(farmer_info[_food_id].food_id).length == 0, "Food ID already exists");

        farmer_info[_food_id] = FarmerInfo(
            _food_id,
            _food_name,
            _cultivation_date,
            _location,
            _fertilizer_type
        );
        emit UploadInfo(
            _food_id,
            _food_name,
            _cultivation_date,
            _location,
            _fertilizer_type
        );
    }

    function getFarmerInfo(string memory _food_id)
    public
    view
    returns (
        string memory,
        string memory,
        string memory,
        string memory,
        string memory
    )
    {
        FarmerInfo memory info = farmer_info[_food_id];
        return (
        info.food_id,
        info.food_name,
        info.cultivation_date,
        info.location,
        info.fertilizer_type
        );
    }
}
