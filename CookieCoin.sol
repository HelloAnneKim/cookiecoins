pragma solidity 0.4.18;

import './ERC721.sol';

/**
 * Interface for required functionality in the ERC721 standard
 * for non-fungible tokens.
 *
 * Author: Anne Kim 
 */
contract CookieCoin is ERC721 {
    using SafeMath for uint256;

    uint public constant _totalSupply = 20;

    // Mapping from token ID to owner
    mapping (uint256 => address) private tokenOwner;

    // Mapping from token ID to approved address
    mapping (uint256 => address) private tokenApprovals;

    // Mapping from owner to list of owned token IDs
    mapping (address => uint256[]) private ownedTokens;

    // Mapping from token ID to index of the owner tokens list
    mapping(uint256 => uint256) private ownedTokensIndex;

    /
    function CookieCoin() {
        balance[msg.sender] = _totalSupply;
    }

    function totalSupply() public view returns (uint256 _totalSupply) {
        return _totalSupply;
    }


    function balanceOf(address _owner) public view returns (uint256 _balance) {
        return ownedTokens[_owner].length;
    }

    /**
      * @dev Gets the list of tokens owned by a given address
      * @param _owner address to query the tokens of
      * @return uint256[] representing the list of tokens owned by the passed address
      */
    function tokensOf(address _owner) public view returns (uint256[]) {
        return ownedTokens[_owner];
}

    function ownerOf(uint256 _tokenId) public view returns (address _owner) {
        return ownedTokens[_owner];
    }

    function approve(address _to, uint _tokenId) public {
        bool _owns;
        _owns = ownerOf(_tokenId) == msg.sender;
        require(_owns(msg.sender, _tokenId));
        allowances[_tokenId] = _to;
    }

    function getApproved(uint _tokenId) public view returns (address _approved) {
        return tokenIdToApprovedAddress[_tokenId];
    }


    function transferFrom(address _from, address _to, uint _tokenId) public;


    function transfer(address _to, uint _tokenId) public;

    function implementsERC721() public view returns (bool _implementsERC721);

    // Events
    event Transfer(address indexed _from, address indexed _to, uint256 _tokenId);
    event Approval(address indexed _owner, address indexed _approved, uint256 _tokenId);


    // Optional
    // function name() public view returns (string name) {
        //return "CookieCoin"
    //}
    // function symbol() public view returns (string symbol) {
        //return "CC"
    //}
    // function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256 tokenId) {
        //TODO
    //}
    // function tokenMetadata(uint256 _tokenId) public view returns (string infoUrl) {
        //TOD
    //}
}


