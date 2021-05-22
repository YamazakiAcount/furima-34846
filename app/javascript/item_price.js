window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

  const priceAddTax = document.getElementById('add-tax-price');
  priceAddTax.innerHTML = Math.floor(inputValue / 10)

  const priceProfit = document.getElementById('profit');
  priceProfit.innerHTML = Math.floor(inputValue - priceAddTax.innerHTML)
})
});
