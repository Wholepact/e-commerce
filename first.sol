pragma solidity ^0.5.0;


contract ecommerce{
    
    string storeName ="My store" ;
    string storeAddress ="A-12,street view";
     uint orderNumber = 0;

     
      struct CustomerDetails{
        string name;
        string Address;
        uint PhoneNumber;
    }
    struct ProductDetails{
       string Name;
       string SKU;
       uint UPC;
       uint Price;
       uint Taxes ;
      uint Shipping;
    }
    mapping(uint256 => CustomerDetails) CustomerId;
    mapping(uint256 => ProductDetails) Products;
    
    
    uint256[] public Customers;
    uint[] public ProductIds;
    
  
    function StoreName() external view returns( string memory ){
        return storeName;
    }
    function StoreAddress() external view returns(string memory){
        return storeAddress;
    }
    function CustomerRecord(string memory name,string memory Address,uint PhoneNumber,uint id) public {
         CustomerDetails storage newCustomer = CustomerId[id];
        newCustomer.name = name;
        newCustomer.Address =Address;
        newCustomer.PhoneNumber =PhoneNumber;
        Customers.push(id);
    }
    function AddProductsDetail(string memory Name,string memory SKU ,uint UPC,uint Price,uint Taxes,uint Shipping,uint id)public{
        Products[id] = ProductDetails(Name,SKU,UPC,Price,Taxes,Shipping);
        ProductIds.push(id);

    }
    function getProduct(uint id) public view returns(string memory Name,string memory SKU ,uint UPC,uint Price,uint Taxes,uint Shipping){
        ProductDetails memory Product =Products[id];
        return(Product.Name,Product.SKU,Product.UPC,Product.Price,Product.Taxes,Product.Shipping);
    }
    function getDetail() public view returns(uint){
        return ProductIds.length;
    }
   function getOrderNumber () public returns( uint){
       orderNumber++;
      return orderNumber;
   }
   function hashHelper(string memory ) public pure returns(bytes32 hash) {
  return keccak256('https://github.com/git-bia19/invoice');
}
}
