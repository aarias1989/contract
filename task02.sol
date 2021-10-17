
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract task02 {
    
    uint public prod = 1;

    constructor() public {
        
        require(tvm.pubkey() != 0, 101);
        
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    modifier checkOwnerAndAccept() {
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        _;
    } 

    function multiply(uint value) public checkOwnerAndAccept {
        if(value > 0 && value < 11){
            prod *= value;
        }
    }
}
