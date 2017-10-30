pragma solidity ^0.4.11;

import "truffle/Assert.sol";
// Truffle will deploy a fresh instance of the contract being tested to the TestRPC. This smart contract gets the address of
// Deployed contract
import "truffle/DeployedAddresses.sol";

// Contract being tested
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // Testing the adopt() function
    function testUserCanAdoptPet() {
        uint returnedId = adoption.adopt(8);
        uint expected = 8;
        Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
    }

    function testGetAdopterAddressByPetId() {
        // Expected owner is this contract
        address expected = this;
        address adopter = adoption.adopters(8);
        Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() {
        // Expected owner is this contract
        address expected = this;
        // Store adopters in memory rather than in contract's storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[8],expected, "Owner of pet ID 8 should be recorded.");
    }
}