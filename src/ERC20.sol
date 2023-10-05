// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.21;

contract ERC20 {
    error ERC20__NotEnoughBalance();

    mapping(address => uint256) private _s_balances;

    function name() public pure returns (string memory) {
        return "ERC20 Manual Token";
    }

    function symbol() public pure returns (string memory) {
        return "ERCM";
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return _s_balances[_owner];
    }

    function transfer(address _to, uint256 _value) public {
        if (balanceOf(msg.sender) < _value) {
            revert ERC20__NotEnoughBalance();
        }

        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        _s_balances[msg.sender] -= _value;
        _s_balances[_to] += _value;
        if (balanceOf(msg.sender) + balanceOf(_to) != previousBalances) {
            revert();
        }
    }
}
