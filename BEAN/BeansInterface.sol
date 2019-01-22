
import "./Beans.sol";

contract BeansInterface {
  function transfer(address _to, uint256 _value) returns (bool);
  function balanceOf(address _owner) constant returns (uint256 balance);
  function transfer_beans(msg.sender. amount);    //FAKE CODE
}

contract BeansInterface is Beans {
  // now you are forced to have matching functions with definition
}
