// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BruteForceMining {
    // Target prefix
    string public targetPrefix = "00000";

    // Store the nonce that produces the desired hash
    uint256 public correctNonce;
    string public correctHash;

    // Store if the correct nonce is found
    bool public nonceFound = false;

    // Brute force the correct nonce that results in a hash starting with the target prefix
    function mine(string memory transaction) public {
        require(!nonceFound, "Nonce already found");

        for (uint256 nonce = 0; nonce < 1000000; nonce++) {
            // Compute the hash with the current nonce
            bytes32 hash = keccak256(abi.encodePacked(transaction, nonce));

            // Check if the first 5 characters of the hash match the target prefix
            if (matchesPrefix(hash)) {
                correctNonce = nonce;
                correctHash = toHexString(hash);
                nonceFound = true;
                break;
            }
        }
    }

    // Helper function to check if the hash starts with '00000'
    function matchesPrefix(bytes32 hash) internal view returns (bool) {
        // Convert the hash to a hex string and compare its first 5 characters
        string memory hashString = toHexString(hash);
        for (uint256 i = 0; i < bytes(targetPrefix).length; i++) {
            if (bytes(hashString)[i] != bytes(targetPrefix)[i]) {
                return false;
            }
        }
        return true;
    }

    // Convert bytes32 to a hex string for comparison purposes
    function toHexString(bytes32 data) internal pure returns (string memory) {
        bytes memory alphabet = "0123456789abcdef";
        bytes memory str = new bytes(64);
        for (uint256 i = 0; i < 32; i++) {
            str[i * 2] = alphabet[uint8(data[i] >> 4)];
            str[1 + i * 2] = alphabet[uint8(data[i] & 0x0f)];
        }
        return string(str);
    }
}
