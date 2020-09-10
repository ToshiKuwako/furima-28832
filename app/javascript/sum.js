

function sum() {

const price = document.getElementById("item-price");
price.addEventListener("input", (e)=>{
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit") ;
  const pricevalue = document.getElementById("item-price").value;
  priceInt=parseInt(pricevalue,10)
  tax.innerHTML = Math.floor(priceInt/10) ;
  profit.innerHTML = Math.floor(priceInt*0.9) ;
});}
window.addEventListener("load", sum);
