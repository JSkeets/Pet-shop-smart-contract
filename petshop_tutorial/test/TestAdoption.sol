pragma solidity ^0.4.11;

import "truffle/Assert.sol";
// Truffle will deploy a fresh instance of the contract being tested to the TestRPC. This smart contract gets the address of
// Deployed contract
import "truffle/DeployedAddresses.sol";

// Contract being tested
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());
}