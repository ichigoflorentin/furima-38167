window.onload = function() {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const Tax = 0.1;
    const tax_fee = Math.floor(inputValue * Tax);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = tax_fee
    const Profit = inputValue - tax_fee
    const put_profit = document.getElementById("profit");
    put_profit.innerHTML = Profit
  })
}
